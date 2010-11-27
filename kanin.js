var farSkjuta = 1;
var nr = 0;
var kaniner = 0;
var ammo = 6;

function show(elm) {
  elm.style.visibility = 'visible';
}

function hide(elm) {
  elm.style.visibility = 'hidden';
}

/** Show/hide images centered at (cx, cy) with delay ms between each. */
function animate(imgs, cx, cy, delay) {
  var i = -1;
  function inner() {
    if (i >= 0)
      hide(imgs[i]);
    i++;
    if (i < imgs.length) {
      var img = imgs[i];
      img.style.left = Math.floor(cx - img.width/2)+'px';
      img.style.top = Math.floor(cy - img.height/2)+'px';
      show(img);
      setTimeout(inner, delay);
    }
  }
  inner();
}

/** Animate a splash of blood centered at (x, y) */
function splash(x, y) {
  animate([blod1, blod2, blod3], x, y, 100);
}

function playSound(fil) {
  ljud.src = fil;
}

function starta() {
  hide(introduction);
  show(game);
  showAmmo();
  tagTid();
  visaKaniner();
}

function showAmmo() {
  var imgs = [p1, p2, p3, p4, p5, p6];
  for (var i = 0; i < imgs.length; i++) {
    if (i < ammo)
      show(imgs[i]);
    else
      hide(imgs[i]);
  }
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
  setTimeout(function(){farSkjuta=1;}, 800);
}

function traff(event) {
  if (farSkjuta == 1 & ammo > 0) {
    skjutInte();
    event.target.style.visibility = 'hidden';
    splash(event.x, event.y);
    playSound('traff.wav');
    ammo--;
    showAmmo();
    kaniner = kaniner + 1;
  } else if (farSkjuta == 1 & ammo == 0) {
    playSound('click.wav');
  }
}

function slut() {
  hide(game);
  show(results);
  antal.value = kaniner;
}

function start(event) {
  startkanin.style.visibility = 'hidden';
  splash(event.x, event.y);
  playSound('traff.wav');
  setTimeout(starta, 500);
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
  if (farSkjuta == 1 & ammo > 0) {
    playSound('miss.wav');
    skjutInte();
    ammo--;
    showAmmo();
  } else if (farSkjuta == 1 & ammo <= 0) {
    playSound('click.wav');
  }
};

reload.onmousedown = function() {
  if (farSkjuta == '1') {
    playSound('ladda.wav');
    skjutInte();
    setTimeout(function() {
	ammo = 6;
	showAmmo();
      }, 800);
  }
};

window.onload = function() {
  startkanin.style.visibility = 'visible';
};
