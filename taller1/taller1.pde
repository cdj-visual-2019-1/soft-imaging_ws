PGraphics pg, pg2, pg3;
PImage photo, photoGray;
int heightImg;
PGraphics[] pgMask;
PImage[] photoMask;
String[] titleMask;

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

PImage applyMask(PImage original, double mask[][]) {
  PImage image = original;
  int[] dy = {0, 0,  1, -1, 1, -1, -1,  1, 0};
  int[] dx = {1, -1, 0,  0, 1, -1,  1, -1, 0};  
  int i, j, a, b, tmpRed, tmpGreen, tmpBlue;
  image.loadPixels();
  
  for (int r = 0; r < image.height; r++) {
    for (int c = 0; c < image.width; c++) {
      tmpRed = tmpGreen = tmpBlue = 0;
       for (int k = 0; k < dx.length; k++) {
         a = dx[k] + 1;
         b = dy[k] + 1;
         i = r + a;
         j = c + b;
         if (0 <= i && i < image.height && 0 <= j && j < image.width) {           
           tmpRed +=   red(image.get(i, j))   * mask[a][b];
           tmpGreen += green(image.get(i, j)) * mask[a][b];
           tmpBlue +=  blue(image.get(i, j))  * mask[a][b];           
         }
       }
       
       image.set(r, c, color(tmpRed, tmpGreen, tmpBlue)); 
    }
  }
  
  image.updatePixels();
  return image;
}


void setup() {
  size(1024, 900);
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
  photoGray = grayScale(photo, 0.3333, 0.3333, 0.3333);
  pg2.image(photoGray, 0, 0);
  pg2.endDraw();
  pg3.beginDraw();
  pg3.image(grayScale(photo, 0.212, 0.701, 0.087 ), 0, 0);
  pg3.endDraw();
  
  titleMask = new String[3];
  titleMask[0] = "Detección de bordes";
  titleMask[1] = "Enfocar";
  titleMask[2] = "Desenfoque de cuadro";  
  double[][][] masks = {
    { {-1, -1, -1}, {-1, 8, -1}, {-1, -1, -1} },
    { {0, -1, 0}, {-1, 5, -1}, {0, -1, 0} },
    { {1/9.0, 1/9.0, 1/9.0}, {1/9.0, 1/9.0, 1/9.0}, {1/9.0, 1/9.0, 1/9.0} }
  };
  pgMask = new PGraphics[masks.length];
  photoMask = new PImage[masks.length];
  
  
  for (int i = 0; i < pgMask.length; i++) {
    photoMask[i] = loadImage("castle.png");
    photoMask[i].resize(300,0);
    heightImg = photoMask[i].height;
    pgMask[i] = createGraphics(300, heightImg);
    pgMask[i].beginDraw();
    pgMask[i].image(applyMask(photoMask[i], masks[i]), 0, 0);
    pgMask[i].endDraw();
  }
  
}

void draw() {
  text("Original", 20, 30);
  text("Promedio", 340, 30);
  text("Luma", 660, 30);
  image(pg, 20, 40);
  image(pg2, 340, 40);
  image(pg3, 660, 40);
  
  for (int i = 0; i < 3; i++) {
    text(titleMask[i], (i * 320) + 20, 390);
    image(pgMask[i], (i * 320) + 20, 400);
  }
    
  int[] hist = new int[256];
  photoGray.loadPixels();
  for (int i = 0; i < photoGray.width*photoGray.height; i += 1) {
    //println("With Colo function: " + color(photoGray.pixels[i]) + "  without: "+int(photoGray.pixels[i]));
    //int which = int(map(i, 0, image.width, 0, 255));  
    //int y = int(map(histRed[which], 0, histMax, image.height, 0));
    //pg3.line(i, photo.height, i, y);
  }
}
