int cols,rows;
int scl = 20;  
int w = 2500;
int h= 1200;
float flying = 0;
//THE 2d array which tracks z pos (height) for points on the terrain//
float[][] terrain;

void setup() 
{
  //creating the window//
  size(600, 600, P3D);
  
  //creating the columns anbd rows for the terrain (scl is the scale or size of the columns and rows//
  cols = w/scl;
  rows = h/scl;
  
  //initailizing the 2d array//
  terrain = new float[cols][rows];
  
}

void draw()
{
  //the speed at which the y-values change to create the flying effect//
    flying -= 0.08;
  
  // changing the yoff variable to create flting effect//
   float yoff = flying;
  
  //giving the z coordinate to the points on the terrain//
  for(int y=0; y<rows; y++)
  {
    float xoff = 0;
    
    for(int x=0; x<cols; x++)
    {
      terrain[x][y] = map(noise(xoff,yoff), 0, 1, -100, 100);
      
      xoff+=0.2;
      
    }
    yoff+=0.2;
  } 
  //setting the background stroke weight and color and fill//
  background(0);
  strokeWeight(1);
  stroke(255);
  noFill();
  //trasnlating to the center of the canvas to rotate//
  translate(width/2, height/2);
  //rotating 60 degrees to properly view the terrain//
  rotateX(PI/3);
  
  //translating back to the top left of the canvas to draw the terrain
  translate(-w/2, -h/2);
  
  //drawing the terrain as many triangle strips//
  for(int y=0; y<rows-1; y++)
  {
    beginShape(TRIANGLE_STRIP);
    for(int x=0; x<cols; x++)
    {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
    }
    endShape();
  }
  
}