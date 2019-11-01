/**
 * Represents a mole-hole in the whack a mole game
 */
class Hole {
  
  public static final int SIZE = 55;        // The size of the hole
  private float x;                          // the x coordinate of the center of the hole
  private float y;                          // the y coordinate of the center of the hole
  
  private boolean hasMole;
  
  private static final color backgroundColor = #A52A2A;
  private static final color moleColor = #ffff00;          // The color if the hole have a mole in it
  
  /**
   * @param x coordinate of the hole's centre
   * @param y coordinate of the hole's centre
   */
  public Hole(float x, float y) {
    this.x = x;
    this.y = y;
    hasMole = false;
  }
  
  /**
   * Draw the hole onto the screen based on if it has a mole in it or not
   */
  void drawHole() {
    shapeHole(hasMole ? moleColor : backgroundColor);
  }
  
  /**
   * Modify the hole as a mole appear
   */
  void moleAppear() {
    shapeHole(moleColor);
    hasMole = true;
  }
  
  /**
   * Modify the hole as the mole disappear
   */
  void moleDisappear() {
    shapeHole(backgroundColor);
    hasMole = false;
  }
  
  /**
   * Draw the hole onto the screen with the given color as background.
   *
   * @param background the background color of the hole
   */
  private void shapeHole(color background) {
    fill(background);
    circle(x, y, SIZE);
  }
  
  public boolean hasMole() {
    return hasMole;
  }
  
  /**
   * Determine if the given point is inside the hole or not
   *
   * @param x The first coordinate of the point
   * @param y The second coordinate of the point
   * @return true if the given point is inside the hole
   */
  public boolean isInside(float x, float y) {
    float a = Math.abs(x - this.x); // the distance from the centre on x axis
    float b = Math.abs(y - this.y); // the distance from the centre on y axis
    double d = Math.sqrt(Math.pow(a, 2) + Math.pow(b, 2)); // The distance from the centre
    return d <= SIZE / 2; 
  }
}
