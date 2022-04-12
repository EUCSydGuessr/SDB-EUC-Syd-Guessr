import controlP5.*;

ControlP5 cp5;

String etage = "Stuetage";
PImage imgkaelder,imgstue,img1ste;

imgkaelder = loadImage(".jpg");
imgstue = loadImage(".jpg");
img1ste = = loadImage(".jpg");

Button Knap1Setting;
Button Knap2Setting;
Button Knap3Setting;

//Al initiering og navngivning af diverse.

void setup() {
  size(1024, 580);
  background(111);
  
  
  
  cp5 = new ControlP5(this);
  //Initieringsfis tror jeg 

  Knap1Setting = cp5.addButton("Knap1").setPosition(175, 275).setColorBackground(#060a80).setColorActive(#252dfa).updateSize();

  Knap2Setting = cp5.addButton("Knap2").setPosition(175, 300).setColorBackground(#252dfa).setColorActive(#252dfa).updateSize();
  
  Knap3Setting = cp5.addButton("Knap3").setPosition(175, 325).setColorBackground(#060a80).setColorActive(#252dfa).updateSize();
}
// Lav knapperne

void draw() {

  println(etage);
  
}


public void Knap1() {
  println("1ste knap pressed");
  
  etage = "Kælder";
  image(imgkaelder,)
  
  Knap1Setting.setColorBackground(#252dfa);
  Knap2Setting.setColorBackground(#060a80);
  Knap3Setting.setColorBackground(#060a80);
}
// Hvad sker der når jeg trykker.


public void Knap2() {
  println("2nden knap pressed ");
  
  etage = "Stuetage";
  
  
  Knap2Setting.setColorBackground(#252dfa);
  Knap1Setting.setColorBackground(#060a80);
  Knap3Setting.setColorBackground(#060a80);
}

public void Knap3() {
  println("3dje knap pressed ");
  
  etage = "1ste sal";
  
  
  Knap3Setting.setColorBackground(#252dfa);
  Knap1Setting.setColorBackground(#060a80);
  Knap2Setting.setColorBackground(#060a80);
}
