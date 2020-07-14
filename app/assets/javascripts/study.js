$(document).ready(function () {
  $("#study-participants-table input[id='pilot-subject']").change(function () {
    var participant_id = $(this).closest("tr").attr("data-id");
    $.ajax({
      type: "PUT",
      url: "experimenters/participants/" + participant_id,
      data: { participant: { pilot_subject: this.checked } },
    });
  });
});
