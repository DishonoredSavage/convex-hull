class Point {
  int x;
  int y;
  
  public Point(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  void display() {
    strokeWeight(4);
    stroke(255);
    point(x,y);
  }
  
  boolean isLeftOfLine(Point a, Point b) {
    return ((x - a.x)*(b.y-a.y)-(y-a.y)*(b.x-a.x)) > 0;
  }
    
  void printPt() {
    println("x: " + x + ",y: " + y);
  }
 
}
