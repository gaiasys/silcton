$(document).ready(function () {
  $("#study-participants-table input[id='pilot-subject']").change(async function () {
    var participant_id = $(this).closest("tr").attr("data-id");
    $.ajax({
      type: "PUT",
      url: "experimenters/participants/" + participant_id,
      data: { participant: { pilot_subject: this.checked } },
    });
    alert('Particpant updated successfully')
  });

  $("#study-participants-table input[id='participant-id']").blur(async function () {
    var participant_id = $(this).closest("tr").attr("data-id");
    await $.ajax({
      type: "PUT",
      url: "experimenters/participants/" + participant_id,
      data: { participant: { identification: this.value } },
    });
    alert('Particpant updated successfully')
  });
});
