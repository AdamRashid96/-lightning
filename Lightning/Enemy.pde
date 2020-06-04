public class Enemy extends MovableBoardItem {
  boolean MOVE_RIGHT = false;
  PVector normVec;
  private int[][] enemyData = {{-1,-1,-1,-1,-1,-1,#955337,#955337,#955337,#955337,-1,-1,-1,-1,-1,-1},
                                {-1,-1,-1,-1,-1,#955337,#955337,#955337,#955337,#955337,#955337,-1,-1,-1,-1,-1},
                                {-1,-1,-1,-1,#955337,#955337,#955337,#955337,#955337,#955337,#955337,#955337,-1,-1,-1,-1},
                                {-1,-1,-1,#955337,#955337,#955337,#955337,#955337,#955337,#955337,#955337,#955337,#955337,-1,-1,-1},
                                {-1,-1,#955337,0,0,#955337,#955337,#955337,#955337,#955337,#955337,0,0,#955337,-1,-1},
                                {-1,#955337,#955337,#955337,255,0,#955337,#955337,#955337,#955337,0,255,#955337,#955337,#955337,-1},
                                {-1,#955337,#955337,#955337,255,0,0,0,0,0,0,255,#955337,#955337,#955337,-1},
                                {#955337,#955337,#955337,#955337,255,0,255,#955337,#955337,255,0,255,#955337,#955337,#955337,#955337},
                                {#955337,#955337,#955337,#955337,255,255,255,#955337,#955337,255,255,255,#955337,#955337,#955337,#955337},
                                {#955337,#955337,#955337,#955337,#955337,#955337,#955337,#955337,#955337,#955337,#955337,#955337,#955337,#955337,#955337,#955337},
                                {-1,#955337,#955337,#955337,#955337,#E7D789,#E7D789,#E7D789,#E7D789,#E7D789,#E7D789,#955337,#955337,#955337,#955337,-1},
                                {-1,-1,-1,-1,#E7D789,#E7D789,#E7D789,#E7D789,#E7D789,#E7D789,#E7D789,#E7D789,-1,-1,-1,-1},
                                {-1,-1,0,0,#E7D789,#E7D789,#E7D789,#E7D789,#E7D789,#E7D789,#E7D789,#E7D789,0,0,-1,-1},
                                {-1,0,0,0,0,0,#E7D789,#E7D789,#E7D789,#E7D789,0,0,0,0,0,-1},
                                {-1,0,0,0,0,0,0,#E7D789,#E7D789,0,0,0,0,0,0,-1},
                                {-1,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,-1}};
  public Enemy(int colAt, int rowAt) {
    super(rowAt, colAt);
    normVec = new PVector(0, -60); //-60 for bounce
    setData(enemyData);
  }

  public void update() {
    if (LIFE) {
      if (velocity.x > 1 || velocity.x < -1)
        accel.set(0, accel.y);
      if (velocity.x > 1)
        velocity.set(1, velocity.y);
      if (velocity.x < -1)
        velocity.set(-1, velocity.y);
      if (velocity.y > 2)
        velocity.set(velocity.x, 2);

      accel.add(GRAVITY); 
      if (accel.mag()>0.01) {
        velocity.add(accel.mult(1/frameRate));
      } 

      if (velocity.mag()<0.15) {
        velocity.mult(0);
      }

      if (onRightEdge() && velocity.x>0) {
        MOVE_RIGHT = false;
        velocity.set(0, velocity.y);
      }

      if (onLeftEdge() && velocity.x<0) {
        MOVE_RIGHT = true;
        velocity.set(0, velocity.y);
      }

      pos.add(velocity);

      if (pos.y>=maxRows - glyphData.length) {
        pos.set(pos.x, maxRows - glyphData.length);
        numOfJumps = 0;
      }
    }
  }

  public void show(int xAt, int yAt, int cellSize) {
    if (LIFE) {
      for (int row = 0; row < enemyData.length; row++) {
        for (int col = 0; col < enemyData[row].length; col++) {
          int fillColor = enemyData[row][col];
          if (fillColor != -1) {
            fill(fillColor);
            rect(xAt + col*cellSize, yAt + row*cellSize, cellSize, cellSize);
          }
        }
      }
    }
  }

  public boolean getMoveRight() {
    return MOVE_RIGHT;
  }
  
  public PVector getNormVec() {
    return normVec;
  }
}
