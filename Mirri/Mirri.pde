
PlayGround playGround;

void setup() {
  //rectMode(CENTER);
  playGround = new PlayGround();
}

void draw(){
  playGround.drawPlayGround();
}

// after mouse is released
void mouseReleased(){
  playGround.playGroundMouseClicked(mouseX, mouseY);
  playGround.checkDraggedScreenSize();
  playGround.setAllLocksFalse();
}

void mousePressed(){
  playGround.checkMousePressed();
}

void mouseDragged(){
  playGround.checkMouseDragged();
}