
/*
  How to use?

  from the Playground.pde class,
  just change setInputFieldText() and setDisplayText() methods

  to make the app visible
  keyboardApplication.setAppVisible(true);

  to change the display text, like facebook login or calendar login just do this:
  keyboardApplication.setDisplayText("Facebook Login");
  keyboardApplication.setInputFieldText("");

  we want to pass an empty string, so it doesn't display the last used text

  All together, this is how we can use it

  //keyboardApplication.setDisplayText("Facebook Login");
  //keyboardApplication.setInputFieldText("");
  //keyboardApplication.setAppVisible(true);

  and when we are not using the keyboard
  keyboardApplication.setAppVisible(false);
*/

class Keyboard extends Static{

  private InputField displayTag;
  private InputField inputField;
  private boolean okButton;

  Keyboard(String appName, float x, float y, int dx, int dy){
    super(appName, x, y, dx, dy);
    okButton = false;
  }

  public void setInputFieldText(String val){
    inputField.setDisplayText(val);
  }

  public void setDiplayTagText(String val){
    displayTag.setDisplayText(val);
  }

  public String getDisplayTagText(){
    return displayTag.getDisplayText();
  }

  public String getInputFieldText(){
    return inputField.getDisplayText();
  }

  public void createInputField(InputField i){
    inputField = i;
  }

  public void createDisplayTag(InputField t){
    displayTag = t;
  }

  public void setOkPressed(boolean val){
    okButton = val;
  }

  public boolean okPressed(){
    return okButton;
  }

  // gets called from PlayGround.pde when a user clicks anywhere on the app
  // path
  // Mirri -> PlayGround -> Application -> Button
  // @Override
  public void applicationMouseClicked(int x, int y){
    for(Button b : buttons){
      if(b.wasButtonClicked(x, y)){
        b.setButtonSelected(true);
        buttonClicked = true;
        //setClickedApp(applicationName);
        if(b.getImageValue().equals("clear")){
            setInputFieldText("");
        } else if(b.getImageValue().equals("delete")){
          //setInputFieldText(getInputFieldText() + b.getImageValue());
          delete(getInputFieldText());
        } else {
          if(b.getImageValue().equals("ok")){
            setOkPressed(true);
          }
          else{
            setInputFieldText(getInputFieldText() + b.getImageValue());
          }
        }
      }
      else{
          buttonClicked = false;
          b.setButtonSelected(false);
      }
    }
  }

  private void delete(String s){
    int len = s.length() - 1;
    String ret = "";
    for(int i = 0; i < len; i++){
      ret = ret + s.charAt(i);
    }
    setInputFieldText(ret);
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
