Counter cntr;
int scr = 0;
import processing.sound.*; //vi fandt koden til lyd inde på proccessing.org
SoundFile file;
void setup() {
  size(1400, 700);
  cntr= new Counter();
  frameRate(60);
  file = new SoundFile(this, "plink.wav");
}


//pokeball
void draw() {
  background(200);
  fill(255, 255, 255);
  arc(710, 425, 220, 220, 0, PI, OPEN);
  fill(255, 0, 0);
  arc(710, 425, 220, 220, PI, PI+PI, OPEN);
  fill(0, 0, 0);
  rect(600, 400, 220, 40);
  circle(710, 420, 60);
  fill(255, 255, 255);
  circle(710, 420, 40);
  cntr.display(); // viser counteren
}
//gør så at vores counter går op når man klikker
void mousePressed() {
  if (mouseX>600 && mouseX <850 && mouseY>300 && mouseY <535) {
    scr++;
    file.play();
  }
}

class Counter {


  Counter() {
  }
  //bestemmer position og farve/udseene af counter
  void display() {
    noStroke();
    textAlign(CENTER);
    textSize(50);
    fill(237, 28, 36);
    text (begin(scr)+" PokeCoins", 700, 100);
    
  }


  String begin(int a) {
    String Buffer;
    Buffer=nf(a, 1); //nf laver int a om til 1
    return(Buffer);
  }
}
