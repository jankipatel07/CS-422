class Draggable extends Application{

    // exclusive for Draggable class
    private boolean hover, locked;
    private float diffX, diffY;

    Draggable(String appName, float x, float y, int dx, int dy){
        super(appName, x, y, dx, dy);
        applicationDraggable = true;
        hover = false;
        appVisible = true;
        locked = false;
        diffX = 0.0;
        diffY = 0.0;
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

    public boolean isClashingWithOtherApplication(Application a){
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

        if(_x <= 0 || _y <= 0 || _x >= canvasWidth || _y >= canvasHeight){
          return true;
        }
      }

      return false;
    }
}
