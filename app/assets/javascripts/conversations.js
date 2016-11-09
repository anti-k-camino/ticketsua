$(document).ready(function () {    
    setInterval(refreshPartial, 3000)
});


function refreshPartial() {
  $.ajax({
    url: "/conversations/refresh_messages"
 })
}
