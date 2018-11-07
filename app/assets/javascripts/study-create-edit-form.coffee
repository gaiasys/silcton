$(document).on 'turbolinks:load', ->
  reorderInstruments = ->
    $('#instruments-in-study-table tbody tr:visible').each (index, element) ->
      $('.order-field', element).val(index)
      $('.order', element).text(index + 1)


  addInstrument = ->
    switch $('body').find('#instrument-to-add-select').val()
      when "Virtual SILCton Demographics Questionnaire"
        newInstrument =
          instrument: 'Vambler Demographics'
      when "SBSOD (fixed order)"
        newInstrument =
          instrument: 'SBSOD'
          randomize: false
      when "PSAS (short version, randomized)"
        newInstrument =
          instrument: 'PSAS'
          version: 'short'
          randomize: true
      when "PSAS (long version, randomized)"
        newInstrument =
          instrument: 'PSAS'
          version: 'long'
          randomize: true
      when "PVAS (randomized)"
        newInstrument =
          instrument: 'PVAS'
          randomize: true
      when "MRT (forced wait)"
        newInstrument =
          instrument: 'MRT'
          force_wait: true
      when "Virtual SILCton Route Learning (Main Routes)"
        newInstrument =
          instrument: 'Vambler Route Learning'
          version: 'Main Routes'
      when "Virtual SILCton Route Learning (Connector Routes)"
        newInstrument =
          instrument: 'Vambler Route Learning'
          version: 'Connector Routes'
      when "Virtual SILCton On-site Pointing"
        newInstrument =
          instrument: 'Vambler On-site Pointing'
      when "Virtual SILCton Off-site Pointing"
        newInstrument =
          instrument: 'Vambler Off-site Pointing'
      when "Virtual SILCton Distance Estimates"
        newInstrument =
          instrument: 'Vambler Distance Estimates'
      when "Virtual SILCton Map Arrangements"
        newInstrument =
          instrument: 'Vambler Map Arrangement'
      when "Virtual SILCton Free Exploration"
        newInstrument =
          instrument: 'Silcton Free Exploration'


    newInstrument['order'] = $('body').find('#instruments-in-study-table tbody tr').length + 1
    newInstrument['actualOrder'] = $('body').find('#instruments-in-study-table tbody tr:visible').length + 1
    console.log(newInstrument)
    $('body').find('#instruments-in-study-table tbody').append(_.template('
      <tr>
        <td>
          <span class="order"><%= order %></span>
          <input type="hidden" class="order-field" name="study[instrument_in_studies_attributes][<%=
          order - 1 %>][order]" value= "<%= actualOrder - 1 %>">
        </td>
        <td>
          <%= instrument %>
          <input type="hidden" name="study[instrument_in_studies_attributes][<%= order - 1 %>][instrument]" value= "<%= instrument %>">
        </td>
        <td>
          <% if (typeof(version) != "undefined") { %>
            <%= version %>
            <input type="hidden" name="study[instrument_in_studies_attributes][<%= order - 1 %>][version]" value= "<%= version %>">
          <% } %>
        </td>
        <td>
          <% if (typeof(randomize) != "undefined") { %>
            <%= randomize ? "yes" : "no" %>
            <input type="hidden" name="study[instrument_in_studies_attributes][<%= order - 1 %>][randomize]" value= "<%= randomize %>">
          <% } %>
        </td>
        <td>
          <a class="btn btn-danger remove-local-button">Remove</a>
          <input class="destroy-field" type="hidden" value="false"
            name="study[instrument_in_studies_attributes][<%= order - 1 %>][_destroy]"
            id="study_instrument_in_studies_attributes_<%= order - 1 %>__destroy">
        </td>
      </tr>
    ')(newInstrument))


    reorderInstruments()
  $(document).off 'click', '.remove-button'
  $(document).on 'click', '.remove-button', (event) ->
    $(event.currentTarget).siblings('input.destroy-field').val 'true'
    $(event.currentTarget).parents('tr').hide()
    reorderInstruments()

  $(document).off 'click', '#add-button'
  $(document).on 'click', '#add-button', addInstrument
  $(document).off "click", '.remove-local-button'
  $(document).on "click", '.remove-local-button', (event) ->
    $(event.currentTarget).parents('tr').remove()
    reorderInstruments()

  # Return a helper with preserved width of cells
  # http://www.foliotek.com/devblog/make-table-rows-sortable-using-jquery-ui-sortable/
  fixHelper = (e, ui) ->
    ui.children().each () ->
      $(this).width($(this).width())
    return ui

  # make the list sortable
  $('#instruments-in-study-table tbody').sortable
    helper: fixHelper
    stop: reorderInstruments
