void setup() {
  float rand = random(3);
  boolean onlySquares = (random(2) > 1.5) ? true : false;
  boolean randomColors = (random(2) > 1) ? true : false;
  boolean bw = (random(2) > 1) ? true : false;
  boolean whitebg = (random(2) > 1.5) ? true : false;
  
  float r = 0;
  float g = 0;
  float b = 0;
  
  size(600, 300);
      background(255);
      for (int i = 0; i < random(10,5000); i++) {
      float x = random(width);
      float y = random(height);
      if(randomColors){
        r = random(0, 255);
        g = random(0, 255);
        b = random(0, 255);
      }
      if(bw){
        r = 0;
        g = 0;
        b = 0;
      }
      else{
        r = random(150, 255);
        g = random(150, 255);
        b = random(150, 255);
      }
      noStroke();
      fill(r, g, b);
      if(onlySquares) rect(x,y,random(1,100), random(1,100));
      else{
              if(rand <= 1) rect(x,y,random(1,100), random(1,100));
              else ellipse(x, y, random(1,100), random(1,100));
              rand = random(2);
      }
  }
  save("output.png");
  exit();
}