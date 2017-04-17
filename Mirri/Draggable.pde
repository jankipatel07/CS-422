class Draggable extends Application{

    // exclusive for Draggable class
    private boolean hover, locked;
    private float diffX, diffY;
    private Button exitButton;
    private Button resizeButton;
    private boolean resizeBool;
    private int startSizeX, startSizeY;
    private Button displayImage;

    Draggable(String appName, float x, float y, int dx, int dy){
        super(appName, x, y, dx, dy);

        hover = false;
        appVisible = false;
        locked = false;
        diffX = 0.0;
        diffY = 0.0;
        startSizeX = dx;
        startSizeY = dy;
        displayImage = null;
        if(appName.equals("musicList") || appName.equals("createLanguageOptions") || appName.equals("settings")){
            applicationDraggable = false;
        }else{
            applicationDraggable = true;
        }

         //if(appName.equals("musicList")){
         //   appVisible = false;
       // }
        //else{
        //    appVisible = true;
        //}
        createExitButton();
        createResizeButton();
    }

    public Button getExitButton(){
      return exitButton;
    }

    public void setDisplayImage(Button b){
      displayImage = b;
    }

    public int getStartSizeX(){
      return startSizeX;
    }

    public int getStartSizeY(){
      return startSizeY;
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

    public void setPosX(float x){
      posX = x;
    }

    public void setPosY(float y){
      posY = y;
    }

    public void setSizeX(int x){
      sizeX = x;
    }

    public void setSizeY(int y){
      sizeY = y;
    }

    public boolean getHover(){
      _getHover();
      return hover;
    }

    public boolean getLock(){
      return locked;
    }

    public boolean getResize(){
      _getResize();
      return resizeBool;
    }

    public void setResize(boolean val){
      resizeBool = val;
    }

    // checks if the app is visible before lock gets placed
    public void setLock(boolean val){
      if(isAppVisible()){
        locked = val;
      } else {
        locked = false;
      }
    }

    private void drawExitButton(){
      exitButton.setPosX(getPosX() + getSizeX() - exitButton.getSizeX());
      exitButton.setPosY(getPosY());
      exitButton.drawButton();
    }

    private void drawResizeButton(){
      resizeButton.setPosX(getPosX() + getSizeX() - resizeButton.getSizeX());
      resizeButton.setPosY(getPosY() + getSizeY() - resizeButton.getSizeX());
      resizeButton.drawButton();
    }

    public void drawDisplayImageButton(){
      if(displayImage == null) return;
      if(getApplicationName().equals("newsfeed")){
        drawApplicationButtons(displayImage, getPosX() + 20, getPosY() + 80);
        displayImage.setSizeY(getSizeY() - 120);
      } else {
        drawApplicationButtons(displayImage, getPosX() + 20, getPosY() + 150);
        displayImage.setSizeY(getSizeY() - 190);
      }
      displayImage.setSizeX(getSizeX() - 40);
    }

    public void drawApplicationButtons(Button b, int disX, int disY){
      b.setPosX(disX);
      b.setPosY(disY);
      b.drawButton();
    }

    private void createExitButton(){
      exitButton = new Builder().createNewButtonWithParam("exit", getApplicationName(), getPosX(), getPosY(), getSizeX(), getSizeY());
    }

    private void createResizeButton(){
      resizeButton = new Builder().createNewButtonWithParam("drag", getApplicationName(), getPosX(), getPosY(), getSizeX(), getSizeY());
    }

    // checks to see if the cursor is hover over the app
    private void _getHover(){
      if(isAppVisible()){
        if(mouseX > getPosX() && mouseX < (getPosX() + getSizeX()) && mouseY > getPosY() && mouseY < (getPosY()+getSizeY() /* - resizeButton.getSizeX()*/)){
          hover = true;
        } else {
          hover = false;
        }
      }
    }

    private void _getResize(){
      if(isAppVisible()){
        if(dist(getPosX()+getSizeX(), getPosY()+getSizeY(), mouseX, mouseY) < resizeButton.getSizeX()){
            setResize(true);
          } else {
            setResize(false);
          }
      }
    }

    private void drawAllButtons(){
      int i = 0;
      for(Button b : buttons){
        if(i == 0){
          drawApplicationButtons(b, getPosX() + 40, getPosY() + 40);
        } else if (i == 1){
          drawApplicationButtons(b, getPosX() + (b.getSizeX() * 2), getPosY() + 40);
        } else if(i == 2){
          drawApplicationButtons(b, getPosX() + (b.getSizeX() * 3) + 40, getPosY() + 40);
        }
        i++;
      }
    }

    // gets called from PlayGround.pde when a user clicks anywhere on the app
    // path
    // Mirri -> PlayGround -> Application -> Button
    // @Overwrite
    public void applicationMouseClicked(int x, int y){
      if(exitButton.wasButtonClicked(x, y)){
        console.log("exit button was clicked from ", getApplicationName());
        // turning off the visibility
        setAppVisible(false);
        //return;
      }

      for(Button b : buttons){
        if(b.wasButtonClicked(x, y)){
          b.setButtonSelected(true);
          setClickedApp(b.getImageValue());
        }else {
          b.setButtonSelected(false);
        }
      }
    }

    public void drawApplication(){
      // checking if the app is visible in the first place before drawing
      // no need to go through all the methods if the app is not even visible
      if(isAppVisible()){
        getHover(); // checks to see if mouse is hovering over the app
        getResize();
        drawApplicationBox();
        drawAllButtons();
        drawExitButton();
        drawDisplayImageButton();
        drawResizeButton();
      }
    }

    public boolean isClashingWithOtherApplication(Application a){
      if(!a.isAppVisible()) return false;
      for(int i = 0;i < 4; i++){
        float _x, _y;
        if(i == 0){
          _x = a.getPosX();
          _y = a.getPosY();
        } else if(i == 1){
          _x = a.getPosX();
          _y = a.getPosY() + a.getSizeY();
        } else if (i == 2){
          _x = a.getPosX() + a.getSizeX();
          _y = a.getPosY();
        } else if (i == 3){
          _x = a.getPosX() + a.getSizeX();
          _y = a.getPosY() + a.getSizeY();
        }

        if(_x > this.getPosX() && _y >= this.getPosY() && _x <= this.getPosX() + this.getSizeX() && _y <= this.getPosY() + this.getSizeY()){
          return true;
        }
      }

      return false;
    }

    public boolean isApplicationGoingOutOfBounds(int canvasWidth, int canvasHeight){
      for(int i = 0; i < 4; i++){
        float _x, _y;
        if(i == 0){
          _x = this.getPosX();
          _y = this.getPosY();
        } else if (i == 1){
          _x = this.getPosX();
          _y = this.getPosY() + this.getSizeY();
        } else if (i == 2){
          _x = this.getPosX() + this.getSizeX();
          _y = this.getPosY();
        } else if (i == 3){
          _x = this.getPosX() + this.getSizeX();
          _y = this.getPosY() + this.getSizeY();
        }

        if(_x <= 0 || _y <= 300 || _x >= canvasWidth || _y >= canvasHeight){
          return true;
        }
      }

      return false;
    }
}
