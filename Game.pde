class Game {
  Snake snake;
  Food food;
  Score score;
  
  boolean running;
  
  int rows;
  int cols;
  int a;
  
  color bg = color(55);
  
  Game(int a) {
   this.a = a;
   this.rows = height / a;
   this.cols = width / a;
   this.running = false;
  }
  
  void start() {
    snake = new Snake(a);
    food = new Food(a);
    score = new Score();
    running = true;
  }
  
  void update() {
    if (running) {
      snake.update();
      if (!snake.alive) {
        gameOver();
      }
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
    if(key == 'p') {
        togglePause();
      }
  }
  
  void togglePause() {
    running = !running;
  }
  void gameOver() {
    bg = color(128,0,0);
  }
  
}
