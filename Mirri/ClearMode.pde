class ClearMode extends Static{

  boolean activated;

  ClearMode(String appName, float x, float y, int dx, int dy){
    super(appName, x, y, dx, dy);

    boolean activated = false;
  }

  public void applicationMouseClicked(int x, int y){
    for(Button b : buttons){
      if(b.wasButtonClicked(x, y) && b.getImageValue().equals("clearmode")){
        console.log("in clear mode clicked");
        if(b.isButtonSelected()){
          b.setButtonSelected(false);
          setClickedApp("clearModeDeactivate");
        } else{
          setClickedApp("clearModeActivated");
          b.setButtonSelected(true);
        }
      }
    }
  }
}
