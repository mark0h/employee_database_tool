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

//  -----------------------------------------
//   EMPLOYEE PROFILE FUNCTIONS
//  -----------------------------------------
$(document).on('click', '#add_skills_button', function() {
  skill_ids = $('.add_skill_checkbox:checked').map(function() {
    return $(this).attr('data-skill_id');
  }).get();
  console.log("Skill Ids selected: " + skill_ids);

  $.ajax({
    url: "/profile/add_skill",
    type: 'GET',
    data: {skill_list: skill_ids},
    success:function(){
      window.location.reload();
    }
  });

});

$(document).on('click', '#remove_this_skill', function() {
  skill_id = $(this).val();
  console.log("Removing skill: " + skill_id);

  $.ajax({
    url: '/profile/remove_skill',
    type: 'GET',
    data: {skill_id: skill_id},
    success:function(){
      window.location.reload();
    }
  });
});

//  -----------------------------------------
//      FUNCTIONS TO SHOW/HIDE ELEMENTS
//  -----------------------------------------
$(document).on('click', '#employee_apply_to_job', function() {
  submission_text = $('.application_text').val();
  console.log(submission_text);
})

//  -----------------------------------------
//      FUNCTIONS TO SHOW/HIDE ELEMENTS
//  -----------------------------------------
$(document).on('click', '#show_skill_list', function() {
  $('#profile_skill_list').show();
});

$(document).on('click', '#hide_skill_list', function() {
  $('#profile_skill_list').hide();
});

$(document).on('click', '#show_apply_box', function() {
  $('#apply_textbox').show();
});
