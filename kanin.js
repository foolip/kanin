var time = 0;
var frags = 0;
var ammo = 6;
var allowShoot = true;

var sprites = {
  bunny: [],
  ammo: [],
  blood: []
};

// Firefox compat, other browsers automatically make these available
// on the window object, or some such...
var introduction = document.getElementById("introduction");
var game = document.getElementById("game");
var startkanin = document.getElementById("startkanin");
var kaninbg = document.getElementById("kaninbg");
var reload = document.getElementById("reload");
var progress = document.getElementById("progress");
var results = document.getElementById("results");

// populate sprites without using querySelector or
// getElementsByClassName, as neither works in IE6.
(function () {
  var elems = document.getElementsByTagName("*");
  for (var i = 0; i < elems.length; i++) {
    var spriteClass = elems[i].className;
    if (spriteClass in sprites) {
      sprites[spriteClass].push(elems[i]);
    }
  }
})();

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

/** Animate a splash of blood centered at the event coordinates. */
function splash(e) {
  animate(sprites.blood, e.clientX, e.clientY, 100);
}

/** Return one of the items at random */
function choice(items) {
  return items[Math.floor(Math.random()*items.length)];
}

var playSound;
if (document.createElement("audio").play) {
  // Use HTML5 <audio>
  playSound = function(id) {
    var a = document.getElementById(id);
    try {
      a.currentTime = 0;
    } catch (ex) {
      // ugh, setting currentTime can throw
    }
    a.play();
  };
} else if (document.createElement("bgsound").loop) {
  // Use IE <bgsound>
  var elems = document.getElementsByTagName("audio");
  for (var i = elems.length - 1; i >= 0; i--) {
    var audio = elems[i];
    var bgsound = document.createElement("bgsound");
    bgsound.volume = -10000;
    bgsound.src = audio.getAttribute("src");
    bgsound.id = audio.id;
    audio.parentNode.replaceChild(bgsound, audio);
  }
  playSound = function(id) {
    var bgsound = document.getElementById(id);
    bgsound.volume = 0;
    bgsound.src = bgsound.src;
  };
} else {
  // No sound for you!
  playSound = function(id) {};
}

function showAmmo() {
  var i;
  for (i = 0; i < sprites.ammo.length; i++) {
    if (i < ammo) {
      show(sprites.ammo[i]);
    } else {
      hide(sprites.ammo[i]);
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

function showBunny() {
  var bunny, minTime, maxTime, hideDelay, nextDelay;

  bunny = choice(sprites.bunny);
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

function shoot(e) {
  if (!e) e = window.event; // IE rocks
  if (!e.target) e.target = e.srcElement; // IE rocks again
  if (allowShoot) {
    if (ammo > 0) {
      dontShoot();
      hide(e.target);
      splash(e);
      playSound('frag');
      ammo--;
      showAmmo();
      frags++;
    } else {
      playSound('click');
    }
  }
}

startkanin.onmousedown = function(e) {
  if (!e) e = window.event; // IE rocks
  hide(startkanin);
  splash(e);
  playSound('frag');
  setTimeout(startGame, 500);
};

(function() {
  var i;
  for (i = 0; i < sprites.bunny.length; i++)
    sprites.bunny[i].onmousedown = shoot;
})();

kaninbg.onmousedown = function() {
  if (allowShoot) {
    if (ammo > 0) {
      playSound('miss');
      dontShoot();
      ammo--;
      showAmmo();
    } else {
      playSound('click');
    }
  }
};

reload.onmousedown = function() {
  if (allowShoot) {
    playSound('load');
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
