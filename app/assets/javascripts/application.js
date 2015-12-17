// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-material-design
//= require turbolinks
//= require_tree .

var isTimerOn = false; 
var tomatoTime = 1500; 
var pauseTime = 300;
var time = tomatoTime;
var interval;
var isTomatoOn = true;
var pause = 120;

function toggleDiv() {
  $(".new-pomodoro").toggle();
  $(".daily-pomodoro").toggle();
}

// function pausetime() {
//   isTimerOn = true;
//   interval = setInterval(function() {
//     if(time == 0) {
//       if(isTomatoOn) { 
//         interrupt();
//       } else {
//         countdown();
//       }
//       return;
//     }
//     updateTimerDisplay(time);
//     time--;
//   }, 999); 
// }

function toggle() {
  if (!isTimerOn){
    isTimerOn = true;
    countdown();
    document.getElementById("toggle").innerHTML = "Pause";
  } else {
    isTimerOn = false;
    clearInterval(interval);
    // time = pause;
    // updateTimerDisplay();
    // pausetime();
    document.getElementById("toggle").innerHTML = "Resume";
  }
}


function countdown() {
  interval = setInterval(function() {
    if(time == 0) {
      if(isTomatoOn) { 
        end();
      } else {
        stop();
      }
      return;
    }
    updateTimerDisplay(time);
    time--;
    $('.dial').val(time).trigger('change');
  }, 999); 
}

function end() {
  isTomatoOn = false;
  isTimerOn = false;
  document.getElementById("countdown").innerHTML = "Pause!";
  document.getElementById("toggle").innerHTML = ":-)";
  clearInterval(interval);
  time = pauseTime;
  $('.dial').val(time).trigger('configure', {'max': 300 });
  setInterval(updateTimerDisplay, 999);
  countdown();
}

function stop() {
  isTomatoOn = true;
  isTimerOn = false;
  clearInterval(interval);
  document.getElementById("toggle").innerHTML = "Start";
  alert("Pause is over!"); 
  time = tomatoTime; 
  updateTimerDisplay();
  toggleDiv();
} 

function interrupt() {
  alert("Pomodoro destroyed"); 
  location.reload();
}

function updateTimerDisplay() {
  var el = document.getElementById("countdown");
  var minutes = Math.floor( time / 60 );
  if (minutes < 10) minutes = '0' + minutes;
  var seconds = time % 60;
  if (seconds < 10) seconds = '0' + seconds;
  var text = minutes + ':' + seconds;
  el.innerHTML = text;
}

// $('.countdown').ClassyCountdown({
//     theme: "flat-colors",
//     end: $.now() + 1500
// });
       

// (function($) {
//   $.fn.countdown = function(options) {
//     var settings = { 'date': null };
//     if(options) {
//       $.extend(settings, options);
//     }

//     this_sel = $(this);
    
//     function count_exec() {
//       eventDate = Date.parse(settings['date']) / 1000; // Parse the date string
//       currentDate =   Math.floor($.now() / 1000); // Find the timestamp for now
//       seconds = eventDate - currentDate; // Find the number of seconds remaining
//       if (seconds <= 0) { // After the event date has passed
//         minutes = 0;
//         seconds = 0;
//       } else {
//         minutes =     Math.floor(seconds / 60);
//         seconds -=    minutes * 60;
//       }
//       this_sel.find('#mins').val(minutes).trigger('change');
//       this_sel.find('#secs').val(seconds).trigger('change');

//     } // End of count_exec();

//     count_exec();

//     interval = setInterval(count_exec, 1000);

//   } // End of the main function
// }) (jQuery);

