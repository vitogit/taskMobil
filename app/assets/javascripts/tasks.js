


function toHHMMSS( s)  {
    var sec_num = parseInt(s, 10); // don't forget the second parm
    var hours   = Math.floor(sec_num / 3600);
    var minutes = Math.floor((sec_num - (hours * 3600)) / 60);
    var seconds = sec_num - (hours * 3600) - (minutes * 60);

    if (hours   < 10) {hours   = "0"+hours;}
    if (minutes < 10) {minutes = "0"+minutes;}
    if (seconds < 10) {seconds = "0"+seconds;}
    var time    = hours+':'+minutes+':'+seconds;
    return time;
}


function timer(elementId){
    this.startTime = Date.now();
    this.update(elementId);
    var that = this;
}


timer.prototype.stop=function(){
    clearTimeout(this.timerKey);
}

timer.prototype.update=function(elementId){
    var currTime = new Date();
    var startTime = this.startTime;
    var seconds = toHHMMSS (parseInt((Date.now() - this.startTime ) / 1000) );

    $('#'+elementId).text(seconds);
    var self = this;
    this.timerKey = setTimeout(function(){self.update(elementId);},1000);
}
var timers = [];

function startTimer(timerName) {
    var timerObj = new timer(timerName);
    timers[timerName] = timerObj;
}

function stopTimer(timerName) {
    var timerObj = timers[timerName];
    if(timerObj) timerObj.stop();
}