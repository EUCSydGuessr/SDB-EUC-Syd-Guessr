

PImage img0, img;  // Declare variable "a" of type PImage
float zoom = 0.5;

void setup() {
  size(640, 360);
  img0 = loadImage("kortOverSkole.jpg");  // Load the image into the program
  img=img0.copy();
  img.resize((int)(zoom*img.width), (int)(zoom*img.height) );
  println("use mouseWheel and press key [z]");
}

void draw() {
  background(200, 200, 0);
  image(img, width/2-img.width/2, height/2-img.height/2);
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount(); //println(e);
  if ( keyPressed && key == 'z' ) { 
    zoom += e*0.05;                  // this factor might be depending on operating system
    if ( zoom < 0.6 ) zoom = 0.6;  // limit
    if (zoom > 5) zoom = 5;
    println(" key z: zoom "+zoom);
    img=img0.copy();
    img.resize((int)(zoom*img.width), (int)(zoom*img.height) );
  }
}
