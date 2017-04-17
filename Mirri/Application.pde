class Application{

    private String applicationName;
    private ArrayList<Button> buttons;
    private ArrayList<InputField> inputFields;
    private float posX, posY, startX, startY;
    private int sizeX, sizeY;
    private boolean applicationDraggable, appVisible;
    //private boolean buttonClicked = false;
    private String clickedApp;

    Application(){}

    Application(String appName, float x, float y, int dx, int dy){

        applicationDraggable = false;
        applicationName = appName;
        posX = x;
        posY = y;
        startX = x;
        startY = y;
        sizeX = dx;
        sizeY = dy;
        buttons = new ArrayList<Button>();
        inputFields = new ArrayList<InputField>();
        if(appName.equals("app_drawer") || appName.equals("music") || appName.equals("clearmode") || appName.equals("side_bar_left")){
            appVisible = true;
        }
        else{
            appVisible = false;
        }

        //buttons.add(new Button(appName, x, y, dx, dy));
    }

    public ArrayList<Button> getAllButtons(){
      return buttons;
    }

    public void addNewButton(Button b){
      buttons.add(b);
    }

    public void setStartX(float x){
      startX = x;
    }

    public void setStartY(float y){
      startY = y;
    }

    public float getStartX(){
      return startX;
    }

    public float getStartY(){
      return startY;
    }

    public float getPosX(){
      return posX;
    }

    public float getPosY(){
      return posY;
    }

    public int getSizeX(){
      return sizeX;
    }

    public int getSizeY(){
      return sizeY;
    }

    public boolean getApplicationDraggable(){
      return applicationDraggable;
    }

    public String getApplicationName(){
      return applicationName;
    }

    public String clickedApp(){
      return clickedApp;
    }

    public void setClickedApp(String buttonName){
      clickedApp = buttonName;
    }

    public void setButtonClick(boolean val){
      this.buttonClicked = val;
    }

    private void drawAllButtons(){
      for(Button b : buttons){
        b.drawButton();
      }
    }

    private void drawApplicationBox(){
      strokeWeight(8);
      stroke(135, 135, 135);
      if(getApplicationName().equals("side_bar_left")){
        fill(135, 135, 135);
        rect(posX, posY, sizeX, sizeY);
       }
      else if (getApplicationName().equals("music") || getApplicationName().equals("musicList")){
        strokeWeight(5);
        fill(186, 186, 186);
        rect(posX, posY, sizeX, sizeY , 10);
      }
      else if(getApplicationName().equals("clearmode") || getApplicationName().equals("timerStarted")){
        stroke(204, 204, 204);
        fill(204, 204, 204);
        rect(posX, posY, sizeX, sizeY);
      }
      else {
        fill(168, 168, 168);
        rect(posX, posY, sizeX, sizeY);
      }

    }

    public boolean isAppVisible(){
      return appVisible;
    }

    public void setAppVisible(boolean val){
      appVisible = val;
    }

    public void drawApplication(){
      if(isAppVisible()){
        drawApplicationBox();
        drawAllButtons();
     }

    }

    // gets called from PlayGround.pde when a user clicks anywhere on the app
    // path
    // Mirri -> PlayGround -> Application -> Button
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
        }
        else{
            buttonClicked = false;
            //b.setButtonSelected(false);
        }
      }
    }

    public void hideApplication(){
      for(Button b : buttons){
        b.setButtonVisibile(false);
      }

      for(InputField iF : inputFields){
        iF.setInputFieldVisible(false);
      }
    }

    // public boolean showCalendar(){
    //   if(applicationName.equals("loginCalendar") && buttonClicked){
    //     setAppVisible(false);
    //     return true;
    //   }
    //   return false;
    // }
}
