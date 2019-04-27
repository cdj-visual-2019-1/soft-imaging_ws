PGraphics pg, pg2, pg3;
PImage photo, photoGray;
int heightImg;

PImage grayScale(PImage original, float coefRed, float coefGreen, float coefBlue){
  PImage image = original;
  image.loadPixels();
  float red, blue, green, sum;
  int dimension = image.width * image.height;
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
  //photo = loadImage("landscape.jpg");
  //photo = loadImage("mandrill.png");
  //photo = loadImage("lenna.png");
  photo = loadImage("castle.png");
  photo.resize(300,0);
  heightImg = photo.height;
  pg = createGraphics(300, heightImg);
  pg2 = createGraphics(300, heightImg);
  pg3 = createGraphics(300, heightImg);  
  pg.beginDraw();  
  pg.image(photo, 0, 0);
  pg.endDraw(); 
  pg2.beginDraw();
  photoGray = grayScale(photo, 0.3333, 0.3333, 0.3333 );
  pg2.image(photoGray, 0, 0);
  pg2.endDraw();
  pg3.beginDraw();
  pg3.image(grayScale(photo, 0.212, 0.701, 0.087 ), 0, 0);
  pg3.endDraw();
}

void draw() {
  text("Original", 20, 30);
  text("Promedio", 340, 30);
  text("Luma", 660, 30);
  image(pg, 20, 40);
  image(pg2, 340, 40);
  image(pg3, 660, 40);
  int[] hist = new int[256];
  photoGray.loadPixels();
  for (int i = 0; i < photoGray.width*photoGray.height; i += 1) {
    //println("With Colo function: " + color(photoGray.pixels[i]) + "  without: "+int(photoGray.pixels[i]));
    //int which = int(map(i, 0, image.width, 0, 255));  
    //int y = int(map(histRed[which], 0, histMax, image.height, 0));
    //pg3.line(i, photo.height, i, y);
  }
}
