// knap
import controlP5.*;

ControlP5 cp5;

//etage billeder
String etage = "Stuetage";
PImage imgEtagebillede;


String sal = "Stue";

Button Knap1Setting;
Button Knap2Setting;
Button Knap3Setting;

//Al initiering og navngivning af diverse.

void setup() {
  size(1920, 1080);
  background(253, 255, 218);





  cp5 = new ControlP5(this);
  //Initieringsfis tror jeg 

  Knap1Setting = cp5.addButton("Forste_sal").setPosition(950, 275).setColorBackground(#060a80).setColorActive(#252dfa).updateSize();

  Knap2Setting = cp5.addButton("Stueetage").setPosition(950, 300).setColorBackground(#252dfa).setColorActive(#252dfa).updateSize();

  Knap3Setting = cp5.addButton("Kaelder").setPosition(950, 325).setColorBackground(#060a80).setColorActive(#252dfa).updateSize();
}
// Lav knapperne

void draw() {

  //baggrund
  stroke(255);
  fill (255);
  rect(750, 0, 1920-750, 1080);

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

  //kort 
  imgEtagebillede = loadImage(sal+".png");
  image(imgEtagebillede, 1000, 400);
}







public void Forste_sal() {
  println("1ste knap pressed");

  fill(255);
  rect(1000, 400, 600, 450);
  sal = "1_sal";
  etage = "1. sal";



  Knap1Setting.setColorBackground(#252dfa);
  Knap2Setting.setColorBackground(#060a80);
  Knap3Setting.setColorBackground(#060a80);
}
// Hvad sker der når jeg trykker.


public void Stueetage() {
  println("2nden knap pressed ");

  fill(255);
  rect(1000, 400, 600, 450);
  sal= "Stue";
  etage = "Stue";


  Knap2Setting.setColorBackground(#252dfa);
  Knap1Setting.setColorBackground(#060a80);
  Knap3Setting.setColorBackground(#060a80);
}

public void Kaelder() {
  println("NILS ER PÅ SKÆRMEN");

  fill(255);
  rect(1000, 400, 600, 450);
  sal="Kaelder";
  etage = "Kælder";



  Knap3Setting.setColorBackground(#252dfa);
  Knap1Setting.setColorBackground(#060a80);
  Knap2Setting.setColorBackground(#060a80);
}
