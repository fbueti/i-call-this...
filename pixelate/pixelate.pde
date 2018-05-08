void setup() {
  float rand = random(2);
  size(576, 922);
      background(255);
      for (int i = 0; i < random(10,5000); i++) {
      float x = random(width);
      float y = random(height);
      float r = random(0, 255);
      float g = random(0, 255);
      float b = random(0, 255);
      noStroke();
      fill(r, g, b);
      if(rand <= 1) rect(x,y,random(1,100), random(1,100));
      else ellipse(x, y, random(1,100), random(1,100));
  }
  save("output.png");
  exit();
}