public class Spike extends MovableBoardItem {
  int[][] spikeData = {{-1,-1,-1,-1,-1,0,-1,-1,-1,-1,-1}, 
                      {-1,-1,-1,-1,0,255,0,-1,-1,-1,-1}, 
                      {-1,-1,-1,-1,0,255,0,-1,-1,-1,-1}, 
                      {-1,-1,-1,0,255,255,255,0,-1,-1,-1}, 
                      {-1,-1,-1,0,255,255,255,0,-1,-1,-1}, 
                      {-1,-1,0,255,255,255,255,255,0,-1,-1}, 
                      {-1,-1,0,255,255,255,255,255,0,-1,-1}, 
                      {-1,0,255,255,255,255,255,255,255,0,-1}, 
                      {-1,0,255,255,255,255,255,255,255,0,-1}, 
                      {0,255,255,255,255,255,255,255,255,255,0}, 
                      {0,255,255,255,255,255,255,255,255,255,0}};
  public Spike(int colAt, int rowAt) {
    super(rowAt, colAt);
    setData(spikeData);
  }

  public void show(int xAt, int yAt, int cellSize) {
      for (int row = 0; row < spikeData.length; row++) {
        for (int col = 0; col < spikeData[row].length; col++) {
          int fillColor = spikeData[row][col];
          if (fillColor != -1) {
            fill(fillColor);
            rect(xAt + col*cellSize, yAt + row*cellSize, cellSize, cellSize);
          }
        }
    }
  }

  public int getHeight() {
    return spikeData.length;
  }

  public int getWidth() {
    return spikeData[0].length;
  }

  public int getX() {
    return (int)pos.x;
  }

  public int getY() {
    return (int)pos.y;
  }
}
