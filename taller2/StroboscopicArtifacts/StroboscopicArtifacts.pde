int[] angles = { 120, 120, 120 };
int angle = 0;
color[] primary = { color(255, 0, 0), color(0, 255, 0), color(0, 0, 255) };

void setup() {
  size(640, 360);
  noStroke();
}

void draw() {
  background(50);
  pieChart(300, angles);
}

void pieChart(float diameter, int[] data) {
  float lastAngle = 0;
  for (int i = 0; i < data.length; i++) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(angle));
    noStroke();
    fill(primary[i]);
    arc(0, 0, diameter, diameter, lastAngle, lastAngle+radians(data[i]));
    lastAngle += radians(data[i]);
    popMatrix();
  }
  angle += 5;
}
