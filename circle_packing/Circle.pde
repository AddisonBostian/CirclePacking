class Circle {
  float x,y,r;
  final float growth = 1;
  boolean growing = true;
  Circle(float x_, float y_) {
    x = x_;
    y = y_;
    r = 2;
  }

  void show() {
    noFill();
    strokeWeight(2);
    stroke(255);
    ellipse(x,y,r*2,r*2);
  }
  
  void grow(){
    if(growing)
      r+=growth;
  }
  
  boolean edges(){
    return (x + r > width || x - r < 0 || y + r > height || y - r < 0);
  }
}