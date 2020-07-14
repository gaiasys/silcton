Rails.application.routes.draw do
  root :to => 'site#land'

  get '/lab/:id' => 'lab#land', :as => :lab_land
  get '/study/:study_id/finish' => 'study#finish', :as => :study_finish
  post '/study/:study_id/finish' => 'study#finish'

  get '/study/:study_id/instrument/:instrument_id' => 'study#instrument', :as => :study_instrument
  post '/study/:study_id/instrument/:instrument_id' => 'study#instrument'

  get '/study/:study_id' => 'study#start', :as => :study_start
  post '/study/:study_id' => 'study#start'


  devise_for :experimenters

  namespace :experimenter do
    root :to => 'site#dashboard'
    put '/participants/:id' => 'participants#update'
    get 'shared_data', to: 'site#shared_data', as: :shared_data
    resources :experimenters
    resources :labs
    resources :studies do
      get 'data', :on => :member
      resources :participants do
        resources :virtual_navigation_logs, :only => :show
      end
    end
  end
end
