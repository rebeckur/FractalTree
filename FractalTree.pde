private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;
private int r = 108;
private int g = 68;
private int b = 40;

public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 
public void draw() 
{   
	background(135, 194, 223);   
	//stroke(0, 160, 65);
	stroke(r, g, b);   
	line(320,480,320,380);   
	drawBranches(320,380,100,3*Math.PI/2);  //will add later 
}
public void mousePressed()
{
	r = 108;
	g = 68;
	b = 40;
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

	stroke(r, g, b);
	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);

	r-=7;
	g+=10;
	b++;

	if (branchLength > smallestBranch)
	{
		drawBranches(endX1, endY1, branchLength, angle1);
		drawBranches(endX2, endY2, branchLength, angle2);
	}
} 
