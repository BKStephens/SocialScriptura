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
//= require jquery-ui
//= require jquery-ui/core
//= require jquery-ui/widget
//= require jquery-ui/mouse
//= require jquery-ui/position
//= require jquery-ui/draggable
//= require jquery-ui/droppable
//= require jquery-ui/resizable
//= require jquery-ui/selectable
//= require jquery-ui/sortable
//= require jquery-ui/accordion
//= require jquery-ui/autocomplete
//= require jquery-ui/button
//= require jquery-ui/datepicker
//= require jquery-ui/dialog
//= require jquery-ui/menu
//= require jquery-ui/progressbar
//= require jquery-ui/selectmenu
//= require jquery-ui/slider
//= require jquery-ui/spinner
//= require jquery-ui/tabs
//= require jquery-ui/tooltip
//= require jquery.turbolinks
//= require foundation
//= require turbolinks
//= require mustache
//= require modernizr

window.onload = (
	function(){ 
		$(document).foundation(); 
	});

$(document).ready(function() {
  $(function() {
    $("#search").autocomplete(
    {
      source:'/search.json',
      select: function( event, ui ) {
        $( "#search" ).val( ui.item.name );
      }
    })
  });
});
