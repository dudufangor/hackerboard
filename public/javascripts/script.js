$(function(){
  // USING MODERNIZR
  if (!Modernizr.inputtypes.search) {
    $("html").addClass("no-search-input");
  }

  $.getJSON("/questions")
    .success(function(questions){
      console.log(questions);
    })
  ;
});
