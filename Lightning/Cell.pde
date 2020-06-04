public class Cell{
 int row, col; 
 
 public Cell(int row, int col){
    this.row = row;
    this.col = col;
 }
 
 public int rowID() { return row; }
 
 public int colID() { return col; }
 
 public String toString() {
   return  "row = " + row + ", col = " + col;
 }
 
 public boolean equals(Object o){
   if(o instanceof Cell){
     Cell c = (Cell)o;
     if(row == c.rowID() && col == c.colID())
       return true;
   }
   return false;
 }
}
