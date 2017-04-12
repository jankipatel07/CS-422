class Builder{

  private int exitButtonSize = 65;
  private int buttonInsideAppDrawerSize = 100;
  private float deltaBetweenButtonsAppDrawer = 66.6;
  private int deltaXButtonInsideAppDrawer = 20;
  private int dragButtonSize = 36;
  private int canvasWidth = 2732, canvasHeight = 1536;
  private float  midWidth = 2732/2, midHeight = 1536/2;
  //calendar variables
  private float xCordCal = canvasWidth-540, yCordCal = 170, widthCal = 520, heightCal = 600;
  //weather variables
  private float xCordWeather = 20, yCordWeather = 20;
  private float xcordkey = 1060.0, ycordkey = 673;
  private int deltaKey = 576, deltakeyY = 670;

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
    } else if(appName.equals("calendar")){
      return createCalendar(appName);
    } else if(appName.equals("loginCalendar")){
      return createCalendarLogin(appName);
    } else if(appName.equals("social_media")){
      return createSocialMedia(appName);
    } else if(appName.equals("newsfeed")){
      return createNewsFeed(appName);
    } else if(appName.equals("keyboard")){
      return createKeyboard(appName);
    }
  }

  private Application createAppDrawer(String appName){
    Static s = new Static(appName, 20.0, 320.0, 150, 900);
    String[] buttons = {"social", "newspaper", "health", "alarm", "settings"};
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

  private Application createCalendarLogin(String appName){
    Static s = new Static(appName, xCordCal, 1020.0, widthCal, 200);
    s.addNewButton(new Button("loginCalendar", xCordCal+20, 1040.0, widthCal-40, 180, true));
    return s;
  }

  private Application createCalendar(String appName){
    Static s = new Static(appName, xCordCal, yCordCal, widthCal, heightCal);
    s.addNewButton(new Button("calendar", xCordCal, yCordCal, widthCal, heightCal, false));
    return s;
  }

  //new Draggable("social_media", 282.0, 520.0, 520, 700);
  private Application createSocialMedia(String appName){
    Draggable d = new Draggable("social_media", 282.0, 520.0, 520, 700);
    d.addNewButton(new Button("facebook", d.getPosX() + 40, d.getPosY() + 40, buttonInsideAppDrawerSize, buttonInsideAppDrawerSize, true));
    d.addNewButton(new Button("twitter", d.getPosX() + (buttonInsideAppDrawerSize * 2), d.getPosY() + 40, buttonInsideAppDrawerSize, buttonInsideAppDrawerSize, true));
    d.addNewButton(new Button("youtube", d.getPosX() + (buttonInsideAppDrawerSize * 3) + 40, d.getPosY() + 40, buttonInsideAppDrawerSize, buttonInsideAppDrawerSize, true));

    return d;
  }

  private Application createNewsFeed(String appName){
    Draggable d = new Draggable(appName, 282.0, 520.0, 520, 700);
    d.setDisplayImage(new Button("newsfeed", d.getPosX() + 40, d.getPosY() + 40, d.getSizeX() - 40, d.getSizeX(), true));

    return d;
  }

  private Application createKeyboard(String appName){
    Static s = new Static(appName, xcordkey, ycordkey, deltaKey, deltakeyY);
    s.addNewButton(new Button("keyboard", xcordkey, ycordkey, deltaKey, deltakeyY, false));
    String[] buttons = {"a", "b", "c", "d", "e", "f", "g", "h","i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "DELETE", "CLEAR"};
    int index = -1;
    for(int i=0; i <= 7; i++) { //cols
      for(int j=0; j < 6; j++) { //rows
        if(index < 35){
          index++;
          int temp = ycordkey+18*(i+1)+75*i;
          s.addNewButton(new Button(buttons[index], xcordkey+18*(j+1)+75*j, ycordkey+18*(i+1)+75*i, 75, 75, true));
        }
      }
    }
    s.addNewButton(new Button(buttons[36], 1138.6, 1249.0, 170, 75, true));
    s.addNewButton(new Button(buttons[37], 1387.2, 1249.0, 170, 75, true));
    return s;
  }
}
