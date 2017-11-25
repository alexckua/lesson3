// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery

//= require rails-ujs
//= require turbolinks
//= require_tree .
//
//= require bootstrap-sprockets

$(document).on('keyup', '#search-messages', function() {
  Rails.fire(this.form, 'submit');
});


$(document).scroll(function() {
    if ( $(document).scrollTop() == 0 ) {

        if ( $("[rel='prev']").length > 0 ) {

            $("[rel='prev']")[0].click();
        }
    }
})


function scrollToBottom() {
    $("html, body").animate({ scrollTop: $(document).height() }, 1000);
}