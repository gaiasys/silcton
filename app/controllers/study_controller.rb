class StudyController < ApplicationController
  def start
    @study = Study.find(params[:study_id])
    if request.post?
      @participant = Participant.new(participant_params)
      @participant.study = @study

      @study.latest_identification = @participant.identification

      # only for Virtual Ambler
      if params[:commit] == "Take Study with Mouse"
        cookies[:input] = "mouse"
      elsif params[:commit] == "Take Study with Joystick"
        cookies[:input] = "joystick"
      end
      
      if @study.save() and @participant.save() and cookies[:participant_id] = @participant.id
        redirect_to study_instrument_path({:study_id => @study.id, :instrument_id => 0})
      else
        flash[:error] = "Error starting the study. Did you complete all of the identification questions?"
      end
    else
      @participant = Participant.new(uuid: SecureRandom.uuid)
    end
  end
  
  def instrument
    # make sure the participant has actually started the study
    # otherwise send them back to the beginning
    if not cookies[:participant_id]
      return redirect_to study_start_path(params[:study_id])
    end

    @study = Study.find(params[:study_id])
    @instrument = @study.instrument_in_studies.find_by_order(params[:instrument_id])
    @participant = Participant.find(cookies[:participant_id])
    
    # SPATIAL ABILITY INSTRUMENTS
    if @instrument.instrument == "SBSOD"
      if request.post?
        sbsod = SbsodRecord.new(sbsod_params)
        sbsod.participant = @participant
        sbsod.randomized = @instrument.randomize
        if sbsod.save()
          next_instrument(@study, @instrument.order)
        else
          flash[:error] = "Oops! We couldn't save your responses. Did you complete the entire questionnaire?"
        end
      else
        @sbsod_record = SbsodRecord.new
      end
      
    elsif @instrument.instrument == "MRT"
      if request.post?
        mrt = MrtRecord.new
        mrt.participant = @participant
        mrt.force_wait = @instrument.force_wait
        
        responses = []
         (1..20).each do |q|
          responses[q] = ""
           (1..4).each do |c|
            responses[q] << params["q#{q}_c#{c}"] if params["q#{q}_c#{c}"]
          end
          eval "mrt.q#{q} = responses[#{q}]"
        end
        
        if mrt.save()
          next_instrument(@study, @instrument.order)
        else
          flash[:error] = "Oops! We couldn't save your responses. Did you complete the entire questionnaire?"
        end
      else
        @mrt_record = MrtRecord.new
      end
      
    elsif @instrument.instrument == "VV"
      if request.post?
        vv = VvRecord.create(vv_params)
        vv.participant = @participant
        
        if vv.save()
          next_instrument(@study, @instrument.order)
        else
          flash[:error] = "Oops! We couldn't save your responses. Did you complete the entire questionnaire?"
        end
      else
        @vv_record = VvRecord.new
      end
      
    elsif @instrument.instrument == "PF"
      if request.post?
        pf = PfRecord.new
        pf.participant = @participant
        pf.force_wait = @instrument.force_wait
        
        responses = []
         (1..20).each do |q|
          responses[q] = ""
          responses[q] = params["q#{q}"] if params["q#{q}"]
          eval "pf.q#{q} = responses[#{q}]"
        end
        
        if pf.save()
          next_instrument(@study, @instrument.order)
        else
          flash[:error] = "Oops! We couldn't save your responses. Did you complete the entire questionnaire?"
        end
      else
        @pf_record = PfRecord.new
      end
      
    elsif @instrument.instrument == "PVAS"
      if request.post?
        pvas = PvasRecord.new(pvas_params)
        pvas.participant = @participant
        pvas.randomized = @instrument.randomize
        if pvas.save()
          next_instrument(@study, @instrument.order)
        else
          flash[:error] = "Oops! We couldn't save your responses. Did you complete the entire questionnaire?"
        end
      else
        @pvas_record = PvasRecord.new
      end
      
    elsif @instrument.instrument == "PSAS"
      if request.post?
        psas = PsasRecord.new(psas_params)
        psas.participant = @participant
        psas.randomized = @instrument.randomize
        psas.length = @instrument.version
        if psas.save()
          next_instrument(@study, @instrument.order)
        else
          flash[:error] = "Oops! We couldn't save your responses. Did you complete the entire questionnaire?"
        end
      else
        @psas_record = PsasRecord.new
      end
      
      # VAMBLER INSTRUMENTS
    elsif @instrument.instrument == "Vambler Demographics"
      if request.post?
        vambler_demographics_record = VamblerDemographicsRecord.new(vambler_demographics_record_params)
        vambler_demographics_record.participant = @participant
        if vambler_demographics_record.save()
          next_instrument(@study, @instrument.order)
        else
          flash[:error] = "Oops! We couldn't save your responses. Did you complete the entire questionnaire?"
        end
      else
        @vambler_demographics_record = VamblerDemographicsRecord.new
      end
    
    elsif @instrument.instrument == "Silcton Free Exploration"
      @virtual_environment = VirtualEnvironment.find_by_name("Ambler")
      if request.post?
        if params[:virtual_navigation_log].present? &&
           params[:virtual_navigation_log][:log].present?
          VirtualNavigationLog.create(
            :participant => @participant, 
            :virtual_environment => @virtual_environment,
            :log => params[:virtual_navigation_log][:log],
            :route => @instrument.instrument
          )
        end
        next_instrument(@study, @instrument.order)
      end

    elsif @instrument.instrument == "Vambler Route Learning"
      # GET
      @virtual_environment = VirtualEnvironment.find_by_name("Ambler")
      
      if @instrument.version == "Main Routes"
        # if this is the first main route learning
        if @participant.vambler_main_routes_order.nil?
          if @study.participants.where(vambler_main_routes_order: 'AB').count > @study.participants.where(vambler_main_routes_order: 'BA').count
            @participant.vambler_main_routes_order = "BA"
            @participant.save()
            @route = "B"
            @route_order = "first"
          else
            @participant.vambler_main_routes_order = "AB"
            @participant.save()
            @route = "A"
            @route_order = "first"
          end
          # or if this is the second main route learning  
        elsif @participant.vambler_main_routes_order == "AB"
          @route = "B"
          @route_order = "second"
        elsif @participant.vambler_main_routes_order == "BA"
          @route = "A"
          @route_order = "second"
        end
      elsif @instrument.version == "Connector Routes"
        # if this is the first connector route learning
        if @participant.vambler_connector_routes_order.nil?
          if @study.participants.where(vambler_connector_routes_order: '12').count > @study.participants.where(vambler_connector_routes_order: '21').count
            @participant.vambler_connector_routes_order = "21"
            @participant.save()
            @route = "C2"
            @route_order = "first"
          else
            @participant.vambler_connector_routes_order = "12"
            @participant.save()
            @route = "C1"
            @route_order = "first"
          end
          # or if this is the second connector route learning
        elsif @participant.vambler_connector_routes_order == "12"
          @route = "C2"
          @route_order = "second"
        elsif @participant.vambler_connector_routes_order == "21"
          @route = "C1"
          @route_order = "second"
        end
      end
      # POST
      if request.post?
        if params[:virtual_navigation_log].present? &&
           params[:virtual_navigation_log][:log].present? &&
           params[:virtual_navigation_log][:route].present?
          VirtualNavigationLog.create(
            :participant => @participant,
            :virtual_environment => @virtual_environment,
            :log => params[:virtual_navigation_log][:log],
            :route => params[:virtual_navigation_log][:route]
          )
        end
        next_instrument(@study, @instrument.order)
      end
    elsif ['Main Routes A', 'Main Routes B', 'Connector Routes C1', 'Connector Routes C2'].include?(@instrument.instrument)
      @virtual_environment = VirtualEnvironment.find_by_name("Ambler")

      route_info = @participant.route_info
      route_info[@instrument.instrument] = (route_info[@instrument.instrument] || 0) + 1

      if @instrument.instrument == "Main Routes A"
        @route = "A"
      elsif @instrument.instrument == "Main Routes B"
        @route = "B"
      elsif @instrument.instrument == "Connector Routes C1"
        @route = "C1"
      elsif @instrument.instrument == "Connector Routes C2"
        @route = "C2"
      end
      @route_order = route_info[@instrument.instrument]
      
      @participant.route_info = route_info
      @participant.save()

      if request.post?
        if params[:virtual_navigation_log].present? &&
          params[:virtual_navigation_log][:log].present? &&
          params[:virtual_navigation_log][:route].present?
          VirtualNavigationLog.create(
            :participant => @participant,
            :virtual_environment => @virtual_environment,
            :log => params[:virtual_navigation_log][:log],
            :route => params[:virtual_navigation_log][:route]
          )
        end
        next_instrument(@study, @instrument.order)
      end
    elsif @instrument.instrument == "Vambler On-site Pointing"
      @virtual_environment = VirtualEnvironment.find_by_name("Ambler")
      if request.post?
        @virtual_direction_test = VirtualDirectionTest.new
        @virtual_direction_test.participant = @participant
        @virtual_direction_test.virtual_environment = @virtual_environment
        @virtual_direction_test.style = "onsite"
        total_direction_estimates = params["total_direction_estimates"]
        (0 .. Integer(total_direction_estimates)).each do |i|
          virtual_direction_estimate = VirtualDirectionEstimate.new
          virtual_direction_estimate.virtual_direction_test = @virtual_direction_test
          virtual_direction_estimate.start_landmark = VirtualLandmark.find(params[:virtual_direction_estimates]["#{i}"][:start_landmark_id])
          virtual_direction_estimate.facing_landmark = VirtualLandmark.find(params[:virtual_direction_estimates]["#{i}"][:facing_landmark_id])
          virtual_direction_estimate.target_landmark = VirtualLandmark.find(params[:virtual_direction_estimates]["#{i}"][:target_landmark_id])
          virtual_direction_estimate.bearing = params[:virtual_direction_estimates]["#{i}"][:bearing]
          virtual_direction_estimate.save()
        end
        if @virtual_direction_test.save
          next_instrument(@study, @instrument.order)
        else
          flash[:error] = "Oops! We couldn't save your responses. Did you complete the entire questionnaire?"
        end
      else
        @virtual_direction_test = VirtualDirectionTest.new
      end
      
    elsif @instrument.instrument == "Vambler Off-site Pointing"
      @virtual_environment = VirtualEnvironment.find_by_name("Ambler")
      
      if request.post?
        @virtual_direction_test = VirtualDirectionTest.new
        @virtual_direction_test.participant = @participant
        @virtual_direction_test.virtual_environment = @virtual_environment
        @virtual_direction_test.style = "offsite"
          total_direction_estimates = params["total_direction_estimates"]
          (0 .. Integer(total_direction_estimates)).each do |i|
            virtual_direction_estimate = VirtualDirectionEstimate.new
            virtual_direction_estimate.virtual_direction_test = @virtual_direction_test
            virtual_direction_estimate.start_landmark = VirtualLandmark.find(params[:virtual_direction_estimates]["#{i}"][:start_landmark_id])
            virtual_direction_estimate.facing_landmark = VirtualLandmark.find(params[:virtual_direction_estimates]["#{i}"][:facing_landmark_id])
            virtual_direction_estimate.target_landmark = VirtualLandmark.find(params[:virtual_direction_estimates]["#{i}"][:target_landmark_id])
            virtual_direction_estimate.bearing = params[:virtual_direction_estimates]["#{i}"][:bearing]
            virtual_direction_estimate.save()
          end

        if @virtual_direction_test.save
          next_instrument(@study, @instrument.order)
        else
          flash[:error] = "Oops! We couldn't save your responses. Did you complete the entire questionnaire?"
        end
      else
        @virtual_direction_test = VirtualDirectionTest.new
      end
      
    elsif @instrument.instrument == "Vambler Distance Estimates"
      @virtual_environment = VirtualEnvironment.find_by_name("Ambler")
      
      if request.post?
        @virtual_distance_test = VirtualDistanceTest.new
        @virtual_distance_test.participant = @participant
        @virtual_distance_test.virtual_environment = @virtual_environment
        
        if @virtual_distance_test.save()
          total_distance_estimates = params["total_distance_estimates"]
          (0 .. Integer(total_distance_estimates)).each do |i|
            virtual_distance_estimate = VirtualDistanceEstimate.new
            virtual_distance_estimate.virtual_distance_test = @virtual_distance_test
            virtual_distance_estimate.start_landmark = VirtualLandmark.find(params[:virtual_distance_estimates]["#{i}"][:start_landmark_id])
            virtual_distance_estimate.anchor_landmark = VirtualLandmark.find(params[:virtual_distance_estimates]["#{i}"][:anchor_landmark_id])
            virtual_distance_estimate.target_landmark = VirtualLandmark.find(params[:virtual_distance_estimates]["#{i}"][:target_landmark_id])
            virtual_distance_estimate.target_pixel_position = params[:virtual_distance_estimates]["#{i}"][:target_pixel_position]
            virtual_distance_estimate.save()
          end
        
          next_instrument(@study, @instrument.order)
        else
          flash[:error] = "Oops! We couldn't save your responses. Did you complete the entire questionnaire?"
        end
      else
        @virtual_distance_test = VirtualDistanceTest.new
      end
      
    elsif @instrument.instrument == "Vambler Map Arrangement"
      @virtual_environment = VirtualEnvironment.find_by_name("Ambler")
      
      if request.post?
        @virtual_map_arrangement = VirtualMapArrangement.new
        @virtual_map_arrangement.participant = @participant
        @virtual_map_arrangement.virtual_environment = @virtual_environment
        @virtual_environment.virtual_landmarks.each do |landmark|
          piece = VirtualMapArrangementPiece.new
          piece.virtual_map_arrangement = @virtual_map_arrangement
          piece.virtual_landmark = landmark
          piece.upper_left_pixel_x = params["piece-#{landmark.id}-x"]
          piece.upper_left_pixel_y = params["piece-#{landmark.id}-y"]
          piece.placement_order = params["piece-#{landmark.id}-order"]
          piece.save()
        end
        if @virtual_map_arrangement.save()
          next_instrument(@study, @instrument.order)
        else
          flash[:error] = "Oops! We couldn't save your responses. Did you complete the entire questionnaire?"
        end
      else
        @virtual_map_arrangement = VirtualMapArrangement.new
      end
      
    elsif @instrument.instrument == "Static Page"
      @static_page = @instrument.static_page
      if request.post?
        if params[:commit] and params[:commit] == "No, I Don't Agree"
          flash[:info] = "Thanks for your time."
          redirect_to lab_land_path(@study.lab)
        else
          next_instrument(@study, @instrument.order)
        end
      end
    end
  end

  def next_instrument(study, instrument_order_id)
    next_order_id = instrument_order_id + 1
    if next_study = @study.instrument_in_studies.order_greater_or_equal_to(next_order_id)
      flash[:message] = helpers.pluralize(@study.instrument_in_studies.length - next_order_id, "questionnaire") + " left to complete."
      redirect_to study_instrument_path(:study_id => study.id, :instrument_id => next_study.order)
    else
      flash[:message] = "That was the last questionnaire."
      redirect_to study_finish_path(:study_id => study.id)
    end
  end

  def finish
    if not cookies[:participant_id]
      return redirect_to study_start_path(params[:study_id])
    end
    @study = Study.find(params[:study_id])
    @participant = Participant.find(cookies[:participant_id])
  end
  
  # to let us use pluralize here in the controller
  # http://snippets.dzone.com/posts/show/1799
  def helpers
    Helper.instance
  end
  class Helper
    include Singleton
    include ActionView::Helpers::TextHelper
  end
  private
  def participant_params
    params.require(:participant)
          .merge(identification: "%04d" % (participant_identification + 1))
          .permit(:identification, :share_data, :uuid, :pilot_subject)
  end
  def participant_identification
    @study.latest_identification ? @study.latest_identification.to_i : @study.participants.count
  end
  def sbsod_params
    params.require(:sbsod).permit(*SbsodRecord.column_names.map(&:to_sym))
  end
  def vv_params
    params.require(:vv).permit(*VvRecord.column_names.map(&:to_sym))
  end
  def pvas_params
    params.require(:pvas).permit(*PvasRecord.column_names.map(&:to_sym))
  end
  def psas_params
    params.require(:psas).permit(*PsasRecord.column_names.map(&:to_sym))
  end
  def vambler_demographics_record_params
    params.require(:vambler_demographics_record).permit(*VamblerDemographicsRecord.column_names.map(&:to_sym))
  end
end
