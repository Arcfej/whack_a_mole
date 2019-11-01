class Hole {
  
  private static final int size = 25;
  private float x;
  private float y;
  
  private boolean hasMole;
  
  private static final color backgroundColor = #A52A2A;
  private static final color moleColor = #ffff00;
  
  public Hole(float x, float y) {
    this.x = x;
    this.y = y;
    hasMole = false;
  }
  
  void drawHole() {
    shapeHole(backgroundColor);
  }
  
  void moleAppear() {
    shapeHole(moleColor);
    hasMole = true;
  }
  
  void moleDisappear() {
    shapeHole(backgroundColor);
    hasMole = false;
  }
  
  private void shapeHole(color background) {
    fill(background);
    circle(x, y, size);
  }
  
  public boolean hasMole() {
    return hasMole;
  }
}
