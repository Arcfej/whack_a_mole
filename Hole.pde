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
}
