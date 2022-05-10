//Knap-initiering
import controlP5.*;
ControlP5 cp5;

ControlFont fontSmallButt;
ControlFont fontBigButt;

Button Knap1Setting;
Button Knap2Setting;
Button Knap3Setting;
Button Knap4Setting;
Button Knap5Setting;

int etage = 2;

//Billede skaber
RandomBillede pic1, pic2, pic3, pic4, pic5, pic6, pic7, pic8, pic9, pic10;
int q = 0;
int pStop = 0, p1 = 99, p2 = 99, p3 = 99, p4 = 99;

//Etage billeder
PImage imgEtagebillede;

String sal = "Stue";

//Zoom & Drag Initiering
float picPreDragX = 1000, picPreDragY = 300;
float xLength = 650, yLength = 450;

float picPostDragX, picPostDragY;

float zoomAmount = 1.0;

boolean insideGuessField = false;

//Gætte-ring placering
float ringPlacementX = 0, ringPlacementY = 0;
float ringPostPlacementX = 0, ringPostPlacementY = 0;
float ringSize = 10;

boolean ringPlaced = false;
boolean guessMade = false;

//Faktisk punkt
float xPunkt = 0, yPunkt = 0;
float faktiskPunktPlacementX = 0, faktiskPunktPlacementY = 0;
float faktiskPunktPostPlacementX = 0, faktiskPunktPostPlacementY = 0;

boolean tegnBillede = true;

//Score
int totalScore = 0;

int faktiskEtage = 0;
int etageGuess = 0;
String actualScore = "";
String totalScoreText = "";

//EndGame
boolean gameDone = false;
int gameColor = 255;
  
int runde = 1;



void setup() {
  size(1920, 1080);
  background(253, 255, 218);

  //Indstilling af billeder
  pic1 = new RandomBillede(1406, 675, 3, "Pics After/Glasgang.jpg");
  pic2 = new RandomBillede(1455, 504, 3, "Pics After/KantineTrappe1.jpg");
  pic3 = new RandomBillede(1405, 460, 3, "Pics After/KantineTrappe2.jpg");
  pic4 = new RandomBillede(1459, 518, 2, "Pics After/KantineKontorDoor.jpg");
  pic5 = new RandomBillede(1349, 417, 2, "Pics After/Vaerksted1.jpg");
  pic6 = new RandomBillede(1352, 666, 2, "Pics After/1steG1.jpg");
  pic7 = new RandomBillede(1433, 523, 1, "Pics After/CykelKaelder.jpg");
  pic8 = new RandomBillede(1367, 643, 1, "Pics After/VallesKaelder.jpg");
  pic9 = new RandomBillede(1478, 675, 1, "Pics After/SyKaelderTrappe.jpg");
  pic10 = new RandomBillede(1355, 659, 1, "Pics After/VallesGang1.jpg");

  // ÆNDRE KOORDINATER... SVIN!

  cp5 = new ControlP5(this);

  PFont smallFont = createFont("Bahnschrift", 14);
  fontSmallButt = new ControlFont(smallFont);

  PFont bigFont = createFont("", 40);
  fontBigButt = new ControlFont(bigFont);

  //Initiering af knapindstillinger 
  Knap1Setting = cp5.addButton("Forste_sal").setLabel("Første Sal").setPosition(950, 275).setSize(100, 30).setFont(fontSmallButt).setColorBackground(#060a80).setColorActive(#252dfa).updateSize();

  Knap2Setting = cp5.addButton("Stueetage").setPosition(950, 300).setSize(100, 30).setFont(fontSmallButt).setColorBackground(#252dfa).setColorActive(#252dfa).updateSize();

  Knap3Setting = cp5.addButton("Kaelder").setLabel("Kælder").setPosition(950, 325).setSize(100, 30).setFont(fontSmallButt).setColorBackground(#060a80).setColorActive(#252dfa).updateSize();

  Knap4Setting = cp5.addButton("Guess").setPosition(100, 550).setSize(550, 100).setFont(fontBigButt).setColorBackground(#077eda);

  Knap5Setting = cp5.addButton("Next").setPosition(100, 550).setSize(550, 100).setFont(fontBigButt).setColorBackground(#077eda).setVisible(false);
}


void draw() {
  //baggrund
  stroke(255);
  fill (255);
  rect(750, 0, 1920-750, 1080);

  //kort 
  imgEtagebillede = loadImage(sal+".png");
  image(imgEtagebillede, picPreDragX, picPreDragY, xLength, yLength);

  //Gætte-ring
  if (ringPlaced == true) {
    fill(255, 0, 0, 50);
    stroke(255, 0, 0);
    circle(ringPlacementX, ringPlacementY, ringSize);
  }

  /* Faktisk Ring, der kan bruges til at visualisere det perfekte gæt 
   fill(0, 0, 255, 50);
   stroke(0, 0, 255);
   circle(xPunkt, yPunkt, ringSize);
   */

  stroke(255);
  fill(253, 255, 218);
  rect(0, 0, 750, 1080);

  stroke(gameColor);
  fill (gameColor);
  rect(50, 50, 650, 450);

  /*
  stroke(7, 126, 218);
   fill(255);
   String guessButton = "Guess";
   textSize(100);
   textAlign(CENTER, CENTER);
   text(guessButton, 200, 530, 350, 120);
   */


  //Zoom mus lokation
  if (mouseX > 750 && mouseY > 0 && mouseX < 1920 && mouseY < 1080) {
    insideGuessField = true;
  } else insideGuessField = false;

  picPostDragX = mouseX-picPreDragX;
  picPostDragY = mouseY-picPreDragY;

  ringPostPlacementX = mouseX-ringPlacementX; 
  ringPostPlacementY = mouseY-ringPlacementY;

  faktiskPunktPostPlacementX = mouseX-xPunkt;
  faktiskPunktPostPlacementY = mouseY-yPunkt;



  //Billede på skærm
  while (q <= 0 & pStop <= 4) {
    q = q + int(random(1, 11));
    if (q == p1) q = 0;
    if (q == p2) q = 0;
    if (q == p3) q = 0;
    if (q == p4) q = 0;

    println("Billedet der er valgt er "+q+" og p er "+p1+" "+p2+" "+p3+" "+p4);
  }


  if (q == 1) {
    pic1.drawIMG(); 
    faktiskEtage = pic1.etageTal; 
    if (tegnBillede == true) {
      xPunkt = pic1.xbillede;
      yPunkt = pic1.ybillede;
      tegnBillede = false;
    }
  } else if (q == 2) {
    pic2.drawIMG(); 
    faktiskEtage = pic2.etageTal; 
    if (tegnBillede == true) {
      xPunkt = pic2.xbillede;
      yPunkt = pic2.ybillede;
      tegnBillede = false;
    }
  } else if (q == 3) {
    pic3.drawIMG(); 
    faktiskEtage = pic3.etageTal; 
    if (tegnBillede == true) {
      xPunkt = pic3.xbillede;
      yPunkt = pic3.ybillede;
      tegnBillede = false;
    }
  } else if (q == 4) {
    pic4.drawIMG(); 
    faktiskEtage = pic4.etageTal; 
    if (tegnBillede == true) {
      xPunkt = pic4.xbillede;
      yPunkt = pic4.ybillede;
      tegnBillede = false;
    }
  } else if (q == 5) {
    pic5.drawIMG(); 
    faktiskEtage = pic5.etageTal; 
    if (tegnBillede == true) {
      xPunkt = pic5.xbillede;
      yPunkt = pic5.ybillede;
      tegnBillede = false;
    }
  } else if (q == 6) {
    pic6.drawIMG(); 
    faktiskEtage = pic6.etageTal; 
    if (tegnBillede == true) {
      xPunkt = pic6.xbillede;
      yPunkt = pic6.ybillede;
      tegnBillede = false;
    }
  } else if (q == 7) {
    pic7.drawIMG(); 
    faktiskEtage = pic7.etageTal; 
    if (tegnBillede == true) {
      xPunkt = pic7.xbillede;
      yPunkt = pic7.ybillede;
      tegnBillede = false;
    }
  } else if (q == 8) {
    pic8.drawIMG(); 
    faktiskEtage = pic8.etageTal; 
    if (tegnBillede == true) {
      xPunkt = pic8.xbillede;
      yPunkt = pic8.ybillede;
      tegnBillede = false;
    }
  } else if (q == 9) {
    pic9.drawIMG(); 
    faktiskEtage = pic9.etageTal; 
    if (tegnBillede == true) {
      xPunkt = pic9.xbillede;
      yPunkt = pic9.ybillede;
      tegnBillede = false;
    }
  } else if (q == 10) {
    pic10.drawIMG(); 
    faktiskEtage = pic10.etageTal; 
    if (tegnBillede == true) {
      xPunkt = pic10.xbillede;
      yPunkt = pic10.ybillede;
      tegnBillede = false;
    }
  }

  if (guessMade == true) {
    strokeWeight(4);
    stroke(255, 0, 0);
    line(xPunkt, yPunkt, ringPlacementX, ringPlacementY);
    strokeWeight(2);
    stroke(0, 0, 0);
    circle(xPunkt, yPunkt, 8);

    stroke(0);
    fill(0);
    textSize(45);
    textAlign(CENTER, CENTER);
    text(actualScore, 375, 735);
  }
  stroke(0);
  fill(0);
  textSize(45);
  textAlign(CENTER, CENTER);
  text(totalScoreText, 375, 680);
  
  if(gameDone == true){
  fill(255);
    text("Game Over", 375,275);
  
  }
}


void mouseClicked() {
  if (mouseButton == LEFT) if (insideGuessField == true)if (guessMade == false) {
    ringPlacementX = mouseX;
    ringPlacementY = mouseY;
    ringPlaced = true;
    etageGuess = etage;
  }
}

//Hvad gør Guess-knappen:
public void Guess() {
  if (ringPlaced == true) {
    int subtraheringAfScore = 0;

    float xScoreForskel = abs(xPunkt - ringPlacementX), yScoreForskel = abs(yPunkt - ringPlacementY);
    float underRod = (pow(xScoreForskel, 2)+pow(yScoreForskel, 2));
    float koordForskelScore = sqrt(underRod);

    koordForskelScore = koordForskelScore / zoomAmount;

    if (koordForskelScore<=5.5) {
      subtraheringAfScore = 0;
    } else {
      subtraheringAfScore = int(koordForskelScore);
    }

    int score = (500 - subtraheringAfScore)-(abs(faktiskEtage-etageGuess)*50);

    totalScore += score;


    String scoreToScreen = str(score);
    actualScore = "Din score i denne runde er: " + scoreToScreen;

    String totalScoreToScreen = str(totalScore);
    totalScoreText = "Total Score: " + totalScoreToScreen;


    Knap4Setting.hide();
    Knap5Setting.show();
    guessMade = true;
    println(totalScore);
  }
}

public void Next() {
  if(runde == 5){
   gameDone = true;
   gameColor = 0;
  }
  
  if (p1 == 99) p1 = q;
  else if (p2 == 99) p2 = q;
  else if (p3 == 99) p3 = q;
  else if (p4 == 99) p4 = q;

  q = 0;
  pStop = pStop + 1;

  Knap5Setting.hide();
  if(gameDone == false) Knap4Setting.show();

  picPreDragX = 1000;
  picPreDragY = 300;
  zoomAmount = 1;

  xLength = 650 * zoomAmount;
  yLength = 450 * zoomAmount;
  ringSize = 10 * zoomAmount;

  ringPlacementX = 0;
  ringPlacementY = 0;
  ringPlaced = false;
  guessMade = false;
  tegnBillede = true;
  

  
  
  runde++;
  
  println("Du er lige startet på runde " + runde);
  println("Game is done = " + gameDone);
}

//Hvad gør den første knap:
public void Forste_sal() {
  println("1ste knap aktiv");

  fill(255);
  rect(1000, 400, 600, 450);
  sal = "1_sal";
  etage = 3;

  Knap1Setting.setColorBackground(#252dfa);
  Knap2Setting.setColorBackground(#060a80);
  Knap3Setting.setColorBackground(#060a80);
}


//Hvad gør den anden knap:
public void Stueetage() {
  println("2nden knap aktiv");

  fill(255);
  rect(1000, 400, 600, 450);
  sal= "Stue";
  etage = 2;

  Knap2Setting.setColorBackground(#252dfa);
  Knap1Setting.setColorBackground(#060a80);
  Knap3Setting.setColorBackground(#060a80);
}

//Hvad gør den tredje knap:
public void Kaelder() {
  println("Kælder er aktiv");

  fill(255);
  rect(1000, 400, 600, 450);
  sal="Kaelder";
  etage = 1;

  Knap3Setting.setColorBackground(#252dfa);
  Knap1Setting.setColorBackground(#060a80);
  Knap2Setting.setColorBackground(#060a80);
}



//Zoom and Drag
void mouseDragged() {
  if (insideGuessField) {
    picPreDragX = mouseX-picPostDragX;
    picPreDragY = mouseY-picPostDragY;

    ringPlacementX = mouseX-ringPostPlacementX;
    ringPlacementY = mouseY-ringPostPlacementY;

    xPunkt = mouseX-faktiskPunktPostPlacementX;
    yPunkt = mouseY-faktiskPunktPostPlacementY;
  }
}

void mouseWheel(MouseEvent spin) {
  if (insideGuessField) {
    float e = spin.getCount();
    boolean borderMin = false, borderMax = false;

    e = (e / 10)*2.5;

    //Før start
    float musXplacement = mouseX;
    float musYplacement = mouseY;

    float musDiffX = (musXplacement - picPreDragX)/zoomAmount, musDiffY = (musYplacement - picPreDragY)/zoomAmount;
    float musRingDiffX = (musXplacement - ringPlacementX)/zoomAmount, musRingDiffY = (musYplacement - ringPlacementY)/zoomAmount;
    float musFaktiskDiffX = (musXplacement - xPunkt)/zoomAmount, musFaktiskDiffY = (musYplacement - yPunkt)/zoomAmount;

    float musXB4Z = musDiffX * zoomAmount, musYB4Z = musDiffY * zoomAmount;
    float musRingXB4Z = musRingDiffX * zoomAmount, musRingYB4Z = musRingDiffY * zoomAmount;
    float musFaktiskXB4Z = musFaktiskDiffX * zoomAmount, musFaktiskYB4Z = musFaktiskDiffY * zoomAmount;


    //slut

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

    xLength = 650*zoomAmount;
    yLength = 450*zoomAmount;
    ringSize = 10*zoomAmount;

    //Efter start
    float musXafterZ = musDiffX*zoomAmount, musYafterZ = musDiffY*zoomAmount;
    float musRingXafterZ = musRingDiffX*zoomAmount, musRingYafterZ = musRingDiffY*zoomAmount;
    float musFaktiskXafterZ = musFaktiskDiffX*zoomAmount, musFaktiskYafterZ = musFaktiskDiffY*zoomAmount;

    picPreDragX += (musXB4Z - musXafterZ);
    picPreDragY += (musYB4Z - musYafterZ);

    ringPlacementX += (musRingXB4Z - musRingXafterZ);
    ringPlacementY += (musRingYB4Z - musRingYafterZ);

    xPunkt += (musFaktiskXB4Z - musFaktiskXafterZ);
    yPunkt += (musFaktiskYB4Z - musFaktiskYafterZ);
  }

  // println(e);
  println(zoomAmount);
}









//Skabelse af klassen Randombillede
class RandomBillede {
  float xbillede;
  float ybillede;
  int etageTal; //Kælder = 1, Stue = 2, 1. Sal = 3
  String billede;
  PImage billedeIMG;

  RandomBillede(float xbillede, float ybillede, int etageTal, String billede) {
    this.xbillede = xbillede;
    this.ybillede = ybillede;
    this.etageTal = etageTal;
    this.billedeIMG = loadImage(billede);
    this.billede = billede;
  }

  void drawIMG() {
    image(billedeIMG, 51, 51 );
  }
}
