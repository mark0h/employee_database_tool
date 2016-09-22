

$(document).ready(function() {
  alert("WELCOME!! yea");
});

$(document).on('click','#group_select_button', function() {
  var group_selected = $('input[type=radio][name=group_select]:checked').val();
  console.log("Selected: " + group_selected);

});


function setup_user_required() {
  window.location.href = '/user_setup';
};
