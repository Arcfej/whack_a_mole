/** The margin between the holes */
private static final int MARGIN = 45;
private static final int FIELD_SIZE = 6;

/** Represents the playing field of the game */
private Hole[][] field;

/** The score of the game */
private int score = 0;

/** The seconds for the game has been running */
private int runningTime;

/** The time when the last mole appeared */
private int lastMole;

void setup() {
  size(600, 600);
  strokeWeight(2);
  // Create the playing field, initially all of them empty
  field = new Hole[FIELD_SIZE][FIELD_SIZE];
  for(int i = 0; i < field.length; i++) {
    Hole[] row = field[i];
    for(int j = 0; j < row.length; j++) {
      row[j] = new Hole(
          (Hole.SIZE + MARGIN) * (i + 0.5),
          (Hole.SIZE + MARGIN) * (j + 0.5));
    }
  }
  runningTime = millis();
  lastMole = runningTime;
}

void draw() {
  background(#139e00);
  for(int i = 0; i < field.length; i++) {
    Hole[] row = field[i];
    for(int j = 0; j < row.length; j++) {
      row[j].drawHole();
    }
  }
  runningTime = millis();
  // Every second a mole appear on a random place
  if (runningTime - lastMole >= 1000) {
    field[int(random(FIELD_SIZE))][int(random(FIELD_SIZE))].moleAppear();
    lastMole = millis();
  }
}

void mouseClicked() {
  // Get the position of the nearest hole in the field
  int i = pmouseX / (MARGIN + Hole.SIZE);
  int j = pmouseY / (MARGIN + Hole.SIZE);
  Hole near = field[i][j];
  // Is the player clicked on a hole?
  if (near.isInside(pmouseX, pmouseY)) {
    // If the player hit a mole, increase the score
    if (near.hasMole()) {
      near.moleDisappear();
      score++;
    }
  }
}
