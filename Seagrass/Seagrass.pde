int framerate = 50;
int animationFrames = framerate * 2;
int counter = 0;

boolean record = false;

boolean guiShown = true;

void setup() {
  size(800, 800);
  frameRate(framerate);
}

void draw() {
  float percent = (float)counter / (float)animationFrames;

  render(percent);

  if (!record && guiShown) {
    noFill();
    strokeWeight(2);
    stroke(255);
    ellipse(40, 40, 38, 38);

    fill(255, 128);
    noStroke();
    arc(40, 40, 38, 38, -HALF_PI, (percent * TWO_PI) - HALF_PI, PIE);

    fill(255, 255);
    textAlign(LEFT, CENTER);
    text(counter + "/" + animationFrames, 65, 40);

    textAlign(LEFT, BOTTOM);
    text("Press G to toggle the GUI\nPress R to start recording", 21, height-21);
  }

  counter++;
  if (counter > animationFrames) {
    counter = 0;

    if (record) {
      record = false;
    }
  } else if (record) {
    saveFrame("out/frame-" + String.format("%04d", counter) + ".png");
  }
}

void keyReleased() {
  if (keyCode == 71 /* G */) {
    guiShown = !guiShown;
  } else if (!record && keyCode == 82 /* R */) {
    record = true;
    counter = 0;
  }
}

void render(float percent) {
  background(#1565c0);
  
  float xstep = width/9;
  for (int i = 0; i < 20; i++) {
    drawGrass(percent + (float)i/1.25f, i * (xstep/1.5) - xstep/4, height, 60, 40, 5);
  }
}

void drawGrass(float percent, float x, float y, int count, float sweight, float segmentLength) {
  PVector startingPos = new PVector(x, y);

  float sweightDecrease = (float)sweight / (float)count;

  PVector slength = new PVector(0, -segmentLength);

  stroke(#689f38);
  for (int i = 0; i < count; i++) {
    strokeWeight(sweight);
    PVector newAddVector = slength.copy().rotate(map(sin((float)i/(float)8 + (1 - percent) * TWO_PI), -1, 1, -(PI/16), PI/16));
    PVector newPos = startingPos.copy().add(newAddVector);

    line(startingPos.x, startingPos.y, newPos.x, newPos.y);

    startingPos = newPos;
    sweight -= sweightDecrease;
  }
}
