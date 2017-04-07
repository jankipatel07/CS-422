class Builder{

  private int exitButtonSize = 65;

  Builder(){}

  public Button createNewButton(String buttonName, String applicationName){
    return new Button();
  }

  public Button createNewButtonWithParam(String buttonName, String applicationName, float x, float y, int dx, int dy){

    // figuring out where the exitButton will be placed
    if(buttonName.equals("exit")){
      float posX = x + dx - exitButtonSize;
      float posY = y;
      return (new Button(buttonName, applicationName, posX, posY, exitButtonSize, exitButtonSize));
    }
  }
}
