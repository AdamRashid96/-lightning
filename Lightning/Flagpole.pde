public class Flagpole extends MovableBoardItem {
  PVector normVec; 
  int[][] flag = {{255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255}, 
    {-1, 255, 255, 255, 255, 255, 255, 255, 255, 255, #0D9300, #0D9300, #0D9300, #0D9300, #0D9300, #0D9300, #0D9300, 255, 255}, 
    {-1, -1, 255, 255, 255, 255, 255, 255, 255, #0D9300, #0D9300, 255, 255, #0D9300, 255, 255, #0D9300, #0D9300, 255}, 
    {-1, -1, -1, 255, 255, 255, 255, 255, 255, #0D9300, #0D9300, 255, 255, #0D9300, 255, 255, #0D9300, #0D9300, 255}, 
    {-1, -1, -1, -1, 255, 255, 255, 255, 255, #0D9300, 255, 255, 255, #0D9300, 255, 255, 255, #0D9300, 255}, 
    {-1, -1, -1, -1, -1, 255, 255, 255, 255, #0D9300, 255, 255, #0D9300, #0D9300, #0D9300, 255, 255, #0D9300, 255}, 
    {-1, -1, -1, -1, -1, -1, 255, 255, 255, #0D9300, #0D9300, #0D9300, #0D9300, 255, #0D9300, #0D9300, #0D9300, #0D9300, 255}, 
    {-1, -1, -1, -1, -1, -1, -1, 255, 255, #0D9300, #0D9300, #0D9300, #0D9300, #0D9300, #0D9300, #0D9300, #0D9300, #0D9300, 255}, 
    {-1, -1, -1, -1, -1, -1, -1, -1, 255, 255, 255, 255, #0D9300, #0D9300, #0D9300, 255, 255, 255, 255}, 
    {-1, -1, -1, -1, -1, -1, -1, -1, -1, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255}, 
    {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 255, 255, 255, 255, 255, 255, 255, 255, 255}, 
    {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 255, 255, 255, 255, 255, 255, 255, 255}, 
    {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 255, 255, 255, 255, 255, 255, 255}, 
    {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 255, 255, 255, 255, 255, 255}, 
    {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 255, 255, 255, 255, 255}, 
    {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 255, 255, 255, 255}, 
    {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 255, 255, 255}, 
    {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 255, 255}, 
    {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 255}};
  
 int[][] flagTop = {{-1, -1, 0, 0, 0, 0, 0, -1, -1}, 
                      {-1, 0, #87D800, #0D9300, #0D9300, #0D9300, #0D9300, 0, -1}, 
                      {0, #87D800, #0D9300, #0D9300, #0D9300, #0D9300, #0D9300, #0D9300, 0}, 
                      {0, #87D800, #0D9300, #0D9300, #0D9300, #0D9300, #0D9300, #0D9300, 0}, 
                      {0, #0D9300, #0D9300, #0D9300, #0D9300, #0D9300, #0D9300, #0D9300, 0}, 
                      {0, #0D9300, #0D9300, #0D9300, #0D9300, #0D9300, #0D9300, #0D9300, 0}, 
                      {0, #0D9300, #0D9300, #0D9300, #0D9300, #0D9300, #0D9300, #0D9300, 0}, 
                      {-1, 0, #0D9300, #0D9300, #0D9300, #0D9300, #0D9300, 0, -1}, 
                      {-1, -1, 0, 0, 0, 0, 0, -1, -1}};
  int[][] pole;
  public Flagpole(int colAt, int rowAt) {
    super(rowAt, colAt);
    normVec = new PVector(0, 10); //-60 for bounce
    pole = new int[150][3];
    for (int row = 0; row < pole.length; row++) {
      for (int col = 0; col < pole[row].length; col++) {
        pole[row][col] = #89D801;
      }
    }
    setData(flag);
    setData(flagTop);
    setData(pole);
  }

  public void show(int xAt, int yAt, int cellSize) {
    for (int row = 0; row < pole.length; row++) {
      for (int col = 0; col < pole[row].length; col++) {
        int fillColor = pole[row][col];
        if (fillColor != -1) {
          fill(fillColor);
          rect(xAt + col*cellSize, yAt + row*cellSize, cellSize, cellSize);
        }
      }
    }   
    for (int row = 0; row < flagTop.length; row++) {
      for (int col = 0; col < flagTop[row].length; col++) {
        int fillColor = flagTop[row][col];
        if (fillColor != -1) {
          fill(fillColor);
          rect(xAt + col*cellSize - (flagTop[row].length*cellSize)/2 + 3, yAt + row*cellSize - flagTop.length*cellSize, cellSize, cellSize);
        }
      }
    }
    for (int row = 0; row < flag.length; row++) {
      for (int col = 0; col < flag[row].length; col++) {
        int fillColor = flag[row][col];
        if (fillColor != -1) {
          fill(fillColor);
          rect(xAt + col*cellSize - flag[row].length*cellSize + 3, yAt + row*cellSize + 3, cellSize, cellSize);
        }
      }
    }
  }

  public PVector getNormVec() {
    return normVec;
  }

  public int getHeight() {
    return pole.length;
  }

  public int getWidth() {
    return pole[0].length;
  }

  public int getX() {
    return (int)pos.x;
  }

  public int getY() {
    return (int)pos.y;
  }
}
