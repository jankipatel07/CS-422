class Static extends Application{

    Static(String appName, float x, float y, int dx, int dy){
        super(appName, x, y, dx, dy);
    }

    public void applicationMouseClicked(int x, int y){
      for(Button b : buttons){
        if(b.isButtonSelected() && b.wasButtonClicked(x, y)){
          b.setButtonSelected(false);
        } else if(b.wasButtonClicked(x, y)){
          b.setButtonSelected(true);
          buttonClicked = true;
          setClickedApp(b.imageValue);

          if(getApplicationName().equals("timer") && b.getImageValue().equals("uparrow")){
            for(Button b : buttons){
              if(b.getImageValue().equals("displayBox")){
                b.setDisplayText("", "up");
              }
            }
          } else if(getApplicationName().equals("timer") && b.getImageValue().equals("downarrow")){
            for(Button b : buttons){
              if(b.getImageValue().equals("displayBox")){
                b.setDisplayText("", "down");
              }
            }
          }
          setClickedApp(getApplicationName());
        }
        else{
            buttonClicked = false;
            //b.setButtonSelected(false);
            setClickedApp("");
        }
      }
    }
}
