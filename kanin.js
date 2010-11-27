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

/** Return one of the items at random */
function choice(items) {
  return items[Math.floor(Math.random()*items.length)];
}

function playSound(fil) {
  ljud.src = fil;
}

function starta() {
  hide(introduction);
  show(game);
  showAmmo();
  tagTid();
  showBunny();
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

var bunnies = document.getElementsByClassName("bunny");

function showBunny() {
  var bunny = choice(bunnies);

  show(bunny);

  // dataset would have been nice, but...
  var minTime = parseInt(bunny.getAttribute("data-min-time"));
  var maxTime = parseInt(bunny.getAttribute("data-max-time"));
  var hideDelay = minTime + Math.round(Math.random() * (maxTime - minTime));
  setTimeout(function() { hide(bunny); }, hideDelay);

  var nextDelay = Math.round(Math.random() * 3000);
  setTimeout(showBunny, nextDelay);
}

function skjutInte() {
  farSkjuta = 0;
  setTimeout(function(){farSkjuta=1;}, 800);
}

function traff(event) {
  if (farSkjuta == 1 & ammo > 0) {
    skjutInte();
    hide(event.target);
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
  //antal.value = kaniner;
}

function start(event) {
  hide(startkanin);
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
  show(startkanin);
};
