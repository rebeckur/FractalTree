private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;
private int col1 = color(108, 68, 40);
private int col2 = color (48, 130, 50, 200);
private int col3 = color(0, 160, 65, 120);
private boolean isFall = false;

public void setup() 
{   
  size(640,480);    
  noLoop(); 
} 
public void draw() 
{   
  background(135, 194, 223);   
  //stroke(0, 160, 65);
  stroke(col1);   
  line(320,480,320,380);   
  drawBranches(320,380,100,3*Math.PI/2);  //will add later 
  seasonButton(50, 430, 50, "Change Seasons");
}
public void mousePressed()
{
  if (mouseX >= 50 && mouseX <= 100 && mouseY >= 430 && mouseY <= 455)
  {
    isFall = !isFall;
  }
  redraw();
}
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  //your code here
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;

  branchAngle = Math.random()*0.5+0.1;
  branchLength*=fractionLength;

  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  
  if (isFall)
  {
    col2 = color(187, 48, 0, 200);
    col3 = color(255, 49, 0, 120);
  }
  else
  {
    col2 = color(48, 130, 50, 200);
    col3 = color(0, 160, 65, 120);
  }
  
  if (branchLength <= 30)
  {
    stroke(col3);
  }
  else if (branchLength <= 70)
  {
    stroke(col2);
  }
  else 
  {
    stroke(col1);
  }
  
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);

  if (branchLength >= smallestBranch)
  {
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  }
} 
public void seasonButton(int x, int y, int len, String season)
{
  fill(255);
  stroke(0);
  rect(x, y, len, len/2);
  fill(0);
  text(season, x+len/8, y+len/3);
}
