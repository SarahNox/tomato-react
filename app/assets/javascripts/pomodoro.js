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
//= require turbolinks
//= require_tree .

var isTimerOn = false;
var tomatoTime = 5; 
var pauseTime = 3;
var time = tomatoTime;
var interval;
var isTomatoOn = true;
var i = 0;


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
  count();
  setTimeout(refresh, 5000);
}

function stop() {
  isTomatoOn = true;
  isTimerOn = false;
  clearInterval(interval);
  document.getElementById("toggle").innerHTML = "Start";
  alert("Pause is over!"); 
  time = tomatoTime; 
  updateTimerDisplay();
  window.location.replace("http://localhost:3000/pomodoros/new");
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

function date() {
  var date = new Date();
  var d  = date.getDate();
  var day = (d < 10) ? '0' + d : d;
  var m = date.getMonth() + 1;
  var month = (m < 10) ? '0' + m : m;
  var yy = date.getYear();
  var year = (yy < 1000) ? yy + 1900 : yy;
  var datetime = day + '/' + month + '/' + year;
  document.getElementById("date").value = datetime;
}

function count() {
  i +=1;
  document.getElementById("counting").value = i;
  date();
}

function refresh()
{
  iframe = document.getElementById("http://localhost:3000/pomodoros");
  location.reload();
}

$(function (){

  var pomodoros = $('#pomodoros');
  var counting = $('#counting');
  var date = $('#date');


  function addPomodoro(pomodoro) {
      pomodoros.append('<li> pomodoros done: '+ pomodoro.counting +', date: '+ pomodoro.date +'</li>');
  }

  // $.ajax({
  //   type: 'GET',
  //   url: '/pomodoros',
  //   success : function(pomodoros) {
  //     $.each(pomodoros, function(counting, date) {
  //       addPomodoro(pomodoro); 
  //     });
  //   },
  //   error: function() {
  //     alert('error loading pomodoros');
  //   }
  // });

  // var pomodoro = {
  //   counting: counting.val(),
  //   date: date.val(),
  // };

  $.ajax({
    type: 'POST',
    url: '/pomodoros',
    data: pomodoros,
    success : function(newPomodoro) {
        addPomodoro(newPomodoro);
      },
    error: function() {
      alert('error saving pomodoros');
    }
  });

});