                                      //Read the comments in the render function
int framerate = 50;                   //Adjust your framerate. IN my opinion 50fps works well. 60fps seems not to work.
int animationFrames = framerate * 2;  //Adjust the duration of your animation in seconds
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
  //Your drawing code here.
  //percent is a number between 0 and 1 wich indicates the progress in the animation.
  //Base your animation on this number, and make sure it loops to the starting point when percent reaches 1.
  //
  //Have fun :3
  background(0);
}
