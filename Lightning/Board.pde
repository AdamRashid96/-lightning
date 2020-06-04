public class Board {
  PVector pos;
  PVector movement;
  int rows, cols;
  int rectHeight, rectWidth;
  int cellSize;
  int [][] layer;
  ArrayList<MovableBoardItem> items;

  public Board(int x, int y, int numRows, int numCols, int h, int w, int cellSize) {
    pos = new PVector(x,y);
    movement = new PVector(0,0);
    rectHeight = h;
    rectWidth = w;
    rows = numRows;
    cols = numCols;
    this.cellSize = cellSize;
    items = new ArrayList<MovableBoardItem>();
  }
  
  public void update(){
    pos.add(movement.mult(5/frameRate));
  }

  public void show() {
    pushMatrix();
    fill(255);
    fill(#87ceeb);
    noStroke();
    rect(0, height/20, rectWidth * cellSize, rectHeight * cellSize);
    fill(#79F70C);
    rect(0, rectHeight * cellSize + height/20, rectWidth * cellSize, 40);
    for (MovableBoardItem item : items) {
      int xAt = item.getColId()*cellSize;
      int yAt = item.getRowId()*cellSize;
      item.show(int(xAt + pos.x), int(yAt + pos.y), cellSize);
    }
    popMatrix();
  }

  public void addMovableItem(MovableBoardItem item) {
    items.add(item);
    item.setBounds(rows, cols);
  }

  protected void drawLayerCell(int rowID, int colID, int x, int y) {
    if (layer!= null) {
      if (layer.length > rowID) {
        if (layer[rowID].length > colID) {
          int cellColor = layer[rowID][colID];
          fill(cellColor);
          rect(x, y, cellSize, cellSize);
        }
      }
    }
  }

  public Cell getCell(int x, int y) {
    x = (int)(x - pos.x);
    y = (int)(y - pos.y);
    int xAt = x/cellSize;
    int yAt = y/cellSize;

    return new Cell(yAt, xAt);
  }

  public void addLayer(int[][] layer) { 
    this.layer = layer;
  }

  public int row() { 
    return rows;
  }

  public int col() { 
    return cols;
  }
  
  public int getCellSize(){
    return cellSize;
  }

  public int getW() { 
    return rectWidth;
  }

  public int getH() { 
    return rectHeight;
  }

  public int getX() { 
    return (int)pos.x;
  }

  public int getY() { 
    return (int)pos.y;
  }

  public void setPos(PVector p){
    pos.set(p);
  }
  public void applyForce(PVector t){
    movement.add(t.mult(-1));
  }
}
