class Game {
  Snake snake;
  Food food;
  Score score;
  
  int rows;
  int cols;
  int a;
  
  color bg = color(55);
  
  Game(int a) {
   this.a = a;
   this.rows = height / a;
   this.cols = width / a;
  }
  
  void start() {
    snake = new Snake(a);
    food = new Food(a);
    score = new Score();
  }
  
  void update() {
    snake.update();
    if (!snake.alive) {
      gameOver();
    }
  }
  
  void show() {
    background(0);
    fill(bg);
    rect(0, 0, a * cols, a * rows);
    score.show();
    snake.show();
    food.show();
  }
  
  void handleInput() {
    if(key == CODED) {
      if (keyCode == LEFT) {
        snake.setDirection("left");
      }
      if(keyCode == RIGHT) {
        snake.setDirection("right");
      }
      if(keyCode == UP) {
        snake.setDirection("up");
      }
      if(keyCode == DOWN) {
        snake.setDirection("down");
      }
    }
  }
  
  void gameOver() {
    bg = color(128,0,0);
  }
  
}
