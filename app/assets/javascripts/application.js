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
//= require twitter/bootstrap
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .


function setup_user_required() {
  window.location.href = '/user_setup';
};


$(document).on('click', '#change_password', function() {
  window.location.href = '/users/edit';
});

$(document).on('change', '#salary_or_hourly_select', function() {
  var hourly_or_salary = $(this).val();
  if(hourly_or_salary == 'salary') {
    $('#pay_amount_text').html("per Month")
  } else {
    $('#pay_amount_text').html("per Hour")
  }
});

// $("input[type=number]").keypress(function(event) {
//     if (!event.charCode) return true;
//     ch = String.fromCharCode(event.charCode);
//     return (/[\d]/.test(ch));
// });

// $("#salary_or_hourly_select").change(function(){
//   var hourly_or_salary = $(this).val();
//   if(hourly_or_salary == 'salary') {
//     $('#pay_amount_text').html("per Month")
//   } else {
//     $('#pay_amount_text').html("per Hour")
//   }
//
// });
