$(document).ready(function () {
  $("#study-participants-table input[id='pilot-subject']").change(function () {
    var participant_id = $(this).closest("tr").attr("data-id");
    $.ajax({
      type: "PUT",
      url: "experimenters/participants/" + participant_id,
      data: { participant: { pilot_subject: this.checked } },
    }).then(function() {
      alert('Particpant updated successfully')
    });
  });

  $("#study-participants-table input[id='participant-id']").blur(function () {
    var participant_id = $(this).closest("tr").attr("data-id");
    $.ajax({
      type: "PUT",
      url: "experimenters/participants/" + participant_id,
      data: { participant: { identification: this.value } },
    }).then(function() {
      alert('Particpant updated successfully')
    });
  });
});
