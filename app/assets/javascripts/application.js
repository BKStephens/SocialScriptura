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
//= require jquery.tokeninput
//= require foundation
//= require jquery.turbolinks
//= require turbolinks
//= require mustache
//= require modernizr

window.onload = (function(){ $(document).foundation(); });

// $("#search").tokenInput("/search.json");
$(function() {
  $('#search').tokenInput('/search.json', { 
  	crossDomain: false, 
  	theme: "custom",
  	preventDuplicates: true,
  	resultsLimit: 50,
    minChars: 3
  });
});