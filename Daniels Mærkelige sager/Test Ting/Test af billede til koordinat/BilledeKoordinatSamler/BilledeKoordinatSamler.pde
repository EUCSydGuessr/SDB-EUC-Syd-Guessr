
RandomBillede pic1, pic2, pic3;
int q = 0;
int x = 0;
int y = 0;

void setup() {
  size(1920, 1080);
  background(253, 255, 218);


  pic1 = new RandomBillede(739, 276, 2, "Gang1.jpg");
  pic2 = new RandomBillede(502, 173, 2, "KantineTop.jpg");
  pic3 = new RandomBillede(670, 296, 0, "ValleRadio.jpg");
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


  while (q <= 0) {
    q = q + int(random(1, 4));
    println("Billedet der er valgt er "+q);
  }

  if (q == 1) {
    pic1.drawIMG(); 
    x = pic1.xbillede;
    y = pic1.ybillede;
  } else if (q == 2) {
    pic2.drawIMG(); 
    x = pic2.xbillede;
    y = pic2.ybillede;
  } else if (q == 3) {
    pic3.drawIMG(); 
    x = pic3.xbillede;
    y = pic3.ybillede;
  } 

  println(x+" og "+y);
}

 void keyReleased(){
    if (key == BACKSPACE) {
      q = q-4;
    }
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
