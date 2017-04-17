class AppDrawer extends Static{
  private int index = 0;
  private String imageClicked = "";

  AppDrawer(String appName, float x, float y, int dx, int dy){
    super(appName, x, y, dx, dy);
  }
  
  // @Override
  public void applicationMouseClicked(int x, int y){
      

    for(Button b : buttons){
      if(b.isButtonSelected() && b.wasButtonClicked(x, y)){
        b.setButtonSelected(true);
      } else if(b.wasButtonClicked(x, y)){
        b.setButtonSelected(true);
        buttonClicked = true;
        setClickedApp(b.imageValue);

        // disables all the other opened apps
        for(Button b2 : buttons){
          if(!b2.getImageValue().equals(b.getImageValue()))
            b2.setButtonSelected(false);
        }

        return true;
      } 
    }
  }
}
