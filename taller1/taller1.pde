PGraphics pg, pg2, pg3, pg4;
PImage photo, photoGray;
int heightImg;
int[] histo = new int[256];

PImage grayScale(PImage original, Boolean luma){
  PImage image = original;
  image.loadPixels();
  float red, blue, green, sum, coefRed, coefGreen, coefBlue;  
  int dimension = image.width * image.height;
  if(luma) {
    coefRed = 0.2126;
    coefGreen = 0.7152;
    coefBlue = 0.0722;
  }
  else {
    coefRed = coefGreen = coefBlue = 1.0/3.0; 
  }
  for(int i = 0; i < dimension; i+=1){
    red = red(image.pixels[i]);
    blue = blue(image.pixels[i]);
    green = green(image.pixels[i]);
    sum = coefRed*red + coefGreen*green + coefBlue*blue;
    image.pixels[i] = color(sum);    
  }
  image.updatePixels();
  return image;
}

void setup() {
  size(1024, 576);
  background(0);
  textSize(30);
  photo = loadImage("landscape.jpg");
  //photo = loadImage("mandrill.png");
  //photo = loadImage("lenna.png");
  //photo = loadImage("castle.png");
  photo.resize(300,0);
  heightImg = photo.height;
  pg = createGraphics(300, heightImg);
  pg2 = createGraphics(300, heightImg);
  pg3 = createGraphics(300, heightImg);
  pg4 = createGraphics(300, heightImg);
  pg.beginDraw();  
  pg.image(photo, 0, 0);
  pg.endDraw(); 
  pg2.beginDraw();
  photoGray = grayScale(photo, false);
  pg2.image(photoGray, 0, 0);
  pg2.endDraw();
  pg3.beginDraw();
  pg3.image(grayScale(photo, true ), 0, 0);
  pg3.endDraw();
  int[] hist = new int[256];
  photo.loadPixels();
  
  int dimension = photo.width * photo.height;
  for(int i = 0; i < dimension; i+=1){
       
    int bright = int(brightness(photo.pixels[i]));
    histo[bright] += 1;
  }
  int histMax = max(histo);
  
  
  
  pg4.beginDraw();
  pg4.stroke(255);
   for (int i = 0; i < pg4.width; i += 1) {  
    int which = int(map(i, 0, pg4.width, 0, 255));  
    int y = int(map(histo[which], 0, histMax, pg4.height, 0));
    pg4.line(i, pg4.height, i, y);
  }
  pg4.endDraw();
   
}

void draw() {
  text("Original", 20, 30);
  text("Promedio", 340, 30);
  text("Luma", 660, 30);
  image(pg, 20, 40);
  image(pg2, 340, 40);
  image(pg3, 660, 40);
  
  image(pg4, 660, 60+heightImg);
}
