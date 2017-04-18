


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
  private int selectedMusic = 1;
  private Audio nowPlay = new Audio();

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
    } else if(appName.equals("createStartupLanguage")){
      return createStartupLanguage(appName);
    } else if(appName.equals("availablewifi")){
      return createWifi(appName);
    } else if(appName.equals("wifiPassword")){
      return createWifiPassword(appName);
    } else if(appName.equals("createUserName")){
      return createUserName(appName);
    } else if(appName.equals("userPassword")){
      return createUserPassword(appName);
    } else if(appName.equals("confirmPassword")){
      return createConfirmPassword(appName);
    } else if(appName.equals("clearmode")){
      return createClearMode(appName);
    } else if(appName.equals("settings")){
      return createSettings(appName);
    }
  }



  private Application createMusicPlayer(String appName){
        MusicPlayer s = new MusicPlayer(appName, 670.0, 1400.0, 1350, 120);
        String[] buttons = {"reverseforward", "play", "fastforward", "shuffle", "volumedown","volumeup"}; // add button for shuffle

        // button for list of music
        s.addNewButton(new Button("music",s.getPosX()+20, s.getPosY()+20,80,80,true));// list button

        // update the name for the current song
        int i = 1;
        for(String b : buttons){
             s.addNewButton(new Button(b,s.getPosX()+(i*110)+600, s.getPosY()+20,80,80,true));
             i++;
        }

        return s;
  }

  private Application createMusicList(String appName){
        Static s = new Static(appName, 670.0, 1000.0, 1350, 400);
        String[] buttons = {"song1", "song2", "song3"};
        int i = 0;
        for(String b : buttons){
            s.addNewButton(new Button(b,s.getPosX()+10, s.getPosY()+10+(i*120),1340,120,true));
            i++;
        }
        return s;
  }


  private Application createAppDrawer(String appName){
    AppDrawer s = new AppDrawer(appName, 20.0, 320.0, 150, 900);
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
    SocialMedia d = new SocialMedia("social_media", 282.0, 520.0, 520, 700);
    d.addNewButton(new Button("facebook", d.getPosX() + 40, d.getPosY() + 40, buttonInsideAppDrawerSize, buttonInsideAppDrawerSize, true));
    d.addNewButton(new Button("twitter", d.getPosX() + (buttonInsideAppDrawerSize * 2), d.getPosY() + 40, buttonInsideAppDrawerSize, buttonInsideAppDrawerSize, true));
    d.addNewButton(new Button("youtube", d.getPosX() + (buttonInsideAppDrawerSize * 3) + 40, d.getPosY() + 40, buttonInsideAppDrawerSize, buttonInsideAppDrawerSize, true));

    return d;
  }

  // public void showFacebookMockup(float posX, float posY, int sizeX, int sizeY, Draggable d){
  //   for (int i=1; i<7; i++){
  //     d.setDisplayImage(new Button("mockups/facebook/facebook"+i, posX+40, posY, sizeX-40, sizeX, false));
  //   }
  // }

  private Application createNewsFeed(String appName){
    NewsFeed d = new NewsFeed(appName, 282.0, 520.0, 520, 700);
    d.setDisplayImage(new Button("newsfeed", d.getPosX() + 40, d.getPosY() + 40, d.getSizeX() - 40, d.getSizeX(), true));

    return d;
  }

  private Application createHealthApp(String appName){
    Health d = new Health(appName, 282.0, 520.0, 520, 700);
    d.addNewButton(new Button("scale", d.getPosX(), d.getPosX() + 40, d.getPosY() + 40, buttonInsideAppDrawerSize, buttonInsideAppDrawerSize, true));
    d.addNewButton(new Button("sleeping", d.getPosX() + (buttonInsideAppDrawerSize * 2), d.getPosY() + 40, buttonInsideAppDrawerSize, buttonInsideAppDrawerSize, true));
    d.addNewButton(new Button("footsteps", d.getPosX() + (buttonInsideAppDrawerSize * 3) + 40, d.getPosY() + 40, buttonInsideAppDrawerSize, buttonInsideAppDrawerSize, true));

    // //scale
    // d.setDisplayImage(new Button("mockups/weightoverview", d.getPosX()+40, d.getPosY(), d.getSizeX()-40, d.getSizeX(), false));
    // d.setDisplayImage(new Button("mockups/weightmonthly", d.getPosX()+40, d.getPosY(), d.getSizeX()-40, d.getSizeX(), false));
    //
    // //sleep
    // d.setDisplayImage(new Button("mockups/sleepoverview", d.getPosX()+40, d.getPosY(), d.getSizeX()-40, d.getSizeX(), false));
    // d.setDisplayImage(new Button("mockups/sleepmonthly", d.getPosX()+40, d.getPosY(), d.getSizeX()-40, d.getSizeX(), false));
    //
    // //footsteps
    // d.setDisplayImage(new Button("mockups/stepsoverview", d.getPosX()+40, d.getPosY(), d.getSizeX()-40, d.getSizeX(), false));
    // d.setDisplayImage(new Button("mockups/stepsmonthly", d.getPosX()+40, d.getPosY(), d.getSizeX()-40, d.getSizeX(), false));

    return d;
  }

  private Application createTimer(String appName){
    Timer s = new Timer(appName, 282.0, 520.0, 520, 700);
    s.addNewButton(new Button("selecttime", 392.0, 540.0, 300, 150, false));
    s.addNewButton(new Button("uparrow", 492.0, 700.0, 100, 100, true));
    s.addNewButton(new InputField("displayBox", appName, 392.0, 820, 300, 100, false));
    s.addNewButton(new Button("downarrow", 492.0, 970.0, 100, 100, true));
    s.addNewButton(new Button("start", 440.0, 1120.0, 200, 100, true));
    return s;
  }

  private Application createTimerStarted(String appName){
    Static s = new Static(appName, 155.0, 1316.0, 490, 200);
    s.addNewButton(new InputField("displayBox", "displayTimer", 20.0, 1300.0, 200, 100, false));
    s.addNewButton(new Button("pause", 20.0, 1416.0, 200, 100, true));
    s.addNewButton(new Button("stop", 230.0, 1416.0, 200, 100, true));
    s.addNewButton(new Button("resume", 20.0, 1416.0, 200, 100, true));
    return s;
  }

  private Application createClearMode(String appName){
    ClearMode s = new ClearMode(appName, 2617.0, 1420.0, 100, 100);
    s.addNewButton(new Button("clearmode", 2617.0, 1420.0, 100, 100, true));
    return s;
  }

  private Application createSettings(String appName){

    Draggable d = new Draggable(appName, 282.0, 520.0, 520, 700);
    String btn = {"language", "newuser", "logout"};
    int index = 1;
    int cnt = 0;
    d.addNewButton(new Button("farenheit", 367.0,560, 160, 125, true));
    d.addNewButton(new Button("celsius", 545.0,560, 160, 125, true));
    for(String s : btn){
      d.addNewButton(new Button(btn[cnt], 367.0, 520.0+(125*index)+40*(index+1), 350, 125, true));
      index++;
      cnt++;
    }
    return d;
  }

  private Application createStartupLanguage(String appName){
  Startup s = new Startup(appName, xCordLang, yCordLang, widthLang, heightLang);
  float langX = xCordLang+20;
  float langY = yCordLang+20;
  String[] buttons = {"english", "polish", "spanish", "hindi", "italian", "hebrew", "gujarati", "german", "dutch"};

  s.addNewButton(new Button("seleclang", 1066.0, langY, 600, 200, false));
  int index = -1;
  for(int i=1; i <= 3; i++){ //cols
    for(int j=0; j<3; j++){ //rows
      index++;
      s.addNewButton(new Button(buttons[index], langX+(300*j)+(20*j), langY+30+(150*(i)+(10*(i+1))), 300, 150, true));
    }
  }
  s.addNewButton(new Button("portuguese", 1696.0, 740.0, 300, 150, true));
  s.addNewButton(new Button("rightarrow", 1896.0, 1080.0, 100, 100, true));
  return s;
  }

  private Application createLanguageOptions(String appName){
    Static s = new Static(appName, xCordLang, yCordLang, widthLang, heightLang);
    float langX = xCordLang+20;
    float langY = yCordLang+20;
    String[] buttons = {"english", "polish", "spanish", "hindi", "italian", "hebrew", "gujarati", "german", "dutch","portuguese","cancel"};

    s.addNewButton(new Button("seleclang", 1066.0, langY, 750, 200, false));
    int index = -1;
    for(int i=1; i <= 3; i++){ //cols
      for(int j=0; j<=3; j++){ //rows
        index++;
        s.addNewButton(new Button(buttons[index], langX+(300*j)+(20*j), langY+30+(150*(i)+(10*(i+1))), 300, 130, true));
      }
    }

    s.addNewButton(new Button("portuguese", 1696.0, 740.0, 300, 150, true));
    s.addNewButton(new Button("rightarrow", 1896.0, 1080.0, 100, 100, true));

    return s;
  }

  private Application createWifi(String appName){
    Startup s = new Startup(appName, 1060.0, 520.0, 700, 700);
    s.addNewButton(new Button("availablewifi", 1160.0, 540.0, 500, 160, false));
    String[] btn = {"wifi1", "wifi2", "wifi3", "skip" };
    int i=0;
    for(String b : btn){
      s.addNewButton(new Button(btn[i], 1260.0, 715.0+(i*125), 300, 100, true));
      i++;
    }
    //s.addNewButton(new Button("leftarrow", 1060.0, 1090.0, 100, 100, true));
    s.addNewButton(new Button("rightarrow", 1660.0, 1090.0, 100, 100, true));
    return s;
  }

  private Application createWifiPassword(String appName){
    Startup s = new Startup(appName, 1060.0, 520.0, 0, 0);
    s.addNewButton(new Button("", 1160.0, 540.0, 0, 0, false));
    //s.addNewButton(new Button("leftarrow", 960.0, 1243.0, 100, 100, true));
    s.addNewButton(new Button("rightarrow", 1636.0, 1243.0, 100, 100, true));
    return s;
  }

  private Application createUserName(String appName){
    Startup s = new Startup(appName, 1060.0, 520.0, 0, 0);
    s.addNewButton(new Button("", 1160.0, 540.0, 0, 0, false));
    //s.addNewButton(new Button("leftarrow", 960.0, 1243.0, 100, 100, true));
    s.addNewButton(new Button("rightarrow", 1636.0, 1243.0, 100, 100, true));
    return s;
  }

  private Application createUserPassword(String appName){
    Startup s = new Startup(appName, 1060.0, 520.0, 0, 0);
    s.addNewButton(new Button("", 1160.0, 540.0, 0, 0, false));
    //s.addNewButton(new Button("leftarrow", 960.0, 1243.0, 100, 100, true));
    s.addNewButton(new Button("rightarrow", 1636.0, 1243.0, 100, 100, true));
    return s;
  }

  private Application createConfirmPassword(String appName){
    Startup s = new Startup(appName, 1060.0, 520.0, 0, 0);
    s.addNewButton(new Button("", 1160.0, 540.0, 0, 0, false));
    //s.addNewButton(new Button("leftarrow", 960.0, 1243.0, 100, 100, true));
    s.addNewButton(new Button("rightarrow", 1636.0, 1243.0, 100, 100, true));
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
    s.addNewButton(new Button(buttons[36], 1076.5, 1249.0, 170, 75, true));
    s.addNewButton(new Button(buttons[37], 1279.0, 1249.0, 170, 75, true));
    s.addNewButton(new Button(buttons[38], 1465.5, 1249.0, 170, 75, true));
    //1060   //576
    s.createDisplayTag(new InputField("displayBox", xcordkey, ycordkey - 230, deltaKey, 500, false));
    s.createInputField(new InputField("box", xcordkey, ycordkey - 120, deltaKey, 100, false));

    s.setDiplayTagText("DisplayTagText");
    //s.setInputFieldText("InputField");

    s.setAppVisible(false);
    return s;
  }
}
