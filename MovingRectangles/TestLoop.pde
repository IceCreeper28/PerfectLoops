int framerate = 50;
int animationFrames = framerate * 10;
int counter = 0;

boolean record = false;

boolean guiShown = true;

void setup() {
  size(800, 800);
  frameRate(60);
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
  background(128, 0, 128);

  int h = height/5;
  
  float x1 = 0;
  float modifiedPercent = map(percent, 0, 0.25, 0, 1) % 1;
  if (modifiedPercent <= 0.5) {
    float start = -width*2;
    float goal = -width;
    
    x1 = Exponential.easeInOut(modifiedPercent, start, goal - start, 0.5);
  } else {
    float start = -width;
    float goal = -width*2;
    
    x1 = Exponential.easeInOut(modifiedPercent - 0.5, start, goal - start, 0.5);
  }

  fill(#2e7d32);
  rect(x1, 0, width*2, h);
  fill(#43a047);
  rect(x1 + width*2, 0, width*2, h);
  
  float x2 = 0;
  modifiedPercent = map((percent + 0.17) * 1, 0, 0.5, 0, 1) % 1;
  
  if (modifiedPercent <= 0.5) {
    float start = -width*2;
    float goal = -width;
    
    x2 = Elastic.easeInOut(modifiedPercent, start, goal - start, 0.5);
  } else {
    float start = -width;
    float goal = -width*2;
    
    x2 = Elastic.easeInOut(modifiedPercent - 0.5, start, goal - start, 0.5);
  }

  fill(#558b2f);
  rect(x2, h, width*2, h);
  fill(#33691e);
  rect(x2 + width*2, h, width*2, h);
  
  float x3 = 0;
  modifiedPercent = map((percent + 0.83) * 1, 0, 0.25, 0, 1) % 1;
  
  if (modifiedPercent <= 0.5) {
    float start = -width*2;
    float goal = -width;
    
    x3 = Quad.easeInOut(modifiedPercent, start, goal - start, 0.5);
  } else {
    float start = -width;
    float goal = -width*2;
    
    x3 = Quad.easeInOut(modifiedPercent - 0.5, start, goal - start, 0.5);
  }

  fill(#43a047);
  rect(x3, h*2, width*2, h);
  fill(#388e3c);
  rect(x3 + width*2, h*2, width*2, h);
  
  float x4 = 0;
  modifiedPercent = map((percent + 0.2) * 1, 0, 0.25, 0, 1) % 1;
  
  if (modifiedPercent <= 0.5) {
    float start = -width*2;
    float goal = -width;
    
    x4 = Bounce.easeOut(modifiedPercent, start, goal - start, 0.5);
  } else {
    float start = -width;
    float goal = -width*2;
    
    x4 = Bounce.easeOut(modifiedPercent - 0.5, start, goal - start, 0.5);
  }

  fill(#689f38);
  rect(x4, h*3, width*2, h);
  fill(#7cb342);
  rect(x4 + width*2, h*3, width*2, h);
  
  float x5 = 0;
  modifiedPercent = map((percent + 0.8) * 1, 0, 0.25, 0, 1) % 1;
  
  if (modifiedPercent <= 0.75) {
    float start = -width*2;
    float goal = -width;
    
    x5 = Cubic.easeOut(modifiedPercent, start, goal - start, 0.75);
  } else {
    float start = -width;
    float goal = -width*2;
    
    x5 = Cubic.easeOut(modifiedPercent - 0.75, start, goal - start, 0.25);
  }

  fill(#66bb6a);
  rect(x5, h*4, width*2, h);
  fill(#4caf50);
  rect(x5 + width*2, h*4, width*2, h);
}

//@t is the current time (or position) of the tween. This can be seconds or frames, steps, seconds, ms, whatever – as long as the unit is the same as is used for the total time d.
//@b is the beginning value of the property.
//@c is the change between the beginning and destination value of the property.
//@d is the total time of the tween.
float noEasing (float t, float b, float c, float d) {
  return c * t / d + b;
}
