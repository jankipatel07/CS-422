class Startup extends Static {
  Startup(String appName, float x, float y, int dx, int dy){
    super(appName, x, y, dx, dy);
    appVisible = false;
  } 

  // @Override
  public void applicationMouseClicked(int x, int y){
    for(Button b : buttons){
      if(b.wasButtonClicked(x, y)){
          b.setButtonSelected(true);
          buttonClicked = true;

          if(b.getImageValue().equals("rightarrow")){
            setClickedApp(b.getImageValue());
            return true;
          }
        }else{
          buttonClicked = false;
          b.setButtonSelected(false);
        }
    }
  }
}