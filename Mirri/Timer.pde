class Timer extends Static{

  Timer(String appName, float x, float y, int dx, int dy){
      super(appName, x, y, dx, dy);
  }

  public void applicationMouseClicked(int x, int y){
    for(Button b : buttons){
      if(b.wasButtonClicked(x, y)){
        b.setButtonSelected(true);
        buttonClicked = true;

        if(b.getImageValue().equals("uparrow")){
          for(Button b : buttons){
            if(b.getImageValue().equals("displayBox")){
              b.setDisplayText("", "up");
            }
          }
        } else if(b.getImageValue().equals("downarrow")){
            for(Button b : buttons){
              if(b.getImageValue().equals("displayBox")){
                b.setDisplayText("", "down");
              }
            }
        } else if(b.getImageValue().equals("start")){
            setClickedApp("TurnTimerOn");
        }
      }
      else{
          buttonClicked = false;
          //b.setButtonSelected(false);
          setClickedApp("");
      }
    }
  }
}
