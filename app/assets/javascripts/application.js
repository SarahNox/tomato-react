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
var tomatoTime = 20; 
var pauseTime = 10;
var time = tomatoTime;
var interval;
var isTomatoOn = true;
var almostASecondInMiliseconds = 999;

// function toggleDiv() {
//   $(".new-pomodoro").toggle();
//   $(".daily-pomodoro").toggle();
// }

function toggle() {
  if (!isTimerOn){
    isTimerOn = true;
    countdown();
    document.getElementById("toggle").innerHTML = " % ";
  } else {
    isTimerOn = false;
    clearInterval(interval);
    document.getElementById("toggle").innerHTML = "Go";
  }
}

function countdown() {
  interval = setInterval(function() {
    if(time == 0) {
      if(isTomatoOn) { 
        end();
        // then display saved project/task
      } else {
        stop();
      }
      return;
    }
    updateTimerDisplay(time);
    time--;
    $('.dial').val(time).trigger('change');
  }, almostASecondInMiliseconds); 
}

function end() {
  isTomatoOn = false;
  isTimerOn = false;
  document.getElementById("countdown").innerHTML = "Pause!";
  document.getElementById("toggle").innerHTML = ":-)";
  clearInterval(interval);
  time = pauseTime;
  $('.dial').val(time).trigger('configure', {'max': pauseTime , 'fgColor' : "#04B45F" });
  setInterval(updateTimerDisplay, almostASecondInMiliseconds);
  countdown();
}

function stop() {
  isTomatoOn = true;
  isTimerOn = false;
  clearInterval(interval);
  document.getElementById("toggle").innerHTML = ">";
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

