$(function(){
    var win_height = $(window).height();
    var panel = $('.product-panel');
	var shade = $('.all-shade');
    $(window).resize(function(e){
        var cur_win_height = $(this).height();
        if(panel.length >= 1 && win_height > cur_win_height){
            panel.css('height','100%');
        }else{
            panel.css('height','80%');
        }
    });
    $('.amount-input').on({
        focus: function(){
            panel.css('height','100%');
        },
        blur: function(){
            panel.css('height','80%');
        }
    });
	
	
    $('.cart_add').click(function(){
        shade.addClass('fade_toggle');
        panel.addClass('active');
    });
    var close = $('.action-close');
    close.click(function(){
        shade.removeClass('fade_toggle');
        panel.removeClass('active');
    });
});
