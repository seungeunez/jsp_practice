
$(document).ready(function () {

    //풀다운메뉴 이벤트
    $('.outer-menu').hover(function () {
        $(this).find('.inner-menu').css('display', 'block');
    }, function () {
        $(this).find('.inner-menu').css('display', 'none');
    });

    //masonry layout + imageload plugin //안겹치게끔 해주려고
    $('#main-section').imagesLoaded(function () {
        $('#main-section').masonry({    //여기선 this하면 안 됨 하니깐 겹쳤음.
            itemSelector: '.paper',
            columnWidth: 220,
            isAnimated: true
        });
    });

    //라이트박스 동작
    function showLightBox(obj) { // 라이트박스 보이기

        //선택한 이미지 나옴
        var img_src = obj.getElementsByTagName('img')[0].src;
        $('#random-image').attr('src', img_src);

        //라이트박스 보여짐
        $('#darken-background').show();
        $('#darken-background').css('top', $(window).scrollTop());
        $('body').css('overflow', 'hidden'); // 넘치면 잘라버림
    }

    function hideLightBox() { //라이트박스 숨기기
        $('#darken-background').hide();
        $('body').css('overflow', '');   //원래상태로 돌아감
    }

    //paper 클릭하면 라이트박스 나옴
    $('.paper').click(function () {
        showLightBox(this); // this = .paper
    });

    //클릭시 라이트박스 나옴
    $('#darken-background').click(function () {
        hideLightBox();
    });

    $('#lightbox').click(function (e) {  //e = event
        e.stopPropagation(); // 클릭이벤트 하위 객체에 전달 금지 (라이트박스를 클릭했을 때 안닫히게 해줌)
    });

});
