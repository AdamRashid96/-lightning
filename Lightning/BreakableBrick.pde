public class BreakableBrick extends MovableBoardItem {
  PVector normVec; 
  int[][] brickData = {{#954927,#954927,#954927,#954927,#954927,#2F2118,#954927,#954927,#954927,#954927,#954927},
                        {#954927,#954927,#954927,#954927,#954927,#2F2118,#954927,#954927,#954927,#954927,#954927},
                        {#954927,#954927,#954927,#954927,#954927,#2F2118,#954927,#954927,#954927,#954927,#954927},
                        {#2F2118,#2F2118,#2F2118,#2F2118,#2F2118,#2F2118,#2F2118,#2F2118,#2F2118,#2F2118,#2F2118},
                        {#954927,#954927,#2F2118,#954927,#954927,#954927,#954927,#954927,#2F2118,#954927,#954927},
                        {#954927,#954927,#2F2118,#954927,#954927,#954927,#954927,#954927,#2F2118,#954927,#954927},
                        {#954927,#954927,#2F2118,#954927,#954927,#954927,#954927,#954927,#2F2118,#954927,#954927},
                        {#2F2118,#2F2118,#2F2118,#2F2118,#2F2118,#2F2118,#2F2118,#2F2118,#2F2118,#2F2118,#2F2118},
                        {#954927,#954927,#954927,#954927,#954927,#2F2118,#954927,#954927,#954927,#954927,#954927},
                        {#954927,#954927,#954927,#954927,#954927,#2F2118,#954927,#954927,#954927,#954927,#954927},
                        {#954927,#954927,#954927,#954927,#954927,#2F2118,#954927,#954927,#954927,#954927,#954927}};
  public BreakableBrick(int colAt, int rowAt) {
    super(rowAt, colAt);
    normVec = new PVector(0, 30); //-60 for bounce
    setData(brickData);
  }

  public void show(int xAt, int yAt, int cellSize){
    if(LIFE){
      for (int row = 0; row < brickData.length; row++) {
        for (int col = 0; col < brickData[row].length; col++) {
          int fillColor = brickData[row][col];
          if (fillColor != -1) {
            fill(fillColor);
            rect(xAt + col*cellSize, yAt + row*cellSize, cellSize, cellSize);
          }
        }
      }
    }
  }

  public PVector getNormVec() {
    return normVec;
  }

  public int getHeight() {
    return brickData.length;
  }

  public int getWidth() {
    return brickData[0].length;
  }

  public int getX() {
    return (int)pos.x;
  }

  public int getY() {
    return (int)pos.y;
  }
}
