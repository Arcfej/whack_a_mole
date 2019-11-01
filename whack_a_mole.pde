private static final int MARGIN = 45;

private Hole[][] field;

void setup() {
  size(600, 600);
  //noLoop();
  strokeWeight(2);
  field = new Hole[6][6];
  for(int i = 0; i < field.length; i++) {
    Hole[] row = field[i];
    for(int j = 0; j < row.length; j++) {
      row[j] = new Hole(
          Hole.SIZE / 2 + i * (MARGIN + Hole.SIZE) + MARGIN / 2,
          Hole.SIZE / 2 + j * (MARGIN + Hole.SIZE) + MARGIN / 2
      );
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
