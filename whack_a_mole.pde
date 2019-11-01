/** The margin between the holes */
private static final int MARGIN = 45;

/** Represents the playing field of the game */
private Hole[][] field;

void setup() {
  size(600, 600);
  strokeWeight(2);
  // Create the playing field, initially all of them empty
  field = new Hole[6][6];
  for(int i = 0; i < field.length; i++) {
    Hole[] row = field[i];
    for(int j = 0; j < row.length; j++) {
      row[j] = new Hole(
          (Hole.SIZE + MARGIN) * (i + 0.5),
          (Hole.SIZE + MARGIN) * (j + 0.5));
    }
  }
}

void draw() {
  background(#139e00);
  for(int i = 0; i < field.length; i++) {
    Hole[] row = field[i];
    for(int j = 0; j < row.length; j++) {
      row[j].drawHole();
    }
  }
}

void mouseClicked() {
  // Get the position of the nearest hole in the field
  int i = pmouseX / (MARGIN + Hole.SIZE);
  int j = pmouseY / (MARGIN + Hole.SIZE);
  Hole near = field[i][j];
  // Change the background of the clicked hole
  if (near.isInside(pmouseX, pmouseY)) {
    if (near.hasMole()) {
      near.moleDisappear();
    } else {
      near.moleAppear();
    }
  }
}
