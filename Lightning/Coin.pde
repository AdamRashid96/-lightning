public class Coin extends MovableBoardItem {
  PVector normVec; 
  int[][] coinData = {{-1, -1, -1, #FD9838, #FD9838, #FD9838, #FD9838, 0, 0, -1, -1}, 
                      {-1, -1, #FD9838, #FD9838, #FD9838, #FD9838, #FD9838, #FD9838, 0, 0, -1}, 
                      {-1, #FD9838, #FD9838, #FD9838, #C74B0A, #C74B0A, #FD9838, #FD9838, #FD9838, 0, 0}, 
                      {-1, #FD9838, #FD9838, #C74B0A, #FD9838, #FD9838, 0, #FD9838, #FD9838, 0, 0}, 
                      {-1, #FD9838, #FD9838, #C74B0A, #FD9838, #FD9838, 0, #FD9838, #FD9838, 0, 0}, 
                      {-1, #FD9838, #FD9838, #C74B0A, #FD9838, #FD9838, 0, #FD9838, #FD9838, 0, 0}, 
                      {-1, #FD9838, #FD9838, #C74B0A, #FD9838, #FD9838, 0, #FD9838, #FD9838, 0, 0}, 
                      {-1, #FD9838, #FD9838, #C74B0A, #FD9838, #FD9838, 0, #FD9838, #FD9838, 0, 0}, 
                      {-1, #FD9838, #FD9838, #FD9838, 0, 0, #FD9838, #FD9838, #FD9838, 0, 0}, 
                      {-1, -1, #FD9838, #FD9838, #FD9838, #FD9838, #FD9838, #FD9838, 0, 0, -1}, 
                      {-1, -1, -1, #FD9838, #FD9838, #FD9838, #FD9838, 0, 0, -1, -1}};
  public Coin(int colAt, int rowAt) {
    super(rowAt, colAt);
    normVec = new PVector(0, 0); //-60 for bounce
    setData(coinData);
  }

  public void show(int xAt, int yAt, int cellSize) {
    if (LIFE) {
      for (int row = 0; row < coinData.length; row++) {
        for (int col = 0; col < coinData[row].length; col++) {
          int fillColor = coinData[row][col];
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
    return coinData.length;
  }

  public int getWidth() {
    return coinData[0].length;
  }

  public int getX() {
    return (int)pos.x;
  }

  public int getY() {
    return (int)pos.y;
  }
}
