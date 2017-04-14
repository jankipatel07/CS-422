class InputField extends Button{

  private String displayText;

  InputField(String imageVal, float x, float y, int dx, int dy, boolean click){
      super(imageVal, x, y, dx, dy, click);
      displayText = "";
  }

  public void setDisplayText(String val){
    displayText = val;
  }

  public String getDisplayText(){
    return displayText;
  }

  private void drawText(){
    PFont font;
    font = loadFont("FFScala.ttf");
    textFont(font, 80);
    fill(0);
    text(getDisplayText(), getPosX() + 90, getPosY() - 650);
  }

  // @Override
  public boolean drawButton(){
    if(isButtonVisible()){
      drawButtonSelected();
      drawText();
    }
  }
}
