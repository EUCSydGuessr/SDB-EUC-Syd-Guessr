

RandomBillede gang1 = new RandomBillede(80,100,"Gang1.jpg");



void setup(){
  gang1.getImage();
  gang1.drawIMG();
}
void draw(){
  
}


class RandomBillede {
  int xbillede;
  int ybillede;
  String billede;
  PImage billedeIMG;

  RandomBillede(int xbillede, int ybillede, String billede) {
    this.xbillede = xbillede;
    this.ybillede = ybillede;
    this.billedeIMG = loadImage(billede);
    this.billede = billede;
  }


  void drawIMG() {
    image(billedeIMG, 0, 0);
  }
}
