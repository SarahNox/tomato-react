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

function toggleDiv() {
  $(".new-pomodoro").toggle();
  $(".daily-pomodoro").toggle();
}

function toggle() {
  if (!isTimerOn){
    isTimerOn = true;
    countdown();
    document.getElementById("toggle").innerHTML = "Pause";
  } else {
    isTimerOn = false;
    clearInterval(interval);
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
  }, 1000); 
}

function end() {
  isTomatoOn = false;
  isTimerOn = false;
  document.getElementById("countdown").innerHTML = "Pause for 5 Minutes!";
  document.getElementById("toggle").innerHTML = ":-)";
  clearInterval(interval);
  time = pauseTime;
  setInterval(updateTimerDisplay, 2000);
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
  clearInterval(interval);
  time = tomatoTime;
  updateTimerDisplay();
  alert("Pomodoro destroyed"); 
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

