jQuery ->
  $('#branch').change ->
    branch = $('#branch :selected').text()
    $.getScript("http://localhost:3000/partner/enquiries/"+ document.getElementById("reply_id").value + "/branch_to_assign" + "?branch_id="+this.value )



