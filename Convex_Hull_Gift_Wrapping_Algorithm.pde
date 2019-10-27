import java.util.List;
import java.util.ArrayList;

Point[] pts;
List<Point> wrap;
Point pointOnHull;
int pohIndex;
int lineToAdd;
boolean displayed;

void setup() {
  frameRate(2);
  fullScreen();
  background(0);
  pts = new Point[100];
  wrap = new ArrayList<Point>();
  pointOnHull = new Point(width, height);
  pohIndex = 0;
  lineToAdd = 0;
  displayed = false;
  genPoints();
  println(pointOnHull.x + " " + pointOnHull.y);
}

void draw() {
  if (!displayed) {
    displayPoints();
    findExtremePoints();
    displayed = !displayed;
  }
  if (lineToAdd < wrap.size())
    joinExtremePoints(lineToAdd++);
  println(lineToAdd);
}

void genPoints() {
  for (int i = 0; i < pts.length; i++) {
    int randX = (int)random(width);
    int randY = (int)random(height);
    if (randX < pointOnHull.x) {
      pointOnHull = new Point(randX, randY);
      pohIndex = i;
    }
    pts[i] = new Point(randX, randY);
  }
}

void displayPoints() {
  for (int i = 0; i < pts.length; i++) {
    pts[i].display();
  }
}

void findExtremePoints() {
  Point endpoint;
  int i = 0;
  do {
    wrap.add(pointOnHull);
    endpoint = pts[0];
    for (int j = 1; j < pts.length; j++) {
      if ((endpoint == pointOnHull) || (pts[j].isLeftOfLine(wrap.get(i), endpoint)))
          endpoint = pts[j];
    }
    i += 1;
    pointOnHull = endpoint;
  } while (endpoint.x != wrap.get(0).x && endpoint.y != wrap.get(0).y);
}

void joinExtremePoints(int i) {
  strokeWeight(1);
  stroke(255, 0, 0);
  if (i == wrap.size()-1) 
    line(wrap.get(i).x, wrap.get(i).y, wrap.get(0).x, wrap.get(0).y);
  else 
    line(wrap.get(i).x, wrap.get(i).y, wrap.get(i+1).x, wrap.get(i+1).y);
}
