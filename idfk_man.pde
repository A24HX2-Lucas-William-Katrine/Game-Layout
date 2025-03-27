Counter cntr;
int scr = 0;
PImage bg;
PImage pb;
import processing.sound.*; //vi fandt koden til lyd inde på proccessing.org
SoundFile file;
SoundFile purchase;
void setup() {
  size(1400, 788);
  cntr= new Counter();
  frameRate(60);
  file = new SoundFile(this, "plink.wav");
  purchase = new SoundFile(this, "purchase.wav");
  bg = loadImage("backgroundpokemon.png");
  pb = loadImage("pokeball.png");
}


//pokeball
void draw() {
  background(bg);
  fill(255, 255, 255);
  arc(710, 425, 220, 220, 0, PI, OPEN);
  fill(255, 0, 0);
  arc(710, 425, 220, 220, PI, PI+PI, OPEN);
  fill(0, 0, 0);
  rect(600, 400, 220, 40);
  circle(710, 420, 60);
  fill(255, 255, 255);
  circle(710, 420, 40);
  fill(150);
  rect(1115, 0, 20, 1400);
  fill(184,115,51,200);
  rect(1135,0,300,1400);
  cntr.display(); // viser counteren
  fill(0,0,100);
  text("Upgrades", 1250, 50);
  fill(200);
   rect(1140, 80, 225, 75, 28);
  textSize(30);
  fill(0,0,100);
  text("20", 1340, 125);
  textSize(25);
  fill(0);
  text("PokeBall",1233,125);
  image(pb, 1150,100, height/25, width/40);
}

//gør så at vores counter går op når man klikker på pokeballen og går ned når man køber upgrades
void mousePressed() {
  println(mouseX);
  println(mouseY);
  if (mouseX>600 && mouseX <850 && mouseY>300 && mouseY <535) {
    scr++;
    file.play();
  }

  if ((mouseX>1140 && mouseX <1400) && ( mouseY<155 && mouseY>75)&& scr>=20) {
    scr -=20;
    purchase.play();
  }
}

class Counter {
  //bestemmer position og farve/udseene af counter
  void display() {
    noStroke();
    textAlign(CENTER);
    textSize(50);
    fill(0,0,100);
    text (begin(scr)+" PokeCoins", 700, 100);
  }


  String begin(int a) {
    String Buffer;
    Buffer=nf(a, 1); //nf laver int a om til 1
    return(Buffer);
  }
}
