//속도


$(window).scroll(function(){
    let value =  window.scrollY;

    $('#text').css('margin-top',value*2.0 +'px');

    $('#leaf').css({
        'top' : value*-0.45+'px',
        'left' : value*1.2 + 'px'
    });

    $('#hill1').css('top',value * 0.2 + 'px');

    $('#hill2').css('top',value * 0.3 + 'px');

    $('#hill3').css('top',value * 0.5 + 'px');
    
    $('#hill4').css({
        'top' :value*0.5 +'px',
        'left' :value*-1.2+'px'
    });

    $('#hill5').css({
        'top' :value*0.5 +'px',
        'left' :value*1.2+'px'
    });

});





