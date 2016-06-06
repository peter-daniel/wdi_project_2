//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {

// refresh the whole browser window so that the show all top5 list reflects the changes made in the user iframe list. 
  $('.btn-remove-from5').on('click', function(){
    window.top.location.reload();
  });

//hide the 'no results...' flash message on new search
  $('.btn-large').on('click', function(){
    $('.flash').hide();
  })

});
