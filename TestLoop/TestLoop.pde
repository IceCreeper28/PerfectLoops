int animationFrames = 120;
int counter = 0;

boolean record = false;

void setup() {
  size(800, 800);
  frameRate(60);
}

void draw() {
  float percent = (float)counter / (float)animationFrames;

  render(percent);

  if (!record) {
    noFill();
    strokeWeight(2);
    if (percent == 0 || percent == 1) {
      stroke(255, 0, 0);
    } else {      
      stroke(255);
    }
    ellipse(40, 40, 38, 38);
    pushMatrix();
    translate(40, 40);
    rotate(percent * TWO_PI);
    line(0, 0, 0, -19);
    strokeWeight(1);
    fill(255);
    popMatrix();
  }

  counter++;
  if (counter > animationFrames) {
    counter = 0;

    if (record) {
      exit();
    }
  } else if (record) {
    saveFrame("out/frame-####.png");
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
