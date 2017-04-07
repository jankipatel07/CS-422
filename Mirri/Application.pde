class Application{

    private String applicationName;
    private ArrayList<Button> buttons;
    private Button exitButton;
    private ArrayList<InputField> inputFields;
    private float posX, posY;
    private int sizeX, sizeY;
    private boolean isApplicationDraggable;

    // gets placed in draggable class
    private boolean hover, appVisible, locked;
    private float diffX, diffY;

    Application(String appName, float x, float y, int dx, int dy){

        applicationName = appName;
        posX = x;
        posY = y;
        sizeX = dx;
        sizeY = dy;
        buttons = new ArrayList<Button>();
        inputFields = new ArrayList<InputField>();
        hover = false;
        appVisible = true;
        locked = false;
        diffX = 0.0;
        diffY = 0.0;

        //buttons.add(new Button("exit", 100.0, 400.0, 75, 75));
        createExitButton();
    }

    public float getDiffX(){
      return diffX;
    }

    public float getDiffY(){
      return diffY;
    }

    public void setDiffX(float x){
      diffX = x;
    }

    public void setDiffY(float y){
      diffY = y;
    }

    public String getApplicationName(){
      return applicationName;
    }

    public float getPosX(){
      return posX;
    }

    public float getPosY(){
      return posY;
    }

    public void setPosX(float x){
      posX = x;
    }

    public void setPosY(float y){
      posY = y;
    }

    public int getSizeX(){
      return sizeX;
    }

    public int getSizeY(){
      return sizeY;
    }

    private void createExitButton(){
      exitButton = new Builder().createNewButtonWithParam("exit", getApplicationName(), getPosX(), getPosY(), getSizeX(), getSizeY());
    }

    private void drawAllButtons(){
      for(Button b : buttons){
        b.drawButton();
      }
    }

    private void drawApplicationBox(){
      strokeWeight(12);
      stroke(0);
      fill(255);
      rect(posX, posY, sizeX, sizeY);
    }

    public boolean isAppVisible(){
      return appVisible;
    }

    public void setAppVisible(boolean val){
      appVisible = val;
    }

    public boolean getHover(){
      _getHover();
      return hover;
    }

    public boolean getLock(){
      return locked;
    }

    // checks if the app is visible before lock gets placed
    public void setLock(boolean val){
      if(isAppVisible()){
        locked = val;
      } else {
        locked = false;
      }
    }

    // checks to see if the cursor is hover over the app
    private void _getHover(){
      if(isAppVisible()){
        if(mouseX > getPosX() && mouseX < (getPosX() + getSizeX()) && mouseY > getPosY() && mouseY < (getPosY()+getSizeY())){
          hover = true;
        } else {
          hover = false;
        }
      }
    }

    public void drawApplication(){
      // checks to see if mouse is hovering over the app
      getHover();
      drawApplicationBox();
      drawAllButtons();
      drawExitButton();
    }

    public void drawExitButton(){
      exitButton.setPosX(getPosX() + getSizeX() - exitButton.getSizeX());
      exitButton.setPosY(getPosY());
      exitButton.drawButton();
    }

    // gets called from PlayGround.pde when a user clicks anywhere on the app
    // path
    // Mirri -> PlayGround -> Application -> Button
    public boolean applicationMouseClicked(int x, int y){
      for(Button b : buttons){
        if(b.wasButtonClicked(x, y)){
          console.log("button was clicked on image");
          return true;
        }
      }

      return false;
    }

    public void hideApplication(){
      for(Button b : buttons){
        b.setButtonVisibile(false);
      }

      for(InputField iF : inputFields){
        iF.setInputFieldVisible(false);
      }
    }
}
