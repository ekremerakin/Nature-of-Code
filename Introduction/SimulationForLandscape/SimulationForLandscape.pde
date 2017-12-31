float y;
float tx, ty;

int col=100, row=100;
float oldPoints[][] = new float[col+1][row+1];

int boxSize = 15;

void settings() {
  size(1640, 950, P3D);
}

void setup() {
  tx=0;
  ty=10000;
  createLand();
}

void draw() { 
  background(255);
  stroke(0);
  fill(155);
  camera(mouseX, mouseY, height*5/2 , width/2, height/4, 0, 0, 1, 0);
  for(int i=0; i<col; i++) {
    for(int j=0; j<row; j++) {
      if(oldPoints[i][j]<(height/2-70))
        fill(70, 40, 0);
      else if(oldPoints[i][j]<0)
        fill(70, 67, 0);
      else if(oldPoints[i][j]<(height/2+70))
        fill(70, 120, 0);
      
      beginShape(); 
      vertex(i*boxSize    , oldPoints[i][j]    , j*boxSize);
      vertex(i*boxSize    , oldPoints[i][j+1]  , (j+1)*boxSize);
      vertex((i+1)*boxSize, oldPoints[i+1][j+1], (j+1)*boxSize);
      vertex((i+1)*boxSize, oldPoints[i+1][j]  , j*boxSize);     
      vertex(i*boxSize    , oldPoints[i][j]    , j*boxSize);
      endShape();
    }
  }
}

//Creates all the height values and stores them
//in an array.
void createLand() {
  for(int i=1; i<=col+1; i++) {
      ty=0;
    for(int j=1; j<=row+1; j++) {
      y = map(noise(tx, ty), 0, 1, height/2-150, height/2+150);
      ty+=0.1;
      oldPoints[i-1][j-1] = y;
    }
    tx+=0.1;
  }
}