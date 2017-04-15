
import processing.sound.*;

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
  private Button closeList ; 
  //language variables
  private float xCordLang = 716.0, yCordLang = 520.0;
  private int widthLang = 1300, heightLang = 700;


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
    } else if(appName.equals("music")){
        return createMusicPlayer("music");
    } else if(appName.equals("musicList")){
        return createMusicList("musicList");
    } else if(appName.equals("health")){
      return createHealthApp(appName);
    } else if(appName.equals("timer")){
      return createTimer(appName);
    } else if(appName.equals("timerStarted")){
      return createTimerStarted(appName);
    } else if(appName.equals("createLanguageOptions")){
      return createLanguageOptions(appName);
    } else if(appName.equals("availablewifi")){
      return createWifi(appName);
    }
  }

  private Application createMusicPlayer(String appName){
        Static s = new Static(appName, 670.0, 1400.0, 1350, 120);
        String[] buttons = {"reverseforward", "play", "fastforward", "play", "volumedown","volumeup"}; // add button for shuffle

        // button for list of music
        s.addNewButton(new Button("test",s.getPosX()+20, s.getPosY()+20,80,80,true)); // list button
        // update the name for the current song
        int i = 1;
        for(String b : buttons){
             s.addNewButton(new Button(b,s.getPosX()+(i*110)+600, s.getPosY()+20,80,80,true));
             i++;
        }
        return s;
  }

  private Application createMusicList(String appName){
        Draggable s = new Draggable(appName, 670.0, 1000.0, 1350, 400);
        ArrayList<SoundFile> songs;
        return s;
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

  private Application createHealthApp(String appName){
    Draggable d = new Draggable(appName, 282.0, 520.0, 520, 700);
    d.addNewButton(new Button("scale", d.getPosX(), d.getPosX() + 40, d.getPosY() + 40, buttonInsideAppDrawerSize, buttonInsideAppDrawerSize, true));
    d.addNewButton(new Button("sleeping", d.getPosX() + (buttonInsideAppDrawerSize * 2), d.getPosY() + 40, buttonInsideAppDrawerSize, buttonInsideAppDrawerSize, true));
    d.addNewButton(new Button("footsteps", d.getPosX() + (buttonInsideAppDrawerSize * 3) + 40, d.getPosY() + 40, buttonInsideAppDrawerSize, buttonInsideAppDrawerSize, true));
    return d;
  }

  private Application createTimer(String appName){
    Static s = new Static(appName, 282.0, 520.0, 520, 700);
    s.addNewButton(new Button("selecttime", 392.0, 540.0, 300, 100, false));
    s.addNewButton(new Button("uparrow", 492.0, 670.0, 100, 100, true));
    s.addNewButton(new Button("downarrow", 492.0, 970.0, 100, 100, true));
    s.addNewButton(new Button("start", 440.0, 1120.0, 200, 100, true));
    return s;
  }

  private Application createTimerStarted(String appName){
    Static s = new Static(appName, 155.0, 1316.0, 490, 200);
    s.addNewButton(new Button("pause", 155.0, 1416.0, 268, 125, true));
    s.addNewButton(new Button("stop", 425.0, 1416.0, 222, 125, true));
    s.addNewButton(new Button("resume", 143.0, 1416.0, 300, 125, true));
    return s;
  }

  private Application createLanguageOptions(String appName){
    Draggable s = new Draggable(appName, xCordLang, yCordLang, widthLang, heightLang);
    float langX = xCordLang+20;
    float langY = yCordLang+10;
    String[] buttons = {"english", "polish", "spanish", "hindi", "italian", "hebrew", "gujarati", "german", "dutch"};

    s.addNewButton(new Button("language", 1066.0, langY, 600, 200, false));
    int index = -1;
    for(int i=0; i < 3; i++){ //cols
      for(int j=0; j<3; j++){ //rows
        index++;
        s.addNewButton(new Button(buttons[index], langX+(300*j)+(20*j), 770+(150*i+1), 300, 150, true));
      }
    }
    s.addNewButton(new Button("portuguese", 1696.0, 771.0, 300, 150, true));
    return s;
  }

  private Application createWifi(String appName){
    Static s = new Static(appName, 1060.0, 520.0, 700, 700);
    s.addNewButton(new Button("english", 1235.0, 540.0, 350, 175, false));
    String[] btn = {"english", "english", "english", "english"};
    int i=0;
    for(String b : btn){
      s.addNewButton(new Button(btn[i], 1272.5, 715.0+(i*125), 275, 125, true));
      i++;
    }
    return s;
  }

  private Application createKeyboard(String appName){
    Keyboard s = new Keyboard(appName, xcordkey, ycordkey, deltaKey, deltakeyY);
    s.addNewButton(new Button("keyboard", xcordkey, ycordkey, deltaKey, deltakeyY, false));
    String[] buttons = { "a", "b", "c", "d", "e", "f", "g", "h","i", "j", "k", "l", "m", "n", "o", "p", "q", "r",
                        "s", "t", "u", "v", "w", "x", "y", "z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "delete", "clear", "ok"};
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
    //s.addNewButton(new Button(buttons[38], 1387.2, 1249.0, 170, 75, true));

    s.createDisplayTag(new InputField("displayBox", xcordkey, ycordkey - 230, deltaKey, 500, false));
    s.createInputField(new InputField("box", xcordkey, ycordkey - 120, deltaKey, 100, false));

    s.setDiplayTagText("DisplayTagText");
    //s.setInputFieldText("InputField");

    s.setAppVisible(false);
    return s;
  } 
}
