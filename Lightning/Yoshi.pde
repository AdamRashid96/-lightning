public class Yoshi extends MovableBoardItem{
  private int[][] yoshiData = {{-1, -1, -1, -1, -1, -1, -1, 0, 0, 0, -1, -1, -1, -1, -1, -1}, 
                       {-1, -1, -1, -1, -1, -1, 0, #1B9319, #1B9319, #1B9319, 0, -1, -1, -1, -1, -1}, 
                       {-1, -1, -1, -1, -1, 0,#1B9319, #1B9319, 255, 255, 255, 0, -1, -1, -1, -1}, 
                       {-1, -1, -1, -1, 0, 0, #1B9319, 255, 255, 0, 255, 0, 0, -1, -1, -1}, 
                       {-1, -1, -1, 0, #1B9319, #30D12E, 255, 255, 255, 0, 255, #1B9319, #30D12E, 0, 0, -1},
                       {-1, -1, -1, 0, #1B9319, #30D12E, 0, 255, 255, 255, #30D12E, #1B9319, #1B9319, 255, #1B9319, 0},
                       {-1, -1, -1, 0, #1B9319, #1B9319, #30D12E, 0, 0, #30D12E, #30D12E, #30D12E, #30D12E, #1B9319, #1B9319, 0},
                       {-1, -1, -1, -1, 0, #1B9319, #30D12E, #30D12E, 255, 0, 0, 0, 0, #30D12E, #30D12E, 0},
                       {-1, -1, -1, -1, 0, #1B9319, #30D12E, #30D12E, 255, 255, 255, 255, 0, 0, 0, -1},
                       {0, -1, 0, 0, #1B9319, #30D12E, #30D12E, 255, 255, 255, 255, 0, -1, -1, -1, -1},
                       {0, 0, #1B9319, #1B9319, #30D12E, #30D12E, 255, 255, 255, 255, 255, 0, -1, -1, -1, -1},
                       {0, #1B9319, #30D12E, #30D12E, #30D12E, 255, 255, 255, 255, 255, 255, 255, 0, -1, -1, -1},
                       {0, #30D12E, 0, 0, 0, 0, 0, 0, 255, 255, 255, 255, 0, -1, -1, -1},
                       {0, 255, 0, #983714, #983714, #DE6336, #DE6336, 0, 0, 255, 255, 255, 0, -1, -1, -1},
                       {-1, 0, 0, #983714, #983714, #983714, #DE6336, 255, 0, 255, 255, 0, -1, -1, -1, -1},
                       {-1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, -1, -1, -1}};
  private int lives = 1;
  public Yoshi(int colAt, int rowAt){
    super(rowAt,colAt);
    setData(yoshiData);
  }
  
  public void show(int xAt, int yAt, int cellSize){
    if(LIFE){
      for (int row = 0; row < yoshiData.length; row++) {
        for (int col = 0; col < yoshiData[row].length; col++) {
          int fillColor = yoshiData[row][col];
          if (fillColor != -1) {
            fill(fillColor);
            rect(xAt + col*cellSize, yAt + row*cellSize, cellSize, cellSize);
          }
        }
      }
    }
  }
  
  public int getWidth() {
    return glyphData[0].length - 5;
  }
  
  public int getLives(){
    return lives;
  }
  
  public void setLives(int l){
    lives = l;
  }
}
