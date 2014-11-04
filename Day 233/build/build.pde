int mode = 1;

//MODE:
//0 -> black
//1 -> bright
//2 -> white
//b(16777216)

PImage img;

String imgFileName = "input";
String fileType = "jpg";

int loops = 10;

int blackValue = -8999000; //Threshold for black mode
int brigthnessValue = 75; //Threshold for brightness mode
int whiteValue = 32900; //Threshold for white mode

int warp = 60; //experimental value

int row = 0;
int column = 0;
boolean saved = false;

void setup() {
  img = loadImage(imgFileName+"."+fileType);
  size(img.width, img.height);
  image(img, 0, 0);
}


void draw() {
  // Load and process pixel columns
  while(column < width-1) {
    img.loadPixels(); 
    sortColumn();
    column++;
    img.updatePixels();
  }
  // Load and process pixel rows
  while(row < height-1) {
    img.loadPixels(); 
    sortRow();
    row++;
    img.updatePixels();
  }
  
  image(img,0,0);
  if(!saved && frameCount >= loops) {
    saveFrame("../output/"+imgFileName+"_"+mode+".png");
    saveFrame("../output/"+imgFileName+"_"+mode+".jpg");
    saved = true;
    println("DONE "+frameCount);
    System.exit(0);
  }
}


void sortRow() {
  int x = 0;
  int y = row;
  int xend = 0;
  
  while(xend < width-1) {
    switch(mode) {
      case 0:
        x = getFirstNotBlackX(x, y);
        xend = getNextBlackX(x, y);
        break;
      case 1:
        x = getFirstBrightX(x, y);
        xend = getNextDarkX(x, y);
        break;
      case 2:
        x = getFirstNotWhiteX(x, y);
        xend = getNextWhiteX(x, y);
        break;
      default:
        break;
    }
    
    if(x < 0) break;
    
    int sortLength = xend-x;
    
    color[] unsorted = new color[sortLength];
    color[] sorted = new color[sortLength];
    
    for(int i=0; i<sortLength; i++) {
      unsorted[i] = img.pixels[x + i + y * img.width];
    }
    
    sorted = sort(unsorted);
    
    for(int i=0; i<sortLength; i++) {
      img.pixels[x + i + y * img.width] = sorted[i];      
    }
    
    x = xend+1;
  }
}


void sortColumn() {
  int x = column;
  int y = 0;
  int yend = 0;
  
  while(yend < height-1) {
    switch(mode) {
      case 0:
        y = getFirstNotBlackY(x, y);
        yend = getNextBlackY(x, y);
        break;
      case 1:
        y = getFirstBrightY(x, y);
        yend = getNextDarkY(x, y);
        break;
      case 2:
        y = getFirstNotWhiteY(x, y);
        yend = getNextWhiteY(x, y);
        break;
      default:
        break;
    }
    
    if(y < 0) break;
    
    int sortLength = yend-y;
    
    color[] unsorted = new color[sortLength];
    color[] sorted = new color[sortLength];
    
    for(int i=0; i<sortLength; i++) {
      unsorted[i] = img.pixels[x + (y+i) * img.width];
    }
    
    sorted = sort(unsorted);
    
    for(int i=0; i<sortLength; i++) {
      img.pixels[x + (y+i) * img.width] = sorted[i];
    }
    
    y = yend+1;
  }
}


//BLACK X
int getFirstNotBlackX(int _x, int _y) {
  int x = _x;
  int y = _y;
  color c;
  while((c = img.pixels[x + y * img.width]) < blackValue) {
    x++;
    if(x >= width) return -1;
  }
  return x;
}

int getNextBlackX(int _x, int _y) {
  int x = _x+1;
  int y = _y;
  color c;
  while((c = img.pixels[x + y * img.width]) > blackValue) {
    x++;
    if(x >= width) return width-1;
  }
  return x-1;
}

//BLACK Y
int getFirstNotBlackY(int _x, int _y) {
  int x = _x;
  int y = _y;
  color c;
  if(y < height) {
    while((c = img.pixels[x + y * img.width]) < blackValue) {
      y++;
      if(y >= height) return -1;
    }
  }
  return y;
}

int getNextBlackY(int _x, int _y) {
  int x = _x;
  int y = _y+1;
  color c;
  if(y < height) {
    while((c = img.pixels[x + y * img.width]) > blackValue) {
      y++;
      if(y >= height) return height-1;
    }
  }
  return y-1;
}

//BRIGHTNESS X
int getFirstBrightX(int _x, int _y) {
  int x = _x;
  int y = _y;
  color c;
  while(brightness(c = img.pixels[x + y * img.width]) < brigthnessValue) {
    x++;
    if(x >= width) return -1;
  }
  return x;
}

int getNextDarkX(int _x, int _y) {
  int x = _x+1;
  int y = _y;
  color c;
  while(brightness(c = img.pixels[x + y * img.width]) > brigthnessValue) {
    x++;
    if(x >= width) return width-1;
  }
  return x-1;
}

//BRIGHTNESS Y
int getFirstBrightY(int _x, int _y) {
  int x = _x;
  int y = _y;
  color c;
  if(y < height) {
    while(brightness(c = img.pixels[x + y * img.width]) < brigthnessValue) {
      y++;
      if(y >= height) return -1;
    }
  }
  return y;
}

int getNextDarkY(int _x, int _y) {
  int x = _x;
  int y = _y+1;
  color c;
  if(y < height) {
    while(brightness(c = img.pixels[x + y * img.width]) > brigthnessValue) {
      y++;
      if(y >= height) return height-1;
    }
  }
  return y-1;
}


//WHITE X
int getFirstNotWhiteX(int _x, int _y) {
  int x = _x;
  int y = _y;
  color c;
  while((c = img.pixels[x + y * img.width]) > whiteValue) {
    x++;
    if(x >= width) return -1;
  }
  return x;
}

int getNextWhiteX(int _x, int _y) {
  int x = _x+1;
  int y = _y;
  color c;
  while((c = img.pixels[x + y * img.width]) < whiteValue) {
    x++;
    if(x >= width) return width-1;
  }
  return x-1;
}

//WHITE Y
int getFirstNotWhiteY(int _x, int _y) {
  int x = _x;
  int y = _y;
  color c;
  if(y < height) {
    while((c = img.pixels[x + y * img.width]) > whiteValue) {
      y++;
      if(y >= height) return -1;
    }
  }
  return y;
}

int getNextWhiteY(int _x, int _y) {
  int x = _x;
  int y = _y+1;
  color c;
  if(y < height) {
    while((c = img.pixels[x + y * img.width]) < whiteValue) {
      y++;
      if(y >= height) return height-1;
    }
  }
  return y-1;
}
