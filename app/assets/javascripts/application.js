// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require cocoon
//= require bootstrap
//= require jquery.ui.all



$(function(){
  $('.datepicker').datepicker({ dateFormat: "yy-mm-dd" });
  //$('.currency').currencyFormat();
  
  //$('body').on('keyup','input', function(e){
  fields = $('.grid');	
  $('.grid').keyup(function(e){
  	
  	if(e.which == 39) //right
  	{
  		
  		console.log(fields.next());
  		
  	}
  	if(e.which == 37) //left
  	{
  		
  		
  	}
  	if(e.which == 40) //down
  	{
  		
  	}
  	if(e.which == 38) //up
  	{
  		
  	}
  });
});
