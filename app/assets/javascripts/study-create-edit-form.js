$(document).on('turbolinks:load', function() {
  var reorderInstruments = function() {
    $('#instruments-in-study-table tbody tr:visible').each(function(index, element) {
      $('.order-field', element).val(index);
      $('.order', element).text(index + 1);
    });
  };

  var addInstrument = function() {
    var newInstrument;
    switch ($('body').find('#instrument-to-add-select').val()) {
      case "Virtual SILCton Demographics Questionnaire":
        newInstrument = { instrument: 'Vambler Demographics' };
        break;
      case "SBSOD (fixed order)":
        newInstrument = { instrument: 'SBSOD', randomize: false };
        break;
      case "PSAS (short version, randomized)":
        newInstrument = { instrument: 'PSAS', version: 'short', randomize: true };
        break;
      case "PSAS (long version, randomized)":
        newInstrument = { instrument: 'PSAS', version: 'long', randomize: true };
        break;
      case "PVAS (randomized)":
        newInstrument = { instrument: 'PVAS', randomize: true };
        break;
      case "MRT (forced wait)":
        newInstrument = { instrument: 'MRT', force_wait: true };
        break;
      case "Virtual SILCton Route Learning (Main Routes)":
        newInstrument = { instrument: 'Vambler Route Learning', version: 'Main Routes' };
        break;
      case "Virtual SILCton Route Learning (Connector Routes)":
        newInstrument = { instrument: 'Vambler Route Learning', version: 'Connector Routes' };
        break;
      case "Virtual SILCton Route Learning (Main Routes A)":
        newInstrument = { instrument: 'Main Routes A' };
        break;
      case "Virtual SILCton Route Learning (Main Routes B)":
        newInstrument = { instrument: 'Main Routes B' };
        break;
      case "Virtual SILCton Route Learning (Connector Routes C1)":
        newInstrument = { instrument: 'Connector Routes C1' };
        break;
      case "Virtual SILCton Route Learning (Connector Routes C2)":
        newInstrument = { instrument: 'Connector Routes C2' };
        break;
      case "Virtual SILCton On-site Pointing":
        newInstrument = { instrument: 'Vambler On-site Pointing' };
        break;
      case "Virtual SILCton Off-site Pointing":
        newInstrument = { instrument: 'Vambler Off-site Pointing' };
        break;
      case "Virtual SILCton Distance Estimates":
        newInstrument = { instrument: 'Vambler Distance Estimates' };
        break;
      case "Virtual SILCton Map Arrangements":
        newInstrument = { instrument: 'Vambler Map Arrangement' };
        break;
      case "Virtual SILCton Free Exploration":
        newInstrument = { instrument: 'Silcton Free Exploration' };
        break;
    }

    newInstrument['order'] = $('body').find('#instruments-in-study-table tbody tr').length + 1;
    newInstrument['actualOrder'] = $('body').find('#instruments-in-study-table tbody tr:visible').length + 1;
    console.log(newInstrument);

    var template = [
      '<tr>',
      '  <td>',
      '    <span class="order"><%= order %></span>',
      '    <input type="hidden" class="order-field" name="study[instrument_in_studies_attributes][<%= order - 1 %>][order]" value= "<%= actualOrder - 1 %>">',
      '  </td>',
      '  <td>',
      '    <%= instrument %>',
      '    <input type="hidden" name="study[instrument_in_studies_attributes][<%= order - 1 %>][instrument]" value= "<%= instrument %>">',
      '  </td>',
      '  <td>',
      '    <% if (typeof(version) != "undefined") { %>',
      '      <%= version %>',
      '      <input type="hidden" name="study[instrument_in_studies_attributes][<%= order - 1 %>][version]" value= "<%= version %>">',
      '    <% } %>',
      '  </td>',
      '  <td>',
      '    <% if (typeof(randomize) != "undefined") { %>',
      '      <%= randomize ? "yes" : "no" %>',
      '      <input type="hidden" name="study[instrument_in_studies_attributes][<%= order - 1 %>][randomize]" value= "<%= randomize %>">',
      '    <% } %>',
      '  </td>',
      '  <td>',
      '    <a class="btn btn-danger remove-local-button">Remove</a>',
      '    <input class="destroy-field" type="hidden" value="false" name="study[instrument_in_studies_attributes][<%= order - 1 %>][_destroy]" id="study_instrument_in_studies_attributes_<%= order - 1 %>__destroy">',
      '  </td>',
      '</tr>'
    ].join("\n");

    $('body').find('#instruments-in-study-table tbody').append(_.template(template)(newInstrument));

    reorderInstruments();
  };

  $(document).off('click', '.remove-button');
  $(document).on('click', '.remove-button', function(event) {
    $(event.currentTarget).siblings('input.destroy-field').val('true');
    $(event.currentTarget).parents('tr').hide();
    reorderInstruments();
  });

  $(document).off('click', '#add-button');
  $(document).on('click', '#add-button', addInstrument);

  $(document).off("click", '.remove-local-button');
  $(document).on("click", '.remove-local-button', function(event) {
    $(event.currentTarget).parents('tr').remove();
    reorderInstruments();
  });

  // Return a helper with preserved width of cells
  // http://www.foliotek.com/devblog/make-table-rows-sortable-using-jquery-ui-sortable/
  var fixHelper = function(e, ui) {
    ui.children().each(function() {
      $(this).width($(this).width());
    });
    return ui;
  };

  // make the list sortable
  $('#instruments-in-study-table tbody').sortable({
    helper: fixHelper,
    stop: reorderInstruments
  });
});
