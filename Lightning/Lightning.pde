int startX;
int startY;
int endX;
int endY;
int lightningColorR =(int) (Math.random() * 255);
int lightningColorG =(int) (Math.random() * 255);
int lightningColorB =(int) (Math.random() * 255);

void setup() {
  size(800, 500);
  strokeWeight(4);
  background(220);
  startX = 0;
  startY = 150; 
  endX = 0;
  endY = 150;
}
void draw() {

  while (endX < 800) {
    stroke(lightningColorR, lightningColorG, lightningColorB);
    endX = startX + (int)(Math.random() * 50);
    endY = startY + (int)((Math.random() * 50) - 25);
    line(startX, startY, endX, endY);
    startX = endX;
    startY = endY;
  }
}
void mousePressed() {
  startX = 0;
  startY = 150; 
  endX = 0;
  endY = 150;
  lightningColorR =(int) (Math.random() * 255);
  lightningColorG =(int) (Math.random() * 255);
  lightningColorB =(int) (Math.random() * 255);
}
