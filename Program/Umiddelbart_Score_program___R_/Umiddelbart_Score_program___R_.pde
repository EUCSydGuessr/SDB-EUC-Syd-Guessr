int musx = 0;
int musy = 0;
int forskelx = 0;
int forskely = 0;

int realx = 577;
int realy = 253;


void setup() {
  size(1280, 720);
}

void draw() {

  rect(0, 0, 1280, 720);
}

void mousePressed() {
  if (mouseButton == LEFT) {
    musx = mouseX;
    musy = mouseY;
    println("Her "+musx+" Også her "+musy);
  }
  if (mouseButton == RIGHT) {
    if (realx > musx) { 
      forskelx = realx - musx;
      println("Forskelx< = "+forskelx);
    } else if (musx > realx) {
      forskelx = musx - realx;
      println("Forskelx> = "+forskelx);
    }

    if (realy > musy) { 
      forskely = realy - musy;
      println("Forskely< = "+forskely);
    } else if (musy > realy) {
      forskely = musy - realy;
      println("Forskely> = "+forskely);
    }
    int under_rods_gutten = int(pow(forskelx, 2)) + int(pow(forskely, 2));
    int rod = int(sqrt(under_rods_gutten));    
    
    int score = 500 - rod;
    if(score < 0)score = 0; 
   
    println("Din score er "+score);
  }
}
