//Initiering:
PImage schoolMap;

//imageMode(CENTER)
//float picPreDragX = 1335, picPreDragY = 540;

//imageMode(CORNER)
float picPreDragX = 750, picPreDragY = 237;
float picZoomSizeX = 1200, picZoomSizeY = 607;

float picPostDragX, picPostDragY;

float zoomAmount = 1.0;

boolean insideGuessField = false;


void setup() {
  size(1920, 1080);
  background(253, 255, 218);


  schoolMap = loadImage("kortOverSkole.jpg");
}

void draw() {
  stroke(255);
  fill (255);
  rect(750, 0, 1920-750, 1080);

  imageMode(CORNER);
  image(schoolMap, picPreDragX, picPreDragY, picZoomSizeX, picZoomSizeY);

  fill(253, 255, 218);
  rect(0, 0, 750, 1080);

  stroke(255);
  fill (255);
  rect(50, 50, 650, 450);


  stroke(7, 126, 218);
  fill(7, 126, 218);
  rect(100, 550, 550, 100, 48, 48, 48, 48);

  fill(255);
  String guessButton = "Guess";
  textSize(100);
  textAlign(CENTER, CENTER);
  text(guessButton, 200, 530, 350, 120);



  if (mouseX > 750 && mouseY > 0 && mouseX < 1920 && mouseY < 1080) {
    insideGuessField = true;
  } else insideGuessField = false;


  picPostDragX = mouseX-picPreDragX;
  picPostDragY = mouseY-picPreDragY;
}


void mouseDragged() {
  if (insideGuessField) {
    picPreDragX = mouseX-picPostDragX;
    picPreDragY = mouseY-picPostDragY;
  }
}

void mouseWheel(MouseEvent spin) {
  float e = spin.getCount();
  boolean borderMin = false, borderMax = false;

  e = (e / 10)*2.5;

  //NEW TOP SECTION
  float newMus = mouseX * zoomAmount;

  float yTilMusB4 = picZoomSizeX - newMus;

  //AFTER

  if (zoomAmount == 0.75) borderMin = true;
  else if (zoomAmount == 4.0) borderMax = true;
  else {
    borderMin = false;
    borderMax = false;
  }

  if (zoomAmount >= 0.75 && zoomAmount <= 4.0) {
    if (!borderMin && !borderMax)zoomAmount = zoomAmount + e;
    else if (borderMin && e > 0.0)zoomAmount = zoomAmount + e;
    else if (borderMax && e < 0.0)zoomAmount = zoomAmount + e;
  }

  picZoomSizeX = 1200*zoomAmount;
  picZoomSizeY = 607*zoomAmount;

  //NEW BOTtom SECTION
  float yTilMusAfter = yTilMusB4 * zoomAmount;

  float xPectedDiff = picZoomSizeX - (mouseX * zoomAmount);
  
  float actualDiff = xPectedDiff - yTilMusAfter;
  
  picPreDragX = picPreDragX - actualDiff; 
  //AFTER

  

  println(e);
  println(zoomAmount);
}
