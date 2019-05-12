// Sigma Motion
// https://michaelbach.de/ot/mot-sigma/index.html

int rate, squares, squareLength;

void setup() {
  size(1000, 500);
  background(255);
  frameRate(60);
  squares = 50;
  squareLength = 120;
  rate = 2;
}

void draw() {
 
  if (frameCount % rate < (rate / 2)) squareLength(squares, squareLength, true);  
  else squareLength(squares, squareLength, false);
  
  if (keyPressed) {
    if (key == '+') rate += 2;
    else if (key == '-') rate = rate > 2 ? rate - 2 : rate;
  }
}

void squareLength(int n, int length, boolean invert) {
  int x, y, widthRel = 10;
  for (int i = 0; i < n; i++) {
    fillColor(invert, i);
    x = 30 + i * length / widthRel;
    y = 50;
    noStroke();
    rect(x, y, length / widthRel, length);
  } 
}

void fillColor(boolean invert, int i) {
  if (invert) {
    if (i % 2 == 0) fill(0);
    else fill(255);
  } else {
    if (i % 2 == 0) fill(255);
    else fill(0);
  }
}
