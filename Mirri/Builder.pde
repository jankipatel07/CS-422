class Builder{

  private int exitButtonSize = 65;
  private int buttonInsideAppDrawerSize = 100;
  private float deltaBetweenButtonsAppDrawer = 66.6;
  private int deltaXButtonInsideAppDrawer = 20;
  private int dragButtonSize = 36;

  Builder(){}

  public Button createNewButton(String buttonName, String applicationName){
    return new Button();
  }

  public Button createNewButtonWithParam(String buttonName, String applicationName, float x, float y, int dx, int dy){

    if(buttonName.equals("exit")){
      float posX = x + dx - exitButtonSize;
      float posY = y;
      return new Button(buttonName, applicationName, posX, posY, exitButtonSize, exitButtonSize, true);
    } else if (buttonName.equals("drag")){
      float posX = x + dx - dragButtonSize;
      float posY = y - dragButtonSize;
      return new Button(buttonName, applicationName, posX, posY, dragButtonSize, dragButtonSize, false);
    }
  }

  public Application createNewApplication(String appName){
    if(appName.equals("app_drawer")){
      return createAppDrawer(appName);
    } else if(appName.equals("side_bar_left")){
      return createLeftSideBar(appName);
    }
  }

  private Application createAppDrawer(String appName){
    Static s = new Static(appName, 20.0, 320.0, 150, 900);
    String[] buttons = {"footsteps", "newspaper", "health", "alarm", "settings"};
    int i = 1;
    for(String b : buttons){
      s.addNewButton(new Button(b, s.getPosX()+deltaXButtonInsideAppDrawer, s.getPosY() + (deltaBetweenButtonsAppDrawer * i) + (buttonInsideAppDrawerSize * (i-1)), buttonInsideAppDrawerSize, buttonInsideAppDrawerSize, true));
      i++;
    }
    return s;
  }

  private Application createLeftSideBar(String appName){
    Static s = new Static(appName, 170.0, 320.0, 50, 900);
    s.addNewButton(new Button("pusharrow", s.getPosX() - 20, s.getPosY() + 380, 100, 150, true));

    return s;
  }
}
