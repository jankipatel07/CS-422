class Settings extends Draggable{

  Settings(String appName, float x, float y, int dx, int dy){
      super(appName, x, y, dx, dy);
  }

  // @Override
  public void applicationMouseClicked(int x, int y){

    if(exitButton.wasButtonClicked(x, y)){
      console.log("exit button was clicked from ", getApplicationName());
      // turning off the visibility
      setAppVisible(false);
      //return;
    }

    for(Button b : buttons){
      if(b.isButtonSelected() && b.wasButtonClicked(x, y)){
        b.setButtonSelected(true);
      } else if(b.wasButtonClicked(x, y)){
        b.setButtonSelected(true);
        buttonClicked = true;
        setClickedApp(b.imageValue);
        // for(Button b2 : buttons){
        //   if(!b2.getImageValue().equals(b.getImageValue()))
        //     b2.setButtonSelected(false);
        // }
      }
    }
  }

}
