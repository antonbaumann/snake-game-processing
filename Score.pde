class Score {
  PFont font;
  PVector pos;
  int score;
  color col;
  
  Score() {
    font = loadFont("font.vlw");
    pos = new PVector(15, 60);
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
    textAlign(LEFT);
    text(score, pos.x, pos.y);
  }
}
