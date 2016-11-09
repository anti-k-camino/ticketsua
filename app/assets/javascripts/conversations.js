$(document).ready(function () {    
    setInterval(refreshPartial, 600000)
});


function refreshPartial() {
  $.ajax({
    url: "/conversations/refresh_messages"
 })
}
