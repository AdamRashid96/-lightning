public class passableBrick extends MovableBoardItem {
  int rowSize, colSize;
  int[][] brickData;
  PVector normVec; 
  public passableBrick(int colAt, int rowAt, int rowSize, int colSize, int hex) {
    super(rowAt, colAt);
    this.rowSize = rowSize;
    this.colSize = colSize;
    normVec = new PVector(0, 0); //-60 for bounce
    brickData = new int[rowSize][colSize];
    for (int row = 0; row < rowSize; row++) {
      for (int col = 0; col < colSize; col++) {
        brickData[row][col] = hex;
      }
    }

      //Outlines the edges in black
      for (int col = 0; col < colSize; col++)
        brickData[0][col] = 0;
      for (int col = 0; col < colSize; col++)
        brickData[rowSize - 1][col] = 0;
      for (int row = 0; row < rowSize; row++)
        brickData[row][0] = 0;
      for (int row = 0; row < rowSize; row++)
        brickData[row][colSize -1] = 0;

    setData(brickData);
  }

  public void show(int xAt, int yAt, int cellSize) {
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

  public PVector getNormVec() {
    return normVec;
  }

  public int geHeight() {
    return rowSize;
  }

  public int getWidth() {
    return colSize;
  }

  public int getX() {
    return (int)pos.x;
  }

  public int getY() {
    return (int)pos.y;
  }
}
