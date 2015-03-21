//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .

function remove_fields(link, name_of_fields) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(name_of_fields).hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}

function check_only_one_checkbox(link) {
  $('input[type="checkbox"]').bind('click',function() {
    $('input[type="checkbox"]').not(this).prop("checked", false);
  });
}
