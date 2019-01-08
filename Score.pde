class Score {
  PFont font;
  PVector pos;
  int score;
  color col;
  
  Score() {
    font = loadFont("font.vlw");
    pos = new PVector(15, 62);
    col = color(255, 255, 255);
    score = 0;
  }
  
  void update() {
    score += 1;
  }
  
  void reset() {
    score = 0;
  }
  
  void show() {
    textFont(font);
    fill(col);
    textSize(64); 
    text(score, pos.x, pos.y);
  }
}
