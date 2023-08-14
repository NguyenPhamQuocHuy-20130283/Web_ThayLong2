$(function(){
    $('.menu-multi').siblings().css('display','none');

    $('.menu-multi').click(function(){
        $(this).siblings().slideToggle('show');
    });
    $('.dropdown-item').click(function(){
        $('.option-customs').html($(this).html());

    });
    $('.fa-bars').click(function(){
        $('.menu-multi-mobile').show();
        $('.overplay').show();
    });
    $('.fa-times').click(function(){
        $('.menu-multi-mobile').hide();
        $('.overplay').hide();
    });

    $('.products-iphone .owl-carousel').owlCarousel({
        loop:true,
        margin:10,
        nav: true,
        autoplay:true,
        autoplayTimeout:3000,
        autoplayHoverPause:true,
        dots:true,
        navText: ["<span aria-label='Prev'></span>","<span aria-label='Next'></span>"],
        responsive:{
            0:{
                items:1
            },
            600:{
                items:1
            },
            1000:{
                items:1
            }
        }
    });
    $('.introduce-products .owl-carousel').owlCarousel({
        // loop:true,
        margin:10,
        //  autoplay:true,
        // autoplayTimeout:3000,
        autoplayHoverPause:true,
        nav:true,
        dots:false,
        navText: ["<span aria-label='Prev'></span>","<span aria-label='Next'></span>"],
        responsive:{
            0:{
                items:1
            },
            600:{
                items:5
            },
            1000:{
                items:5
            }
        }
    });
    $('.details-product .owl-carousel').owlCarousel({
        loop:true,
        margin:10,
        autoplay:true,
        autoplayTimeout:3000,
        autoplayHoverPause:true,
        nav:true,
        navText: ["<span aria-label='Prev'></span>","<span aria-label='Next'></span>"],
        responsive:{
            0:{
                items:1
            },
            600:{
                items:1
            },
            1000:{
                items:1
            }
        }
    });
    $('.productseen .owl-carousel').owlCarousel({
        loop:true,
        margin:10,
        nav:true,
        autoplay:true,
        autoplayTimeout:3000,
        autoplayHoverPause:true,
        dots:false,
        navText: ["<span aria-label='Prev'></span>","<span aria-label='Next'></span>"],
        responsive:{
            0:{
                items:1
            },
            600:{
                items:3
            },
            1000:{
                items:5
            }
        }
    })

    $('.find-place').click(function(){
        $(this).css('display','none');
        $('.search-place').css('display','block');
    });
    $('.btn-hide').click(function(){
        $('.info-show').css('display','none');
        $('.info-hide').css('display','block');
    });
    $('.btn-show').click(function(){
        $('.info-hide').css('display','none');
        $('.info-show').css('display','block');
    });
    $('#navbar-example2 ul li').click(function(){
        $(this).css('border-bottom','2px solid red');
        $(this).siblings().css('border','0px');
    });
    $('#navbar-example3 a').click(function(){
        $(this).css('border-bottom','2px solid red');
        $(this).siblings().css('border-bottom','0');
    })
    $(window).scroll(function(){
        if($(this).scrollTop() > 1300) $("#navbar-example3").css('position','fixed').css('display','block');
        else $("#navbar-example3").css('display','none');
    });
    $('#modalStarRating .modal-footer button').click(function(){
        const name = $('#modalStarRating div #name-horizontal');
        const phone = $('#modalStarRating div #phone-horizontal');
        const email = $('#modalStarRating div #email-horizontal');
        let hasInvalid = false;

        if(name.val()==''){ name.addClass('invalid');
            hasInvalid=true;
        }
        if(phone.val()==''){ phone.addClass('invalid');
            hasInvalid=true;
        }
        if(email.val()==''){ email.addClass('invalid');
            hasInvalid=true;
        }
        if(hasInvalid)return;
        $('#modalStarRating').css('display','none');
        $('.modal-backdrop').css('display','none');

    })
    $('#modalLoginForm .modal-footer button').click(function(){
        const email = $('#modalLoginForm div #defaultForm-email');
        const pass = $('#modalLoginForm div #defaultForm-pass');
        let hasInvalid = false;

        if(pass.val()==''){ pass.addClass('invalid');
            hasInvalid=true;
        }
        if(email.val()==''){ email.addClass('invalid');
            hasInvalid=true;
        }
        if(hasInvalid)return;
        $('#modalLoginForm').css('display','none');
        $('.modal-backdrop').css('display','none');

    })

    setInterval('updateTimeSale()',1000)
});

function updateTimeSale(){
    const cH = $('.box-time li .hourse');
    const cM = $('.box-time li .minutes');
    const cS = $('.box-time li .second');
    const h = Number.parseInt(cH.text());
    const m = Number.parseInt(cM.text());
    const s = Number.parseInt(cS.text());
    if(s>0){
        cS.text(s-1);
    }
    if(m>0 && s<=0){
        cM.text(m-1);
        cS.text(60)
    }
    if(h>0 && m<=0){
        cH.text(h-1);
        cM.text(60);
    }
}
