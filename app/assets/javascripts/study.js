$(document).on('turbolinks:load', function() {
  $("#study-participants-table input[id='pilot-subject']").change(function () {
    var participant_id = $(this).closest("tr").attr("data-id");
    $.ajax({
      type: "PUT",
      url: "experimenters/participants/" + participant_id,
      data: { participant: { pilot_subject: this.checked } },
    }).then(function() {
      alert('Participant updated successfully')
    });
  });

  $("#study-participants-table .modify-participant-id").on('click',function () {
    var participant_id = $(this).closest("tr").attr("data-id");
    var identification = $(this).closest("tr").find(".participant-id").val();
    $.ajax({
      type: "PUT",
      url: "experimenters/participants/" + participant_id,
      data: { participant: { identification: identification} },
    }).then(function() {
      alert('Participant updated successfully')
    });
  });

});
