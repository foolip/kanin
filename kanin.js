var time = 0;
var frags = 0;
var ammo = 6;
var allowShoot = true;

function show(elm) {
  elm.style.display = 'block';
}

function hide(elm) {
  elm.style.display = 'none';
}

/** Show/hide images centered at (cx, cy) with delay ms between each. */
function animate(imgs, cx, cy, delay) {
  var i = -1;
  function inner() {
    if (i >= 0) {
      hide(imgs[i]);
    }
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

function showAmmo() {
  var imgs, i;
  imgs = [p1, p2, p3, p4, p5, p6];
  for (i = 0; i < imgs.length; i++) {
    if (i < ammo) {
      show(imgs[i]);
    } else {
      hide(imgs[i]);
    }
  }
}

function tick() {
  progress.style.width = time+"%";
  if (time++ < 100) {
    setTimeout(tick, 1000);
  } else {
    endGame();
  }
}

var bunnies = document.getElementsByClassName("bunny");

function showBunny() {
  var bunny, minTime, maxTime, hideDelay, nextDelay;

  bunny = choice(bunnies);
  show(bunny);

  // dataset would have been nice, but...
  minTime = parseInt(bunny.getAttribute("data-min-time"), 10);
  maxTime = parseInt(bunny.getAttribute("data-max-time"), 10);
  hideDelay = minTime + Math.round(Math.random() * (maxTime - minTime));
  setTimeout(function() { hide(bunny); }, hideDelay);

  nextDelay = Math.round(Math.random() * 3000);
  setTimeout(showBunny, nextDelay);
}

function startGame() {
  hide(introduction);
  show(game);
  showAmmo();
  tick();
  showBunny();
}

function endGame() {
  hide(game);
  show(results);
}

function dontShoot() {
  allowShoot = false;
  setTimeout(function() { allowShoot = true; }, 800);
}

function shoot(event) {
  if (allowShoot) {
    if (ammo > 0) {
      dontShoot();
      hide(event.target);
      splash(event.x, event.y);
      playSound('traff.wav');
      ammo--;
      showAmmo();
      frags++;
    } else {
      playSound('click.wav');
    }
  }
}

startkanin.onmousedown = function() {
  hide(startkanin);
  splash(event.x, event.y);
  playSound('traff.wav');
  setTimeout(startGame, 500);
};

stubbkanin.onmousedown = shoot;
framkaninv.onmousedown = shoot;
framkaninh.onmousedown = shoot;
mellankaninv.onmousedown = shoot;
mellankaninh.onmousedown = shoot;
bakkanin.onmousedown = shoot;

kaninbg.onmousedown = function() {
  if (allowShoot) {
    if (ammo > 0) {
      playSound('miss.wav');
      dontShoot();
      ammo--;
      showAmmo();
    } else {
      playSound('click.wav');
    }
  }
};

reload.onmousedown = function() {
  if (allowShoot) {
    playSound('ladda.wav');
    dontShoot();
    setTimeout(function() {
	ammo = 6;
	showAmmo();
      }, 800);
  }
};

window.onload = function() {
  show(startkanin);
};
