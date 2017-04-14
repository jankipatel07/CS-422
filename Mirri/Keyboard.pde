class Keyboard extends Static{

  private InputField displayTag;
  private InputField inputField;

  Keyboard(String appName, float x, float y, int dx, int dy){
    super(appName, x, y, dx, dy);
  }

  public void setInputFieldText(String val){
    inputField.setDisplayText(val);
  }

  public void setDiplayTagText(String val){
    displayTag.setDisplayText(val);
  }

  public void createInputField(InputField i){
    inputField = i;
  }

  public void createDisplayTag(InputField t){
    displayTag = t;
  }

  // @Override
  public void drawApplication(){
    if(isAppVisible()){
      displayTag.drawButton();
      inputField.drawButton();
      drawAllButtons();
   }
  }
}
