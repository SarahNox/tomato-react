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
var almostASecondInMiliseconds = 999;
var allowedPauseTime = 120;
var pomodoroTimeAtPause = 0;


function askForPermission() {
  if (Notification.permission !== 'denied' || Notification.permission === "default") {
    Notification.requestPermission();
  }
}
askForPermission();

function toggle() {
  if (!isTimerOn && pomodoroTimeAtPause == 0){
    countdown();
  } else if (!isTimerOn) {
    resume();
  } else {
    pause();
  }
}

function countdown() {
  isTimerOn = true;
  document.getElementById("toggle").innerHTML = " II ";
  document.getElementById("pause").style.visibility = "hidden";
  if (interval != undefined) {
    clearInterval(interval);
  }
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
    pomodoroTimeAtPause = time;
    $('.dial').val(time).trigger('change');
  }, almostASecondInMiliseconds); 
}

function end() {
  isTomatoOn = false;
  isTimerOn = false;
  document.getElementById("countdown").innerHTML = "Pause!";
  document.getElementById("toggle").innerHTML = ">";
  document.getElementById("interrupt").disabled = true;
  clearInterval(interval);
  time = pauseTime;
  new Notification('Pomodoro finished', {
    body: 'Whenever you are ready start with your break',
    icon: 'https://raw.githubusercontent.com/SarahNox/tomato/master/app/assets/images/tomato-medium.png'
  });
  $('.dial').val(time).trigger('configure', {'max': pauseTime , 'fgColor' : "#04B45F" });
  setInterval(updateTimerDisplay, almostASecondInMiliseconds);
}

function stop() {
  isTimerOn = false;
  clearInterval(interval);
  document.getElementById("new_pomodoro").submit();
} 

function interrupt() {
  document.getElementById('pomodoro_success').value = false;
  document.getElementById('new_pomodoro').submit();
}

function pause() {
  clearInterval(interval);
  document.getElementById("toggle").innerHTML = "Go";
  document.getElementById("pause").style.visibility = "visible";
  isTimerOn = false;
  time = allowedPauseTime;
  interval = setInterval(function() {
    if(time == 0) {
      if(isTomatoOn) { 
        interrupt();
      }
      return;
    }
    updatePauseDisplay(time);
    time--;
  }, almostASecondInMiliseconds); 
}


function resume() {
  isTomatoOn = true;
  time = pomodoroTimeAtPause;
  countdown();
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

function updatePauseDisplay() {
  var el = document.getElementById("pause");
  var minutes = Math.floor( time / 60 );
  if (minutes < 10) minutes = '0' + minutes;
  var seconds = time % 60;
  if (seconds < 10) seconds = '0' + seconds;
  var text = minutes + ':' + seconds;
  el.innerHTML = text;
}

