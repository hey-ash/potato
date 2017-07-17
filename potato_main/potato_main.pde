float xpos;
float ypos;
float hoopy;
float hoopx;
float m=5;
int left;             
int right;  
boolean over = false;
boolean toss = false;
boolean gravon=false;
color c1=color(230, 100, 10);
float vxtoss;
float vytoss;

void setup() {
  fullScreen();
  xpos=width/2;
  ypos=height/8*6;
  hoopx=width/2;
  hoopy=height/8*3;
  noStroke();
  fill(0);
  left = width/2 - 100;
  right = width/2 + 100;
}

void draw() {
  background(204);
  drawhoop();
  drawball();
  ballover();
  tossball();
  if (gravon) {
    gravity();
  }
}

void drawball() {
  fill(c1);
  ellipse(xpos, ypos, 75, 75);
}

void drawhoop() {
  fill(200, 200, 10);
  ellipse(hoopx, hoopy, 200, 50);
  rectMode(CENTER);
  rect(hoopx, hoopy+50, 200, 50);
}

void gravity() {
  float aygrav = 50/m;
  float vygrav=0;
  vygrav += aygrav;
  ypos += vygrav;
}

void ballover() {
  if ((xpos-50<mouseX)&&(xpos+50>mouseX)&&(ypos-50<mouseY)&&(ypos+50>mouseY)) {
    over = true;
  } else {
    over = false;
  }
  if (over) {
    c1=color(250, 80, 10);
  } else {
    c1=color(230, 100, 10);
  }
}

void tossball() {
  xpos += vxtoss;
  ypos += vytoss;
  if (ypos<300) {
    gravon=true;
  }
}
void toss() {
  if (mousePressed) {
    // if the mouse is held down, the ball location
    // should be the same as the mouse location.
    xpos=mouseX;
    ypos=mouseY;
  } else {
    // otherwise it should be traveling
    // according to its velocity.
    xpos += vxtoss;
    ypos += vytoss;
  }
}
void mouseReleased() {
  vxtoss = mouseX-pmouseX;
  vytoss = mouseY-pmouseY;
}