jQuery(function($) {
	jQuery.extend({
		clock : function clock(target){
				var dayOfTheWeek = new Array("Sun","Mon","Tue","Wed","Thu","Fri","Sat");
				var now  = new Date();
				var month = now.getMonth()+1;
				var date = now.getDate();
				var day = now.getDay();
				var hour = now.getHours();
				var min = now.getMinutes();
				var sec = now.getSeconds();
				if(date < 10) {
					date = "0" + date;
				}
				if(hour < 10) {
					hour = "0" + hour;
				}
				if(min < 10) {
					min = "0" + min;
				}
				if(sec < 10) {
					sec = "0" + sec;
				}
				var time_str =  month + "/" + date  + " " + hour + ":" + min + ":" + sec ;
				
				target.text(time_str);
				setTimeout(function(){
					clock(target)
				},1000);
			}
	});
	
	// 現在日時を表示します。
  jQuery.clock(jQuery(".top__left--time-real"));
  

  function buildHTML(data, i) {
    var Week = new Array(" (Sun) "," (Mon) "," (Tue) "," (Wed) "," (Thu) "," (Fri) "," (Sat) ");
    var date = new Date (data.list[i].dt_txt);
    date.setHours(date.getHours() + 9);
    var month = date.getMonth()+1;
    var day = month + "/" + date.getDate() + " " + Week[date.getDay()] + date.getHours() + "：00";
    var icon = data.list[i].weather[0].icon;
    var html =
    '<div class="weather-report">' +
      '<img src="http://openweathermap.org/img/w/' + icon + '.png">' +
      '<div class="weather-date">' + day + '</div>' +
      '<div class="weather-main">'+ data.list[i].weather[0].main + '</div>' +
      '<div class="weather-temp">' + Math.round(data.list[i].main.temp) + '℃</div>' +
    '</div>';
    return html
  }
  var API_KEY = 'f547112b33b2c75f6d89ad3cd75babff'
  var city = 'Tokyo';
  var url = 'http://api.openweathermap.org/data/2.5/forecast?q=' + city + ',jp&units=metric&APPID=' + API_KEY;
  $.ajax({
    url: url,
    dataType: "json",
    type: 'GET',
  })
  .done(function(data) {
    var insertHTML = "";
    var cityName = '<h2>' + data.city.name + '</h2>';
    $('.top__info').text("Weather Info");
    $('.top__left--weather-city').html(cityName);
    for (var i = 0; i <= 8; i = i + 2) {
      insertHTML += buildHTML(data, i);
    }
    $('.top__left--weather-information').html(insertHTML);
  })
  .fail(function(data) {
    console.log("失敗しました");
  });
});

$(function(){
  $('.iconimage').hover(function(){
    $('.top__right--area-name-window').show();
  },function(){
    $('.top__right--area-name-window').hide();
  });
  $('.top__right--area-name-window').hover(function(){
    $('.top__right--area-name-window').show();
  },function(){
    $('.top__right--area-name-window').hide();
  });
});

$(function(){
  $('.item_info-image').hover(function(){
    $('.item_info-area').show();
  },function(){
    $('.item_info-area').hide();
  });
  $('.item_info-area').hover(function(){
    $('.item_info-area').show();
  },function(){
    $('.item_info-area').hide();
  });
});

$(function(){
  $('.comment__bar--form-submit').on('mousedown',function(){
    $('.fa-paper-plane').click();
  });
});
