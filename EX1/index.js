$(() => {
    let menulevel1 = ["时间长河", "长廊一角", "人物掠影", "关于我们"];
    for (const key in menulevel1) {
        if (Object.hasOwnProperty.call(menulevel1, key)) {
            const element = menulevel1[key];
            $("header .menu").append($("<div class=\"menu" + key + "\"></div>").append("<span class=\"menulevel1\">" + element + "</span>"));
        }
    }
    let menulevel2 = [["黎明前夜", "燎原星火", "曲折前行", "谱写新章"], ["占位符", "占位符", "占位符"], ["占位符", "占位符", "占位符"], []];
    for (const key in menulevel2) {
        if (Object.hasOwnProperty.call(menulevel2, key)) {
            const element = menulevel2[key];
            $("header .menu .menu" + key).append("<ul></ul>");
            // $("header .menu .menu" + key).mouseenter(function () { $(this).find("ul").stop().slideDown(500); });//绑定事件，鼠标悬停展开
            // $("header .menu .menu" + key).mouseleave(function () { $(this).find("ul").stop().slideUp(500); });//鼠标离开升起
            for (let j = 0; j < element.length; j++) {
                $("header .menu .menu" + key + " ul").append("<li>" + element[j] + "</li>");
            }
        }
    }
    var swiper = new Swiper('.swiper', {
        speed: 1000,
        loop: true,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: ".swiper-pagination",
        },
        autoplay: {
            delay: 4000,
            disableOnInteraction: false,
            pauseOnMouseEnter: true,
        },
    });

});