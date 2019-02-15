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
  background(128,0,128);

  //translate(width/2, height/2);

  noFill();
  noStroke();
  
  float baser = 600;
  float step = 100;
  
  float r1 = map(sin(percent * TWO_PI), -1, 1, baser-step, baser+step);
  fill(255,0,0);
  ellipse(width/2, height/2, r1, r1);
  
  
  float r2 = map(sin(0.3+percent * TWO_PI), -1, 1, (baser-step)-step, (baser-step)+step);
  fill(255,128,0);
  ellipse(width/2, height/2, r2, r2);
  
  float r3 = map(sin(0.6+percent * TWO_PI), -1, 1, (baser-2*step)-step, (baser-2*step)+step);
  fill(255,255,0);
  ellipse(width/2, height/2, r3, r3);
  
}
