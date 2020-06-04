public class MovableBoardItem {
  protected PVector pos, velocity, accel;
  protected PVector GRAVITY; 
  protected int maxRows, maxCols;
  protected int[][] glyphData;
  protected int numOfJumps;
  protected boolean LIFE;
  protected boolean BOUNDS;

  public MovableBoardItem(int colAt, int rowAt) {
    pos = new PVector(colAt, rowAt);
    velocity = new PVector(0, 0);
    accel = new PVector(0, 0);
    GRAVITY = new PVector(0, 3);
    LIFE = true;
    BOUNDS = true;
    numOfJumps = 0;
  } 

  public void update() {
    if (LIFE) {
      if (velocity.x > 3 || velocity.x < -3)
        accel.set(0, accel.y);
      if (velocity.x > 3)
        velocity.set(3, velocity.y);
      if (velocity.x < -3)
        velocity.set(-3, velocity.y);
      if (velocity.y > 2)
        velocity.set(velocity.x, 2);
      accel.add(GRAVITY); 
      if (accel.mag()>0.01) {
        velocity.add(accel.mult(5/frameRate));
      } 

      if (velocity.mag()<0.15) {
        velocity.mult(0);
      }
      if (BOUNDS) {
        if (onRightEdge() && velocity.x>0)
          velocity.set(0, velocity.y);

        if (onLeftEdge() && velocity.x<0)
          velocity.set(0, velocity.y);
      }
      pos.add(velocity);

      if (pos.y>=maxRows - glyphData.length) {
        pos.set(pos.x, maxRows - glyphData.length);
        numOfJumps = 0;
      }
    }
  }

  public void applyForce(PVector force) {
    accel.add(force);
  }

  public void show(int x, int y, int cellSize) {
    for (int row = 0; row < glyphData.length; row++) {
      for (int col = 0; col < glyphData[row].length; col++) {
        int fillColor = glyphData[row][col];
        if (fillColor != -1) {
          fill(fillColor);
          rect(x + col*cellSize, y + row*cellSize, cellSize, cellSize);
        }
      }
    }
  }

  public ArrayList<Cell> getEdge(char direction) {
    ArrayList<Cell> result= new ArrayList<Cell>();
    if (direction == 'u') {
      for (int i = 0; i < glyphData[0].length; i++) {
        int colVal = i + (int)pos.x;
        int rowVal= (int)pos.y;
        Cell c = new Cell(rowVal, colVal);
        result.add(c);
      }
    }

    if (direction == 'd') {
      for (int i = 0; i < glyphData[0].length; i++) {
        int colVal = i + (int)pos.x;
        int rowVal= (int)pos.y + glyphData[0].length - 1;
        Cell c = new Cell(rowVal, colVal);
        result.add(c);
      }
    }    

    if (direction == 'r') {
      for (int i = 0; i < glyphData.length; i++) {    
        int colVal = (int)pos.x + glyphData[0].length - 1;
        int rowVal= (int)pos.y  + i;
        Cell c = new Cell(rowVal, colVal);
        result.add(c);
      }
    }

    if (direction == 'l') {
      for (int i = 0; i < glyphData.length; i++) {    
        int colVal = (int)pos.x;
        int rowVal= (int)pos.y  + i;
        Cell c = new Cell(rowVal, colVal);
        result.add(c);
      }
    }
    return result;
  }

  public void setData(int[][] data) {
    glyphData = data;
  }

  public void setBounds(int rows, int cols) {
    maxRows = rows;
    maxCols = cols;
  }

  public boolean onGround() {
    if (((maxRows - glyphData.length) - pos.y) <= 0)
      return true;
    else
      return false;
  }

  public boolean onLeftEdge() {
    if (pos.x <= 1)
      return true;
    else
      return false;
  }

  public boolean onRightEdge() {
    if ((maxCols - glyphData[0].length - pos.x) <= 0)
      return true;
    else
      return false;
  }

  public int getRowId() {     
    return (int)pos.y;
  }

  public int getColId() { 
    return (int)pos.x;
  }

  public PVector getAccel() {
    return accel;
  }

  public void setAccel(PVector a) {
    accel.set(a);
  }

  public PVector getVelocity() {
    return velocity;
  }

  public void setVelocity(PVector v) {
    velocity.set(v);
  }

  public PVector getPos() {
    return pos;
  }

  public void setPos(PVector p) {
    pos.set(p);
  }

  public PVector getGravity() {
    return GRAVITY;
  }

  public int getNumOfJumps() {
    return numOfJumps;
  }

  public void setNumOfJumps(int j) {
    numOfJumps = j;
  }

  public int getHeight() {
    return glyphData.length;
  }

  public int getWidth() {
    return glyphData[0].length;
  }

  public boolean getLife() {
    return LIFE;
  }

  public void setLife(boolean l) {
    LIFE = l;
  }

  public boolean getBounds() {
    return BOUNDS;
  }

  public void setBounds(boolean b) {
    BOUNDS = b;
  }
}
