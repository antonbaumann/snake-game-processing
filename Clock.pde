class Clock {
  
  PFont font;
  color col;
  PVector pos;
  
  Clock() {
    this.font = loadFont("font.vlw");
    this.col = color(255);
    this.pos = new PVector(width - 15, 60);
  }
  
  void show() {
    String timeStr = "";
    int minutes = getMinutes();
    int seconds = getSeconds() % 60;
    
    if (minutes > 0) {
      timeStr += minutes + "m ";
    } 
    timeStr += seconds + "s";
  
    textFont(font);
    fill(col);
    textSize(64); 
    textAlign(RIGHT);
    text(timeStr, pos.x, pos.y);
  }
  
  int getSeconds() {
    return millis() / 1000;
  }
  
  int getMinutes() {
    return getSeconds() / 60;
  }
}
