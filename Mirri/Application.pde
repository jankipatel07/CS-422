class Application{

    private String applicationName;
    private ArrayList<Button> buttons;
    private Button exitButton;
    private ArrayList<InputField> inputFields;
    private float posX, posY;
    private int sizeX, sizeY;
    private boolean applicationDraggable, appVisible;

    Application(String appName, float x, float y, int dx, int dy){

        applicationDraggable = false;
        applicationName = appName;
        posX = x;
        posY = y;
        sizeX = dx;
        sizeY = dy;
        buttons = new ArrayList<Button>();
        inputFields = new ArrayList<InputField>();

        //buttons.add(new Button("exit", 100.0, 400.0, 75, 75));
        createExitButton();
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

    public void drawApplication(){
      drawApplicationBox();
      drawAllButtons();
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
