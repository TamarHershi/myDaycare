// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


$(document).ready(function() {

  $('.child-image').click(function(e) {
    event.preventDefault();
    var input = $(this)
    var link = $(this).closest(".col-md-4").find(".child-details a");
    var url = link.attr("href") + "/attend";
    console.log(url);

    $.ajax(url, {
      type: "POST"
    })
      .done(function(data) {
      console.log("Done!");
       console.log(data);
       input.addClass('attend');
      })
      .fail(function() {
        console.log("FAIL");
        $(clubDiv).addClass('fails');
      })
      .always(function() {
        console.log("ALWAYS");
        //will always happen - fail or sucess
      });
    });

  // $('.googleplus').click(function(e) {
  //   event.preventDefault();
  //   var input = $(this);
  //   console.log(input);
  //   var url = '/auth/google'
  //
  //   $.ajax(url, {
  //     type: "GET"
  //   })
  //     .done(function(data) {
  //     console.log("Done!");
  //      console.log(data);
  //     })
  //     .fail(function() {
  //       console.log("FAIL");
  //     })
  //     .always(function() {
  //       console.log("ALWAYS");
  //       //will always happen - fail or sucess
  //     });
  //   });


});
