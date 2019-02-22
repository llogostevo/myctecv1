//Reference - https://www.tutorialspoint.com/How-can-I-show-and-hide-div-on-mouse-click-using-jQuery

$(document).ready(function(){
    $('#burger-menu-icon').click(function() {
      $('#main-menu').toggle("slide");
    });
});