String s="Geuss";

void setup(){
size(1920,1080);
background(253,255,218);
}

void draw(){
  stroke(255);
  fill (255);
  rect(50,50,650,450);
  rect(750,0,1920-750,1080);
  
  
  stroke(7,126,218);
  fill(7,126,218);
  rect(100, 550, 550, 100, 48, 48, 48, 48);
  
  fill(255);
  String str = "Geuss";
  textSize(100);
  textAlign(CENTER,CENTER);
  text(str, 200, 530, 350, 120);
}
