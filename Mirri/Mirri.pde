
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
  playGround.setAllLocksFalse();
  playGround.checkDraggedScreenSize();
}

void mousePressed(){
  playGround.checkMousePressed();
}

void mouseDragged(){
  playGround.checkMouseDragged();
}
