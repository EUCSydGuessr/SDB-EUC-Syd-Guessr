
RandomBillede pic1, pic2;
String billedeNummer = "pic"+int(random(1,3));

void setup() {
  size(1920, 1080);
  background(253, 255, 218);

  
  println(billedeNummer); 

  pic1 = new RandomBillede(739, 276, 2, "Gang1.jpg");
  pic2 = new RandomBillede(502, 173, 2, "KantineTop.jpg");
  
}

void draw() {
  stroke(255);
  fill (255);
  rect(50, 50, 650, 450);
  rect(750, 0, 1920-750, 1080);


  stroke(7, 126, 218);
  fill(7, 126, 218);
  rect(100, 550, 550, 100, 48, 48, 48, 48);

  fill(255);
  String str = "Guess";
  textSize(100);
  textAlign(CENTER, CENTER);
  text(str, 200, 530, 350, 120);

  PImage kort = loadImage("kortOverSkole.jpg");
  image(kort, 0, 0);


  //image();
  pic2.drawIMG();
}


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
    image(billedeIMG, 0, 0);
  }
}
