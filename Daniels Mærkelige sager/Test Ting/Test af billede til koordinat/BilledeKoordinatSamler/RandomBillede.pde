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
