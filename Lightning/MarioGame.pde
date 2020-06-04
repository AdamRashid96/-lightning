/* @pjs preload="marioBackground.jpg"; */
Board theBoard; //<>//
Yoshi player1;
Flagpole flag;
PImage homeScreen;
ArrayList<Enemy> enemies;
ArrayList<Spiny> spinies;
ArrayList<passableBrick> platforms;
ArrayList<BreakableBrick> bricks;
ArrayList<Spike> spikes;
ArrayList<Coin> coins;
int timer;
int counter;
int flashTime = 0;
int score = 0;
int gameSelect = 1;
int gameScreen = 1; //1 for start screen; 2 for the game
boolean MOVE_LEFT = false;
boolean MOVE_RIGHT = false;
boolean CANT_MOVE_RIGHT = false;
boolean END = false;
boolean FLASH = true;
boolean WAITING = false;
boolean SPAWN_ENEMY = false;
void setup() {
  size(800, 600);
  counter = 0;
  timer = 400000 + millis();
  flashTime = 0;
  score = 0;
  gameSelect = 1;
  gameScreen = 1;
  MOVE_LEFT = false;
  MOVE_RIGHT = false;
  CANT_MOVE_RIGHT = false;
  END = false;
  FLASH = true;
  WAITING = false;

  theBoard = new Board(0, height/20, 200, 1500, 200, width/2, 2);
  player1 = new Yoshi(theBoard.row() - 20, 2);
  flag = new Flagpole(50, theBoard.col() - 50);
  homeScreen = loadImage("marioBackground.jpg");
  platforms = new ArrayList<passableBrick>();
  bricks = new ArrayList<BreakableBrick>();
  coins = new ArrayList<Coin>();
  spikes = new ArrayList<Spike>();
  enemies = new ArrayList<Enemy>();
  spinies = new ArrayList<Spiny>();

  platforms.add(new passableBrick(160, 70, 7, 50, #954927)); 
  platforms.add(new passableBrick(120, 140, 7, 60, #954927));  
  platforms.add(new passableBrick(160, 1300, 7, 50, #954927)); 
  platforms.add(new passableBrick(100, 1280, 7, 63, #954927));
  platforms.add(new passableBrick(40, 1310, 7, 35, #954927));
  
  platforms.add(new passableBrick(140, 780, 7, 50, #954927));
  platforms.add(new passableBrick(70, 890, 7, 60, #954927));
  
  //bricks.add(new BreakableBrick(180, 90));
  bricks.add(new BreakableBrick(110, 460));
  bricks.add(new BreakableBrick(110, 471));
  bricks.add(new BreakableBrick(110, 482));
  bricks.add(new BreakableBrick(110, 493));
  bricks.add(new BreakableBrick(110, 504));  
  bricks.add(new BreakableBrick(115, 540));
  bricks.add(new BreakableBrick(115, 551));
  bricks.add(new BreakableBrick(115, 562));
  bricks.add(new BreakableBrick(115, 573));
  bricks.add(new BreakableBrick(115, 584));
  //coins.add(new Coin(147, 90));
  coins.add(new Coin(148, 70));
  coins.add(new Coin(148, 81));
  coins.add(new Coin(148, 92));
  coins.add(new Coin(108, 150));
  coins.add(new Coin(108, 161));
  coins.add(new Coin(108, 172)); 
  coins.add(new Coin(185, 258));
  coins.add(new Coin(171, 276));
  coins.add(new Coin(164, 294));
  coins.add(new Coin(171, 312));
  coins.add(new Coin(185, 330));
  coins.add(new Coin(148, 1324));
  coins.add(new Coin(88, 1294));  
  coins.add(new Coin(28, 1310));
  coins.add(new Coin(28, 1321));
  coins.add(new Coin(28,1331));
  
  coins.add(new Coin(57, 890));  
  coins.add(new Coin(57, 901));
  coins.add(new Coin(57, 912));
  coins.add(new Coin(57, 923));
  coins.add(new Coin(57, 934));
  //spikes.add(new Spike(169, 90));
  spikes.add(new Spike(150, 106));
  spikes.add(new Spike(110, 140));
  spikes.add(new Spike(110, 184));
  spikes.add(new Spike(189, 270));
  spikes.add(new Spike(189, 282));
  spikes.add(new Spike(189, 294));
  spikes.add(new Spike(189, 306));
  spikes.add(new Spike(189, 318));
  
  spikes.add(new Spike(150, 1300));
  spikes.add(new Spike(150, 1311));
  spikes.add(new Spike(150, 1339));
  
  spikes.add(new Spike(90, 1280));
  spikes.add(new Spike(90, 1310));
  spikes.add(new Spike(90, 1321));
  spikes.add(new Spike(90, 1332));
  //spinies.add(new Spiny(180, 100));
  spinies.add(new Spiny(360, 260));
  spinies.add(new Spiny(360, 750));
  spinies.add(new Spiny(360, 780));
  spinies.add(new Spiny(360, 1460));
  spinies.add(new Spiny(360, 1420));
  spinies.add(new Spiny(360, 1310));
  //enemies.add(new Enemy(150, 200));
  enemies.add(new Enemy(370, 170));
  enemies.add(new Enemy(370, 290));
  
  enemies.add(new Enemy(370, 600));
  enemies.add(new Enemy(370, 1200));
  enemies.add(new Enemy(370, 1240));
  enemies.add(new Enemy(370, 1340));
  enemies.add(new Enemy(370, 1400));
  enemies.add(new Enemy(370, 1105));

  for (int i = 0; i < spikes.size(); i++)
    theBoard.addMovableItem(spikes.get(i));
  for (int i = 0; i< platforms.size(); i++)
    theBoard.addMovableItem(platforms.get(i));
  for (int i = 0; i< enemies.size(); i++)
    theBoard.addMovableItem(enemies.get(i));
  for (int i = 0; i< spinies.size(); i++)
    theBoard.addMovableItem(spinies.get(i));
  for (int i = 0; i < bricks.size(); i++)
    theBoard.addMovableItem(bricks.get(i));
  for (int i = 0; i < coins.size(); i++)
    theBoard.addMovableItem(coins.get(i));

  theBoard.addMovableItem(flag);
  theBoard.addMovableItem(player1);
}

void draw() {
  if (gameScreen == 1)
    startScreen();
  else if (gameScreen == 2)
    game();
  else if (gameScreen == 3) {
    gameOver();
    counter++;
  } 

  if (gameScreen == 3 && counter >= 2) {
    sleep(3000);
    setup();
  }
}

void game() {
  background(200);
  theBoard.show();
  display();

  if (MOVE_RIGHT && MOVE_LEFT) {
    player1.setVelocity(new PVector(0, player1.getVelocity().y));
  } else if (MOVE_LEFT) {
    if (player1.getPos().x + (theBoard.getX()/2) < (theBoard.getW()/2 - 2) && theBoard.getX() <= 0 )
      theBoard.applyForce(new PVector(-72, 0));         
    player1.applyForce(new PVector(-8, 0));
  } else if (MOVE_RIGHT) {
    if (player1.getPos().x + (theBoard.getX()/2) > theBoard.getW()/2 && theBoard.getX() > (theBoard.col() - theBoard.getW())* theBoard.getCellSize() * -1)
      theBoard.applyForce(new PVector(72, 0));
    player1.applyForce(new PVector(8, 0));
  } else {
    player1.setVelocity(new PVector(0, player1.getVelocity().y));
  }

  if (player1.getVelocity().y > 0) {
    for (int i = 0; i < platforms.size(); i++) {
      if ((player1.getPos().y + player1.getHeight() - 4) <= platforms.get(i).getY()) {
        if (checkPlatform(platforms.get(i), player1)) {
          player1.applyForce(platforms.get(i).getNormVec());
          player1.setPos(new PVector(player1.getPos().x, platforms.get(i).getY() - player1.getHeight() - 1));
          player1.setNumOfJumps(0);
          break;
        }
      }
    }
  }

  for (int i = 0; i < bricks.size(); i++) {
    if (checkSide(bricks.get(i), player1, 'l') && MOVE_RIGHT) {
      player1.setAccel(new PVector(0, player1.getAccel().y));
      player1.setVelocity(new PVector(0, player1.getVelocity().y));
      break;
    }

    if (checkSide(bricks.get(i), player1, 'r') && MOVE_LEFT) {
      player1.setAccel(new PVector(0, player1.getAccel().y));
      player1.setVelocity(new PVector(0, player1.getVelocity().y));
      break;
    }

    if (checkBrick(bricks.get(i), player1)) {
      if ((player1.getPos().y + player1.getHeight() - 4) <= bricks.get(i).getY()) {
        player1.setPos(new PVector(player1.getPos().x, bricks.get(i).getY() - player1.getHeight() - 1));
        player1.setNumOfJumps(1);
        break;
      }

      if (player1.getPos().y >= (bricks.get(i).getY() + bricks.get(i).getHeight()-4)) {
        score += 50;
        bricks.get(i).setLife(false);
        player1.applyForce(bricks.get(i).getNormVec());
      }
    }
  }


  for (int i = 0; i < enemies.size(); i++) {
    if (checkEnemy(enemies.get(i), player1)) {
      if ((player1.getPos().y + player1.getHeight() - 8) <= enemies.get(i).getPos().y) {
        score += 50;
        enemies.get(i).setLife(false);
        player1.applyForce(enemies.get(i).getNormVec());
      } else {
        player1.setLives(player1.getLives() - 1);
        reset();
      }
    }
  }

  for (int i = 0; i < spinies.size(); i++) {
    if (checkEnemy(spinies.get(i), player1)) {      
      player1.setLives(player1.getLives() - 1);
      reset();
    }
  }

  for (int i = 0; i < coins.size(); i++) {
    if (checkEnemy(coins.get(i), player1)) {      
      score += 50;
      coins.get(i).setLife(false);
      player1.applyForce(coins .get(i).getNormVec());
    }
  }

  for (int i = 0; i < spikes.size(); i++) {
    if (checkEnemy(spikes.get(i), player1)) {      
      player1.setLives(player1.getLives() - 1);
      reset();
    }
  }

  if (checkEnemy(flag, player1))
    endGame();
  if (END) {
    timer -= 3000;
    player1.applyForce(new PVector(5, 0));
    if (int((timer - millis())/1000) > 0)
      score += 5;
    if (player1.getPos().x >= theBoard.col() + 10)
      setup();
  }

  if (player1.onGround()) {
    player1.applyForce(new PVector(0, -3));
    player1.setVelocity(new PVector(player1.getVelocity().x, 0));
  }

  for (int i = 0; i< enemies.size(); i++) {
    if (enemies.get(i).getMoveRight())
      enemies.get(i).applyForce(new PVector(8, 0));
    else
      enemies.get(i).applyForce(new PVector(-8, 0));
  }

  for (int i = 0; i< enemies.size(); i++)
    enemies.get(i).update();

  for (int i = 0; i< spinies.size(); i++) {
    if (spinies.get(i).getMoveRight())
      spinies.get(i).applyForce(new PVector(8, 0));
    else
      spinies.get(i).applyForce(new PVector(-8, 0));
  }

  for (int i = 0; i< spinies.size(); i++)
    spinies.get(i).update();

  theBoard.update();
  player1.update();

  for (int i = 0; i< enemies.size(); i++) {
    if (!enemies.get(i).getLife()) {
      enemies.remove(i);
    }
  }

  for (int i = 0; i< bricks.size(); i++) {
    if (!bricks.get(i).getLife()) {
      bricks.remove(i);
    }
  }

  for (int i = 0; i< coins.size(); i++) {
    if (!coins.get(i).getLife()) {
      coins.remove(i);
    }
  }

  if (int((timer - millis())/1000) <=0 && !END) {
    player1.setLives(player1.getLives() - 1);
    reset();
  }
  if (player1.getLives() <= 0)
    gameScreen = 3;
}

void keyPressed() {
  if (keyCode == UP && player1.getNumOfJumps() < 2) {
    player1.setVelocity(new PVector(player1.getVelocity().x, 0));
    player1.applyForce(new PVector(0, -50));
    player1.setNumOfJumps(player1.getNumOfJumps() + 1);
  }
  if (keyCode == RIGHT && !CANT_MOVE_RIGHT)
    MOVE_RIGHT = true;
  if (keyCode == LEFT)
    MOVE_LEFT = true;
}

void keyReleased() {
  if (keyCode == RIGHT) {
    MOVE_RIGHT = false;
  }
  if (keyCode == LEFT) {
    MOVE_LEFT = false;
  }
}

void mousePressed() {
  println(theBoard.getCell(mouseX, mouseY)); 
  println("Board x: " + theBoard.getX()); 
  println(mouseX, mouseY);
}

void startScreen() {
  image(homeScreen, 0, 0, width, height);
  noStroke();
  fill(#30D12E);
  if (FLASH) {
    if (gameSelect == 1) {
      stroke(1);
      triangle(255, 372, 225, 387, 225, 360);
    } else if (gameSelect == 2) {
      stroke(1);
      triangle(255, 416, 225, 430, 225, 403);
    }
  }

  if (millis() - flashTime >= 300) {
    if (FLASH)
      FLASH = false;
    else
      FLASH = true;
    flashTime = millis();
  }

  if (keyPressed) {
    if (key == ENTER)
      gameScreen = 2;
    if (keyCode == UP)   
      gameSelect = 1;
    else if (keyCode == DOWN)
      gameSelect = 2;
  }
}

void display() {
  if (int((timer - millis())/1000) > 0) {
    textSize(15);
    fill(255);
    text("Time : " + int((timer - millis())/1000), width - 100, height/20 + 20);
  } else {
    textSize(15);
    fill(255);
    text("Time : " + 0, width - 100, height/20 + 20);
  }
  textSize(15);
  fill(255);
  text("Score : " + score, width - 200, height/20 + 20);

  textSize(15);
  fill(255);
  text("Lives x" + player1.getLives(), 20, height/20 + 20);
}

void endGame() {
  score += 5;
  player1.setAccel(new PVector(0, 0));
  player1.setVelocity(new PVector(0, 0));
  player1.applyForce(flag.getNormVec());
  for (int i = 0; i< enemies.size(); i++)
    enemies.get(i).setLife(false);
  for (int i = 0; i< spinies.size(); i++)
    spinies.get(i).setLife(false);
  if (player1.getPos().y >= theBoard.getH() - player1.getHeight()) { 
    END = true;
    player1.setBounds(false);
  }
}

void reset() {
  counter = 0;
  timer = 400000 + millis();
  flashTime = 0;
  score = 0;
  gameSelect = 1;
  gameScreen = 2;
  MOVE_LEFT = false;
  MOVE_RIGHT = false;
  CANT_MOVE_RIGHT = false;
  END = false;
  FLASH = true;
  WAITING = false;
  theBoard = new Board(0, height/20, 200, 1500, 200, width/2, 2);
  player1.setPos(new PVector(2, theBoard.row() - 20));
  flag = new Flagpole(50, theBoard.col() - 50);
  homeScreen = loadImage("marioBackground.jpg");
  platforms = new ArrayList<passableBrick>();
  bricks = new ArrayList<BreakableBrick>();
  coins = new ArrayList<Coin>();
  spikes = new ArrayList<Spike>();
  enemies = new ArrayList<Enemy>();
  spinies = new ArrayList<Spiny>();

  platforms.add(new passableBrick(160, 70, 7, 50, #954927)); 
  platforms.add(new passableBrick(120, 140, 7, 60, #954927));  
  platforms.add(new passableBrick(160, 1300, 7, 50, #954927)); 
  platforms.add(new passableBrick(100, 1280, 7, 63, #954927));
  platforms.add(new passableBrick(40, 1310, 7, 35, #954927));
  
  platforms.add(new passableBrick(140, 780, 7, 50, #954927));
  platforms.add(new passableBrick(70, 890, 7, 60, #954927));
  
  //bricks.add(new BreakableBrick(180, 90));
  bricks.add(new BreakableBrick(110, 460));
  bricks.add(new BreakableBrick(110, 471));
  bricks.add(new BreakableBrick(110, 482));
  bricks.add(new BreakableBrick(110, 493));
  bricks.add(new BreakableBrick(110, 504));  
  bricks.add(new BreakableBrick(115, 540));
  bricks.add(new BreakableBrick(115, 551));
  bricks.add(new BreakableBrick(115, 562));
  bricks.add(new BreakableBrick(115, 573));
  bricks.add(new BreakableBrick(115, 584));
  //coins.add(new Coin(147, 90));
  coins.add(new Coin(148, 70));
  coins.add(new Coin(148, 81));
  coins.add(new Coin(148, 92));
  coins.add(new Coin(108, 150));
  coins.add(new Coin(108, 161));
  coins.add(new Coin(108, 172)); 
  coins.add(new Coin(185, 258));
  coins.add(new Coin(171, 276));
  coins.add(new Coin(164, 294));
  coins.add(new Coin(171, 312));
  coins.add(new Coin(185, 330));
  coins.add(new Coin(148, 1324));
  coins.add(new Coin(88, 1294));  
  coins.add(new Coin(28, 1310));
  coins.add(new Coin(28, 1321));
  coins.add(new Coin(28,1331));
  
  coins.add(new Coin(57, 890));  
  coins.add(new Coin(57, 901));
  coins.add(new Coin(57, 912));
  coins.add(new Coin(57, 923));
  coins.add(new Coin(57, 934));
  //spikes.add(new Spike(169, 90));
  spikes.add(new Spike(150, 106));
  spikes.add(new Spike(110, 140));
  spikes.add(new Spike(110, 184));
  spikes.add(new Spike(189, 270));
  spikes.add(new Spike(189, 282));
  spikes.add(new Spike(189, 294));
  spikes.add(new Spike(189, 306));
  spikes.add(new Spike(189, 318));
  
  spikes.add(new Spike(150, 1300));
  spikes.add(new Spike(150, 1311));
  spikes.add(new Spike(150, 1339));
  
  spikes.add(new Spike(90, 1280));
  spikes.add(new Spike(90, 1310));
  spikes.add(new Spike(90, 1321));
  spikes.add(new Spike(90, 1332));
  //spinies.add(new Spiny(180, 100));
  spinies.add(new Spiny(360, 260));
  spinies.add(new Spiny(360, 750));
  spinies.add(new Spiny(360, 780));
  spinies.add(new Spiny(360, 1460));
  spinies.add(new Spiny(360, 1420));
  spinies.add(new Spiny(360, 1310));
  //enemies.add(new Enemy(150, 200));
  enemies.add(new Enemy(370, 170));
  enemies.add(new Enemy(370, 290));
  
  enemies.add(new Enemy(370, 600));
  enemies.add(new Enemy(370, 1200));
  enemies.add(new Enemy(370, 1240));
  enemies.add(new Enemy(370, 1340));
  enemies.add(new Enemy(370, 1400));
  enemies.add(new Enemy(370, 1105));

  for (int i = 0; i < spikes.size(); i++)
    theBoard.addMovableItem(spikes.get(i));
  for (int i = 0; i< platforms.size(); i++)
    theBoard.addMovableItem(platforms.get(i));
  for (int i = 0; i< enemies.size(); i++)
    theBoard.addMovableItem(enemies.get(i));
  for (int i = 0; i< spinies.size(); i++)
    theBoard.addMovableItem(spinies.get(i));
  for (int i = 0; i < bricks.size(); i++)
    theBoard.addMovableItem(bricks.get(i));
  for (int i = 0; i < coins.size(); i++)
    theBoard.addMovableItem(coins.get(i));

  theBoard.addMovableItem(flag);
  theBoard.addMovableItem(player1);
}

void gameOver() {
  textSize(100);
  fill(255, 0, 0);
  text("Game Over!", width/2- 250, height/2);
}

void sleep(int wait) {
  int time = millis();
  WAITING = true;
  while (WAITING) {
    if (millis() - time >= wait)
      WAITING = false;
  }
}

boolean checkPlatform(MovableBoardItem plat, Yoshi thePlayer) {
  if (thePlayer.getPos().x < plat.getPos().x + plat.getWidth() &&
    thePlayer.getPos().x + thePlayer.getWidth() + 3 > plat.getPos().x &&
    thePlayer.getPos().y < plat.getPos().y + plat.getHeight() &&
    thePlayer.getPos().y + thePlayer.getHeight() > plat.getPos().y) {
    return true;
  } else {
    return false;
  }
}

boolean checkEnemy(MovableBoardItem enemy, Yoshi thePlayer) {
  if (thePlayer.getPos().x < enemy.getPos().x + enemy.getWidth() &&
    thePlayer.getPos().x + thePlayer.getWidth() > enemy.getPos().x &&
    thePlayer.getPos().y < enemy.getPos().y + enemy.getHeight() &&
    thePlayer.getPos().y + thePlayer.getHeight() > enemy.getPos().y) {
    return true;
  } else {
    return false;
  }
}

boolean checkBrick(MovableBoardItem brick, Yoshi thePlayer) {
  if (thePlayer.getPos().x < brick.getPos().x + brick.getWidth() &&
    thePlayer.getPos().x + thePlayer.getWidth() > brick.getPos().x &&
    thePlayer.getPos().y < brick.getPos().y + brick.getHeight() &&
    thePlayer.getPos().y + thePlayer.getHeight() > brick.getPos().y) {
    return true;
  } else {
    return false;
  }
}

boolean checkSide(MovableBoardItem w, Yoshi thePlayer, char dir) {
  ArrayList<Cell> edge = w.getEdge(dir);    
  ArrayList<Cell> player = new ArrayList<Cell>();
  if (dir == 'r')
    player = thePlayer.getEdge('l');
  if (dir == 'l') 
    player = thePlayer.getEdge('r');

  for (int i = 0; i < player.size(); i++) {
    for (int j = 0; j <edge.size(); j++) {
      if (player.get(i).equals(edge.get(j))) {
        return true;
      }
    }
  }
  return false;
}
