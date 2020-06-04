public class Spiny extends MovableBoardItem {
  boolean MOVE_RIGHT = false;
  PVector normVec;
  private int[][] spinyData = {{-1,-1,-1,-1,-1,-1,-1,-1,255,-1,-1,-1,-1,-1,-1,-1},
                                {-1,-1,-1,-1,-1,-1,-1,-1,255,-1,-1,-1,-1,-1,-1,-1},
                                {-1,-1,-1,-1,-1,-1,-1,255,#FFC107,#FFC107,-1,-1,-1,-1,-1,-1},
                                {-1,-1,255,-1,-1,-1,-1,255,#FFC107,#FFC107,-1,-1,-1,-1,255,-1},
                                {-1,-1,255,#FFC107,-1,-1,255,#FFC107,#FFC107,#FFC107,#FFC107,-1,-1,255,#FFC107,-1},
                                {-1,-1,255,#FFC107,#FFC107,-1,255,#FFC107,#FFC107,#FFC107,#FFC107,-1,255,#FFC107,#FFC107,-1},
                                {-1,-1,255,#FFC107,#FFC107,#FFC107,#EA1C2A,#FFC107,#FFC107,#FFC107,#EA1C2A,255,#FFC107,#FFC107,#FFC107,-1},
                                {-1,-1,255,255,#FFC107,#FFC107,#EA1C2A,#EA1C2A,#EA1C2A,#EA1C2A,#EA1C2A,255,#FFC107,#FFC107,#FFC107,-1},
                                {-1,#EA1C2A,#EA1C2A,#FFC107,#FFC107,#EA1C2A,#EA1C2A,255,255,#FFC107,#EA1C2A,#EA1C2A,#FFC107,#FFC107,#EA1C2A,-1},
                                {255,255,255,#EA1C2A,#EA1C2A,#EA1C2A,255,255,#FFC107,#FFC107,#FFC107,#EA1C2A,#EA1C2A,#EA1C2A,#EA1C2A,-1},
                                {-1,#EA1C2A,#EA1C2A,255,#EA1C2A,#EA1C2A,#FFC107,#FFC107,#FFC107,#FFC107,#FFC107,#EA1C2A,#EA1C2A,#EA1C2A,#EA1C2A,#EA1C2A},
                                {#EA1C2A,255,#EA1C2A,#EA1C2A,255,#EA1C2A,#EA1C2A,#FFC107,#FFC107,#FFC107,#EA1C2A,#EA1C2A,#EA1C2A,255,255,255},
                                {#EA1C2A,#EA1C2A,#EA1C2A,#EA1C2A,#FFC107,255,#EA1C2A,#EA1C2A,#EA1C2A,#EA1C2A,#EA1C2A,#EA1C2A,255,255,-1,-1},
                                {-1,-1,-1,#FFC107,#FFC107,#FFC107,255,255,255,255,255,255,#FFC107,#FFC107,#FFC107,-1},
                                {-1,-1,#FFC107,#FFC107,#FFC107,#FFC107,-1,-1,-1,-1,-1,-1,#FFC107,#FFC107,#FFC107,#FFC107}};
  public Spiny(int colAt, int rowAt) {
    super(rowAt, colAt);
    normVec = new PVector(0, -60); //-60 for bounce
    setData(spinyData);
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
      for (int row = 0; row < spinyData.length; row++) {
        for (int col = 0; col < spinyData[row].length; col++) {
          int fillColor = spinyData[row][col];
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
