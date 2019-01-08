Game game;
void setup() {
  size(500, 500);
  frameRate(18);
  noStroke();
  game = new Game(20);
  game.start();
}

void draw() {
  game.update();
  game.show();
}

void keyPressed() {
  game.handleInput();
}
