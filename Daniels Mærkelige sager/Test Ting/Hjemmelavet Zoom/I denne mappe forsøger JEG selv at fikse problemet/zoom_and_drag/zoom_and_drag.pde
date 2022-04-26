//Initiering:
PImage schoolMap;

//imageMode(CENTER)
//float picPreDragX = 1335, picPreDragY = 540;

//imageMode(CORNER)
float picPreDragX = 750, picPreDragY = 237;

float picPostDragX, picPostDragY;

float zoomAmount = 1.0;

boolean insideGuessField = false;


float px, py, xZoomLength, yZoomLength;


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
  image(schoolMap, picPreDragX, picPreDragY, 1200*zoomAmount, 607*zoomAmount);

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

  q = picPreDragX + 1200;

  stoer1 = q - mouseX;
  stoer2 = picPreDragX + mouseX;

<<<<<<< Updated upstream
=======
  forhold = stoer2/stoer1;

  
  
  //println(forhold);
  //println(mouseX-750);

>>>>>>> Stashed changes
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
  println(e);

  xZoomLength = mouseX - (picPreDragX * zoomAmount);
  yZoomLength = mouseY - (picPreDragY * zoomAmount);

  if (zoomAmount == 0.75) borderMin = true;
  else if (zoomAmount == 4.0) borderMax = true;
  else {
    borderMin = false;
    borderMax = false;
  }

  float opa = (picPreDragX+(1200*zoomAmount))-mouseX;


  if (zoomAmount >= 0.75 && zoomAmount <= 4.0) {
    if (!borderMin && !borderMax) {
      zoomAmount = zoomAmount + e;
      px = xZoomLength * zoomAmount;
      py = yZoomLength * zoomAmount;
      picPreDragX = mouseX - px;
      picPreDragY = mouseY - py;
    } else if (borderMin && e > 0.0) {
      zoomAmount = zoomAmount + e;
      px = xZoomLength * zoomAmount;
      py = yZoomLength * zoomAmount;
      picPreDragX = mouseX - px;
      picPreDragY = mouseY - py;
    } else if (borderMax && e < 0.0) {
      zoomAmount = zoomAmount + e;
      px = xZoomLength * zoomAmount;
      py = yZoomLength * zoomAmount;
      picPreDragX = mouseX - px;
      picPreDragY = mouseY - py;
    }
  }


  float opb = (picPreDragX+(1200*zoomAmount))-mouseX;

  println(opa);
  println(opb);

  println(zoomAmount);
}
