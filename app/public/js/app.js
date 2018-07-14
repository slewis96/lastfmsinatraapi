function showPage() {
  $("#searchform").submit(function(){
    event.preventDefault();
    search();
  })
  $.when($('#loader').fadeOut(800))
                     .done(function() {
                       document.getElementById("loader").style.display = "none";
                       $('#page').fadeIn(1800);
  });
}
function search(){
  var query = $("#search").val().toLowerCase().replace(/ /g,"+");
  window.location.replace("/search/"+query);
}
