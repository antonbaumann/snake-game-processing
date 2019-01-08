class Food {
  
  PVector pos = new PVector(0, 0);
  int a;
  
  Food(int a) {
     spawn();
     this.a = a;
  }
  
  void spawn() {
    pos.x = int(random(game.cols));
    pos.y = int(random(game.rows));
    
    println("Food: ");
    println("x: " + pos.x);
    println("y: " + pos.y);
    println();
  }
  
  void show() {
    fill(255, 255, 0);
    rect(pos.x * a, pos.y * a, a, a);
  }
}
