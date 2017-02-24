import javax.swing.*;
ArrayList<Circle> list = new ArrayList();
ArrayList<PVector> spots;
PImage i;
void setup() {
  size(600, 400);

  spots = new ArrayList<PVector>(); 
  i = makeImage();
  //i = loadImage("balloons.png");
  i.loadPixels();

  for (int x = 0; x < i.width; x++) {
    for (int y = 0; y<i.height; y++) {
      int index = x + y*i.width;
      color c = i.pixels[index];
      if (brightness(c) > 1) {
        spots.add(new PVector(x, y));
      }
    }
  }
}

void draw() {
  background(0);
  line(0, height-95,width, height-95);
  int count = 0;
  int attempts = 0;
  while (count < 30) {
    if (attempts > 1000) {
      noLoop();
    }
    Circle t = newCircle();

    if (t != null) {
      list.add(t);
      count++;
    }
    attempts++;
  }

  for (Circle c : list) {
    c.show();

    if (c.edges())
      c.growing = false;
    else {
      for (Circle temp : list) {
        float d = dist(c.x, c.y, temp.x, temp.y);
        if (temp != c && d-2 <= c.r + temp.r)
          c.growing = false;
      }
    }

    c.grow();
  }
}

Circle newCircle() {
  //float ranx = random(width);
  //float rany = random(height);

  PVector spot = spots.get(int(random(0, spots.size())));
  float ranx = spot.x;
  float rany = spot.y;
  boolean valid = true;

  for (Circle c : list) {
    float d = dist(ranx, rany, c.x, c.y);
    if (d <= c.r+2) {
      valid  = false;
      break;
    }
  }

  if (valid)
    return new Circle(ranx, rany);
  else
    return null;
}

PImage makeImage() {
  String text = JOptionPane.showInputDialog("Enter a word between 3 and 12 characters for best results:");
  background(0);
  textFont(loadFont("Mono.vlw"), 72);
  textSize((width/text.length())*1.5);
  println(textWidth('H'));
  text(text, 0, height-100);

  PImage temp = createImage(width, height, RGB);
  temp.loadPixels();
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      int index = i + j*width;
      temp.pixels[index] = get(i,j);
    }
  }

  return temp;
}