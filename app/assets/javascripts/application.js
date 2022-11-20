// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require social-share-button
//= require social-share-button/wechat
//= require bootstrap
//= require masonry/jquery.masonry
//= require_tree .

$(document).on('scroll', function () {
  // Welcome#index - Изменение столбца домашней навигации
	if ($(this).scrollTop() > 125) {
		$('#navbar').addClass('show_bgcolor')
	} else {
		$('#navbar').removeClass('show_bgcolor')
	}

  // Welcome#index - Вернуться к верхней части страницы
  if ($(this).scrollTop() > 100) {
    $(".goTop").fadeIn(100); //Кнопка появляется время (экран движется вниз)
  } else {
    $(".goTop").fadeOut(200); //Кнопка исчезнет (переключите изображение)
  }

  $(".goTop").click(
    function() {
      $('html,body').scrollTop(0);
    });
})


// Products#show - Измените изображение отображения
$(document).on('mouseover', '.list-image', function () {
  var src_other = $(this).attr('src') //Понять путь к картинке маленькой картины
  var src_main = src_other.toString().replace("other", "main") //Измените путь картинки

  $('.main-image').attr('src', src_main) //Изменить путь большой картины

  $('.list-image').removeClass('list-image-active') //Другие картинки удалили состояние блокировки
  $(this).addClass('list-image-active') //Текущее изображение вновь заблокировано
})


// Измените количество покупки
$(document).on('turbolinks:load', function() {
  // Купить больше количества
  $("#quantity-up").click(function(e) {
    var num = parseInt($("#quantity").val());
    var numMax = $("#quantity").attr("max");
    if (num < numMax) {
      $("#quantity").val(num += 1);
    }
    e.preventDefault();
  });

  // Уменьшить количество покупок
  $("#quantity-down").click(function(e) {
    var num = parseInt($("#quantity").val());
    if (num > 1) {
      $("#quantity").val(num -= 1);
    }
    e.preventDefault();
  });

  // Подтвердите, что номером покупки не может быть чрезмерным запасом
  $("#quantity").blur(function(e) {
    var num = parseInt($(this).val());
    var numMax = $(this).attr("max");
    if (num > numMax) {
      num = numMax;
    } else if (num < 0) {
      num = 1
    }
    $(this).val(num);
    e.preventDefault();
  });

  // 确认购买数量不能超库存
  $(".cart-quantity-input").blur(function(e) {
    var num = parseInt($(this).val());
    var numMax = $(this).attr("max");
    if (num > numMax) {
      num = numMax;
    } else if (num < 0) {
      num = 1
    }
    $(this).val(num);
    e.preventDefault();

    var id = $(this).attr("id");
    $.ajax({
      type: "PATCH",
      url: "/cart_items/"+id,
        dataType:'json',
        data:{
          quantity: num
        },
    });

    window.location.reload();
  });
});
