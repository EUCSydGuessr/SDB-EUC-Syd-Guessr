//Knap-initiering
import controlP5.*;

ControlP5 cp5;

RandomBillede pic1, pic2, pic3, pic4, pic5, pic6, pic7, pic8, pic9;
int q = 0;
int pStop = 0, p1 = 99, p2 = 99, p3 = 99, p4 = 99;

int xPunkt = 0;
int yPunkt = 0;


//Etage billeder
String etage = "Stuetage";
PImage imgEtagebillede;


String sal = "Stue";

Button Knap1Setting;
Button Knap2Setting;
Button Knap3Setting;


//Zoom & Drag Initiering
float picPreDragX = 1000, picPreDragY = 300;
float xLength = 650, yLength = 450;

float picPostDragX, picPostDragY;

float zoomAmount = 1.0;

boolean insideGuessField = false;


//Rest initiering og navngivning af diverse.
void setup() {
  size(1920, 1080);
  background(253, 255, 218);

  //Indstilling af billeder
  pic1 = new RandomBillede(739, 276, 2, "Pics After/Glasgang.jpg");
  pic2 = new RandomBillede(502, 173, 2, "Pics After/KantineTrappe1.jpg");
  pic3 = new RandomBillede(670, 296, 0, "Pics After/KantineTrappe2.jpg");
  pic4 = new RandomBillede(733, 308, 1, "Pics After/KantineKontorDoor.jpg");
  pic5 = new RandomBillede(674, 313, 2, "Pics After/Vaerksted1.jpg");
  pic6 = new RandomBillede(606, 267, 2, "Pics After/1steG1.jpg");
  pic7 = new RandomBillede(606, 267, 2, "Pics After/1steG1.jpg");
  pic8 = new RandomBillede(606, 267, 2, "Pics After/1steG1.jpg");
  pic9 = new RandomBillede(606, 267, 2, "Pics After/1steG1.jpg");
  pic9 = new RandomBillede(606, 267, 2, "Pics After/1steG1.jpg");



  cp5 = new ControlP5(this);

  //Initiering af knapindstillinger 



  Knap1Setting = cp5.addButton("Forste_sal").setLabel("1. Sal").setPosition(950, 275).setWidth(70).setHeight(20).setColorBackground(#060a80).setColorActive(#252dfa).updateSize();

  Knap2Setting = cp5.addButton("Stueetage").setPosition(950, 300).setColorBackground(#252dfa).setColorActive(#252dfa).updateSize();

  Knap3Setting = cp5.addButton("Kaelder").setPosition(950, 325).setColorBackground(#060a80).setColorActive(#252dfa).updateSize();
}
// Lav knapperne


void draw() {
  //baggrund
  stroke(255);
  fill (255);
  rect(750, 0, 1920-750, 1080);

  //kort 
  imgEtagebillede = loadImage(sal+".png");
  image(imgEtagebillede, picPreDragX, picPreDragY, xLength, yLength);

  fill(253, 255, 218);
  rect(0, 0, 750, 1080);

  stroke(255);
  fill (255);
  rect(50, 50, 650, 450);

  //Guess knap
  stroke(7, 126, 218);
  fill(7, 126, 218);
  rect(100, 550, 550, 100, 48, 48, 48, 48);

  fill(255);
  String guessButton = "Guess";
  textSize(100);
  textAlign(CENTER, CENTER);
  text(guessButton, 200, 530, 350, 120);

  println(etage);



  //Zoom mus lokation
  if (mouseX > 750 && mouseY > 0 && mouseX < 1920 && mouseY < 1080) {
    insideGuessField = true;
  } else insideGuessField = false;


  picPostDragX = mouseX-picPreDragX;
  picPostDragY = mouseY-picPreDragY;

  //Billede på skærm
  while (q <= 0 & pStop <= 4) {
    q = q + int(random(1, 7));
    if (q == p1) q = 0;
    if (q == p2) q = 0;
    if (q == p3) q = 0;
    if (q == p4) q = 0;

    println("Billedet der er valgt er "+q+" og p er "+p1+" "+p2+" "+p3+" "+p4);
  }
 

  if (q == 1) {
    pic1.drawIMG(); 
    xPunkt = pic1.xbillede;
    yPunkt = pic1.ybillede;
  } else if (q == 2) {
    pic2.drawIMG(); 
    xPunkt = pic2.xbillede;
    yPunkt = pic2.ybillede;
  } else if (q == 3) {
    pic3.drawIMG(); 
    xPunkt = pic3.xbillede;
    yPunkt = pic3.ybillede;
  } else if (q == 4) {
    pic4.drawIMG(); 
    xPunkt = pic4.xbillede;
    yPunkt = pic4.ybillede;
  } else if (q == 5) {
    pic5.drawIMG(); 
    xPunkt = pic5.xbillede;
    yPunkt = pic5.ybillede;
  } else if (q == 6) {
    pic6.drawIMG(); 
    xPunkt = pic6.xbillede;
    yPunkt = pic6.ybillede;
  } 

  //Gættering og placering af gæt
}

void keyReleased() {
  if (key == BACKSPACE) {
    if (p1 == 99) p1 = q;
    else if (p2 == 99) p2 = q;
    else if (p3 == 99) p3 = q;
    else if (p4 == 99) p4 = q;

    q = 0;
    pStop = pStop + 1;
  }
}






//Hvad gør den første knap:
public void Forste_sal() {
  println("1ste knap aktiv");

  fill(255);
  rect(1000, 400, 600, 450);
  sal = "1_sal";
  etage = "1. sal";



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
  etage = "Stue";


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
  etage = "Kælder";



  Knap3Setting.setColorBackground(#252dfa);
  Knap1Setting.setColorBackground(#060a80);
  Knap2Setting.setColorBackground(#060a80);
}


//Zoomies 
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

  //Før start
  float musXplacement = mouseX;
  float musYplacement = mouseY;

  float musDiffX = (musXplacement - picPreDragX)/zoomAmount;
  float musDiffY = (musYplacement - picPreDragY)/zoomAmount;


  float musXB4ZTest = musDiffX * zoomAmount;
  float musYB4ZTest = musDiffY * zoomAmount;


  float musXB4Z = (musXplacement - picPreDragX)*zoomAmount;
  float musYB4Z = (musYplacement - picPreDragY)*zoomAmount;


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


  //Efter start
  float musXafterZ = (musXplacement - picPreDragX)*zoomAmount;
  float musYafterZ = (musYplacement - picPreDragY)*zoomAmount;

  float musXafterZTest = musDiffX*zoomAmount;
  float musYafterZTest = musDiffY*zoomAmount;


  picPreDragX += (musXB4ZTest - musXafterZTest);
  picPreDragY += (musYB4ZTest - musYafterZTest);



  // println(e);
  println(zoomAmount);
}




//Skabelse af klassen Randombillede
class RandomBillede {
  int xbillede;
  int ybillede;
  int etageTal; //Kælder = 0, Stue = 1, 1. Sal = 2
  String billede;
  PImage billedeIMG;

  RandomBillede(int xbillede, int ybillede, int etageTal, String billede) {
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
