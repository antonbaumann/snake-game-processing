import java.util.LinkedList;
import java.util.Queue;

class Snake {
  Queue<PVector> body;
  PVector head;
  PVector direction;
  int a;
  boolean alive;
  boolean ate;
  
  Snake(int a) {
    this.a = a;
    spawn();
  }
  
  void spawn() {
    body = new LinkedList<PVector>();
    head = new PVector(game.rows/2, game.cols/2);
    body.add(head);
    direction = new PVector(1, 0);
    alive = true;
    ate = false;
  }
  
  void update() {
    checkCollisionWithFood();
    if (checkCollisionWithBody()) alive = false;
    if (alive && !checkCollisionWithWall()) {
      move();
    } else {
      alive = false;
    }
  }
  
  void show() {
    fill(255);
    for(PVector el : body) {
      rect(el.x * a, el.y * a, a, a); 
    }
  }
  
  boolean checkCollisionWithFood() {
    if (head.x == game.food.pos.x && head.y == game.food.pos.y) {
      eat();
      game.food.spawn();
    }
    return false;
  }
  
  boolean checkCollisionWithWall() {
    if (head.x <= 0 && direction.x < 0 
        || head.x >= game.cols-1 && direction.x > 0 
        || head.y <= 0 && direction.y < 0 
        || head.y >= game.rows-1 && direction.y > 0) {
      direction.x = 0;
      direction.y = 0;
      return true;
    }
    return false;
  }
  
  boolean checkCollisionWithBody() {
    for (PVector el : body) {
      if (head.x + direction.x == el.x && head.y + direction.y == el.y) {
        return true;
      }
    }
    return false;
  }
  
  void move() {
    if (ate) {
      head = new PVector(head.x + direction.x, head.y + direction.y);
      body.add(head);
      ate = false;
    } else {
      PVector tail = body.poll();
      tail.x = head.x + direction.x;
      tail.y = head.y + direction.y;
      head = tail;
      body.add(head);
    }
  }
  
  void setDirection(String d) {
    switch (d) {
      case "up": 
        if (direction.y == 0) {
          direction.x =  0;
          direction.y = -1;
        }
        break;
      case "down":
        if (direction.y == 0) {
          direction.x =  0;
          direction.y =  1;
        }
        break;
      case "left":
        if (direction.x == 0) {
          direction.x = -1;
          direction.y =  0;
        }
        break;
      case "right":
        if (direction.x == 0) {
          direction.x =  1;
          direction.y =  0;
        }
        break;  
    }
  }
  
  public void eat() {
    ate = true;
    game.score.update();
  }
   
}
