
PlayGround playGround;

void setup() {
  playGround = new PlayGround();
}

void draw(){
  playGround.drawPlayGround();
}

// after mouse is released
void mouseReleased(){
  playGround.playGroundMouseClicked(mouseX, mouseY);
}
