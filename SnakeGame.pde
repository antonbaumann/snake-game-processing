Game game;

void setup() {
  size(600, 600);
  frameRate(15);
  noStroke();
  game = new Game(10);
  game.start();
}

void draw() {
  game.update();
  game.show();
}

void keyPressed() {
  game.handleInput();
}
