class Circle {
  float x,y,r;
  final float growth = 1;
  boolean growing = true;
  Circle(float x_, float y_) {
    x = x_;
    y = y_;
    r = 2;
  }
//draws the circle on screen at stored x, y values with radius r.
  void show() {
    noFill();
    strokeWeight(2);
    stroke(255);
    ellipse(x,y,r*2,r*2);
  }
  //increases the radius by variable growth
  void grow(){
    if(growing)
      r+=growth;
  }
  //returns true if the circle is touching the edges of the screen, false otherwise.
  boolean edges(){
    return (x + r > width || x - r < 0 || y + r > height || y - r < 0);
  }
}
