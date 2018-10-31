
  $(document).on('turbolinks:load', function() {
   $('.data-table').DataTable({
      "dom": "Bfrtip",
      "sPaginationType": "full_numbers",
      "oLanguage": {
        "sLengthMenu": "_MENU_ records per page"
      },
      lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "All"]],
      buttons: [
            'copyHtml5',
            'excelHtml5',
            'csvHtml5',
            'pdfHtml5'
        ]

    });
})
