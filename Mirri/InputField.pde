class InputField extends Button{

  private String displayText;
  private String appName = "default";

  InputField(String imageVal, float x, float y, int dx, int dy, boolean click){
      super(imageVal, x, y, dx, dy, click);
      displayText = "Hello";
  }

  InputField(String imageVal, String aName, float x, float y, int dx, int dy, boolean click){
      super(imageVal, x, y, dx, dy, click);
      displayText = "00";
      appName = aName;
  }

  public void setDisplayText(String val){
    displayText = val;
  }

  // @Overloading
  public void setDisplayText(String val, String upOrDown){
    if(upOrDown.equals("up")){
      int num = int(displayText);
      num++;
    } else if (upOrDown.equals("down")){
      int num = int(displayText);
      num--;
    }

    if(num <= 0){
      num = 0;
    }
    displayText = num + " : 00";
  }

  public String getDisplayText(){
    return displayText;
  }

  private void drawText(){
    PFont font;
    font = loadFont("FFScala.ttf");
    textFont(font, 70);
    fill(0);
    if(appName.equals("timer")){
      text(getDisplayText(), getPosX() + 100, getPosY() + 80);
    } else if(appName.equals("displayTimer")){
      textFont(font, 40);
      text(getDisplayText(), getPosX() + 200, getPosY() + 80);
    }else {
      text(getDisplayText(), getPosX() + 250, getPosY() + 80);
    }
  }

  // @Override
  public boolean drawButton(){
    if(isButtonVisible()){
      drawButtonSelected();
      drawText();
    }
  }
}
