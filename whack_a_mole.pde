/** The margin between the holes */
private static final int MARGIN = 45;

/** Represents the centres of the holes */
private Coordinate[][] holeCentres;
/** Represents the playing field of the game */
private Hole[][] field;

void setup() {
  size(600, 600);
  strokeWeight(2);
  // Create a two dimensional array with the centre of the holes
  holeCentres = new Coordinate[6][6];
  for(int i = 0; i < holeCentres.length; i++) {
    Coordinate[] row = holeCentres[i];
    for(int j = 0; j < row.length; j++) {
      row[j] = new Coordinate(
          Hole.SIZE / 2 + i * (MARGIN + Hole.SIZE) + MARGIN / 2,
          Hole.SIZE / 2 + j * (MARGIN + Hole.SIZE) + MARGIN / 2
      );
    }
  }
  // Create the playing field, initially all of them empty
  field = new Hole[6][6];
  for(int i = 0; i < field.length; i++) {
    Hole[] row = field[i];
    for(int j = 0; j < row.length; j++) {
      Coordinate coordinate = holeCentres[i][j];
      row[j] = new Hole(coordinate.x, coordinate.y);
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
