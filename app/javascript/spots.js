$(function(){
  $("#test").css("color","red")
  $(".hoge").css("color","#00ff7f")
});

$(window).on('load', function(){
  $('body').removeClass('is-slide');
});
 
$(function() {
 
  $('a:not([href^="#"]):not([target])').on('click', function(e){
    e.preventDefault();
    url = $(this).attr('href');
 
    if (url !== '') {
      $('body').addClass('is-slide-in');
 
      setTimeout(function () {
        window.location = url;
      }, 350);
    }
    return false;
  });
 
});

$(function(){
  $('a[href^="#"]').click(function(){
    var speed = 200;
    var href= $(this).attr("href");
    var target = $(href == "#" || href == "" ? 'html' : href);
    var header = $('header').height();
    var position = target.offset().top - header;
    $("html, body").animate({scrollTop:position}, speed, "swing");
    return false;
  });
});

window.onpageshow = function(event) {
	if (event.persisted) {
		 window.location.reload();
	}
};