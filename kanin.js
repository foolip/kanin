var farSkjuta = 1;
var nr = 0;
var kaniner = 0;

function playSound(fil) {
  ljud.src = fil;
}

function starta() {
  game.style.visibility = 'visible';
  visaPatroner();
  tagTid();
  visaKaniner();
}

function visaPatroner() {
  p1.style.visibility = 'visible';
  p2.style.visibility = 'visible';
  p3.style.visibility = 'visible';
  p4.style.visibility = 'visible';
  p5.style.visibility = 'visible';
  p6.style.visibility = 'visible';
  patroner = 6;
}

function gomPatron() {
  var gom = "p" + patroner +".style.visibility = 'hidden';";
  eval(gom);
  patroner = patroner - 1;
}

function tagTid() {
  progress.style.width = nr+"%";
  if (nr++ < 100) {
    setTimeout(tagTid, 1000);
  } else {
    slut();
  }
}

function visaKaniner() {
  vilken = Math.random() * 60;
  vilken = Math.round(vilken);
  igen = Math.random() * 3000;
  igen = Math.round(igen);
  if (vilken < 10) {
    stubbkanin.style.visibility = 'visible';
    tabort = Math.random() * 600;
    tabort = Math.round(tabort) + 400;
    gommig = "stubbkanin.style.visibility = 'hidden';";
    setTimeout("eval(gommig);", tabort);
  } else if (vilken >= 10 & vilken < 20) {
    framkaninv.style.visibility = 'visible';
    tabort = Math.random() * 1000;
    tabort = Math.round(tabort) + 500;
    gommig = "framkaninv.style.visibility = 'hidden';";
    setTimeout("eval(gommig);", tabort);
  } else if (vilken >= 20 & vilken < 30) {
    framkaninh.style.visibility = 'visible';
    tabort = Math.random() * 1000;
    tabort = Math.round(tabort) + 500;
    gommig = "framkaninh.style.visibility = 'hidden';";
    setTimeout("eval(gommig);", tabort);
  } else if (vilken >=30 & vilken < 40) {
    mellankaninv.style.visibility = 'visible';
    tabort = Math.random() * 600;
    tabort = Math.round(tabort) + 400;
    gommig = "mellankaninv.style.visibility = 'hidden';";
    setTimeout("eval(gommig);", tabort);
  } else if (vilken >=40 & vilken < 50) {
    mellankaninh.style.visibility = 'visible';
    tabort = Math.random() * 600;
    tabort = Math.round(tabort) + 400;
    gommig = "mellankaninh.style.visibility = 'hidden';";
    setTimeout("eval(gommig);", tabort);
  } else if (vilken >=50 & vilken <= 60) {
    bakkanin.style.visibility = 'visible';
    tabort = Math.random() * 1100;
    tabort = Math.round(tabort) + 400;
    gommig = "bakkanin.style.visibility = 'hidden';";
    setTimeout("eval(gommig);", tabort);
  }
  setTimeout("visaKaniner();", igen);
}

function skjutInte() {
  farSkjuta = 0;
  setTimeout("eval(farSkjuta = 1);", 800);
}

function traff(event) {
  if (farSkjuta == 1 & patroner > 0) {
    skjutInte();
    event.target.style.visibility = 'hidden';
    blod1.style.left = event.x - 50 + 'px';
    blod1.style.top = event.y - 50 + 'px';
    blod2.style.left = event.x - 50 + 'px';
    blod2.style.top = event.y - 50 + 'px';
    blod3.style.left = event.x - 50 + 'px';
    blod3.style.top = event.y - 50 + 'px';
    ShowBlod1 = "blod1.style.visibility = 'visible';";
    HideBlod1 = "blod1.style.visibility = 'hidden';";
    ShowBlod2 = "blod2.style.visibility = 'visible';";
    HideBlod2 = "blod2.style.visibility = 'hidden';";
    ShowBlod3 = "blod3.style.visibility = 'visible';";
    HideBlod3 = "blod3.style.visibility = 'hidden';";
    eval(ShowBlod1);
    setTimeout("eval(HideBlod1);", 100);
    setTimeout("eval(ShowBlod2);", 100);
    setTimeout("eval(HideBlod2);", 200);
    setTimeout("eval(ShowBlod3);", 200);
    setTimeout("eval(HideBlod3);", 300);
    playSound('traff.wav');
    gomPatron();
    kaniner = kaniner + 1;
  } else if (farSkjuta == 1 & patroner == 0) {
    playSound('click.wav');
  }
}

function slut() {
  reload.style.visibility = 'hidden';
  countdown.style.visibility = 'hidden';
  results.style.visibility = 'visible';
  antal.value = kaniner;
}

function start() {
  startkanin.style.visibility = 'hidden';
  blod1.style.left = event.x - 50 + 'px';
  blod1.style.top = event.y - 50 + 'px';
  blod2.style.left = event.x - 50 + 'px';
  blod2.style.top = event.y - 50 + 'px';
  blod3.style.left = event.x - 50 + 'px';
  blod3.style.top = event.y - 50 + 'px';
  ShowBlod1 = "blod1.style.visibility = 'visible';"
  HideBlod1 = "blod1.style.visibility = 'hidden';"
  ShowBlod2 = "blod2.style.visibility = 'visible';"
  HideBlod2 = "blod2.style.visibility = 'hidden';"
  ShowBlod3 = "blod3.style.visibility = 'visible';"
  HideBlod3 = "blod3.style.visibility = 'hidden';"
  eval(ShowBlod1);
  setTimeout("eval(HideBlod1);", 100);
  setTimeout("eval(ShowBlod2);", 100);
  setTimeout("eval(HideBlod2);", 200);
  setTimeout("eval(ShowBlod3);", 200);
  setTimeout("eval(HideBlod3);", 300);
  playSound('traff.wav');
  setTimeout("starta();", 500);
  skjutInte();
}

startkanin.onmousedown = start;
stubbkanin.onmousedown = traff;
framkaninv.onmousedown = traff;
framkaninh.onmousedown = traff;
mellankaninv.onmousedown = traff;
mellankaninh.onmousedown = traff;
bakkanin.onmousedown = traff;

kaninbg.onmousedown = function() {
  if (farSkjuta == 1 & patroner > 0) {
    playSound('miss.wav');
    skjutInte();
    gomPatron();
  } else if (farSkjuta == 1 & patroner <= 0) {
    playSound('click.wav');
  }
};

reload.onmousedown = function() {
  if (farSkjuta == '1') {
    playSound('ladda.wav');
    skjutInte();
    setTimeout("visaPatroner();", 800);
  }
};

window.onload = function() {
  startkanin.style.visibility = 'visible';
};
