// this the playground where all the logic will be laid out

class PlayGround{

    private Button quickHide;
    private int canvasWidth, canvasHeight;
    ArrayList<Application> applications;
    private Application draggedApplication = new Draggable();
    private float testX;
    private float testY;
    private float xCord = canvasWidth-540;
    private float xCordWeather, yCordWeather, widthWeather, heightWeather;
    private string[] months = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
    private string[] dayName = {"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"};
    private int week;
    private float yCordTime = 100;
    private PImage wCelsius, wFaren ;
    private Application keyboardApplication;
    private boolean nightMode = false;
    private ArrayList<User> users;
    private String currentMode; // startup, idle, inuse

    // music
    private Application musicWidget;
    private Application musicList;
    private Startup startup;
    private AppDrawer appdrawer;

    // timer
    private boolean timerRunning, timerOn;
    private String displayTime = "";
    private int timerVal=0, timer = 0, minuteCounter = 0, secondCounter = 0, previousTime;

    PlayGround(){

      timerOn = false;
      timerRunning = false;

      canvasWidth = 2732;
      canvasHeight = 1536;
      midWidth = canvasWidth/2;
      midHeight = canvasHeight/2;

      wCelsius = loadImage("images/weather_notselected.png");
      wFaren = loadImage("images/weather_selected.png");

      // setting up the canvas itself
      setUpCanvas();

      // creating the quickHide button
      //quickHide = new Button()
      applications = new ArrayList<Application>();
      // applications.add(new Static("test application", 700.0, 800.0, 500, 600));
      applications.add(new Builder().createNewApplication("social_media"));
      // applications.add(new Static("calendar", xCordCal, yCordCal, widthCal, heightCal));
      applications.add(new Builder().createNewApplication("app_drawer"));
      // side_bar_left
      applications.add(new Builder().createNewApplication("side_bar_left"));
      //news feed
      applications.add(new Builder().createNewApplication("newsfeed"));
      //calendar login
      applications.add(new Builder().createNewApplication("loginCalendar"));
      applications.add(new Builder().createNewApplication("calendar"));
      //health
      applications.add(new Builder().createNewApplication("health"));
      //timer
      applications.add(new Builder().createNewApplication("timer"));
      //timer started
      applications.add(new Builder().createNewApplication("timerStarted"));
      //language options
      //applications.add(new Builder().createNewApplication("createLanguageOptions"));
      //Apps for startup
      //DO NOT CHANGE ORDER
      applications.add(new Builder().createNewApplication("createStartupLanguage"));
      applications.add(new Builder().createNewApplication("availablewifi"));
      applications.add(new Builder().createNewApplication("wifiPassword"));
      applications.add(new Builder().createNewApplication("createUserName"));
      applications.add(new Builder().createNewApplication("userPassword"));
      applications.add(new Builder().createNewApplication("confirmPassword"));

      //clearmode
      applications.add(new Builder().createNewApplication("clearmode"));
      applications.add(new Builder().createNewApplication("settings"));

      //keyboard application
      keyboardApplication = new Builder().createNewApplication("keyboard");
      musicWidget = new Builder().createNewApplication("music");
      musicList = new Builder().createNewApplication("musicList");
    }

    public void showAppsAfterLogin(String appName){
      //keyboard
      keyboardApplication.setAppVisible(true);
      //TODO: Show the bottom apps after go is clicked from the keyboard

      //calendar
      // if(appName.equals("loginCalendar")){
      //   applications.add(new Builder().createNewApplication(appName));
      // }
    }

    public int getCanvasWidth(){
      return canvasWidth;
    }

    public int getCanvasHeight(){
      return canvasHeight;
    }

    public ArrayList<Application> getApplication(){
        return applications;
    }

    public void incrementTimerVal(String btnPressed){
      if(timerVal >= 0 && timerVal < 10){
        if(btnPressed.equals("uparrow")){
          timerVal++;
        }
      }
        if(timerVal > 0 && timerVal <= 10){
          if(btnPressed.equals("downarrow")){
          timerVal--;
        }
      }
      setTimerVal(timerVal);
      console.log("timer selected: " + timerVal);
    }

    public void setTimerVal(int val){
      timerVal = val;
    };

    public int getTimerVal(){
      return timerVal;
    }

    public void stopTimer(){
      timerVal = 0;
      isTimerOn = false;
    }


    public void setTimeOn(boolean b, String t){
      if(b){
        timer = int(t);

        timer--;
        secondCounter = 60;
        displayTime = "" + timer + " mins";
      }
      //timerOn = b;
    }

    public void startTimer(){
      isTimerOn = true;
    // increments every second
      int time = floor(millis()/1000);
      if(previousTime < time){
        displayTime++;
        previousTime++;

        if(isTimerOn){
          if(secondCounter == 0){
              timer--;
              secondCounter = 60;
            }
            secondCounter--;
            displayTime = "" + timer + " mins: " + secondCounter + " seconds";

            if(timer == 0 && secondCounter == 0){
              textToDisplay = "Done";
              playBeep = true;
              setTimeOn(false, ""+0);
            }
        }
      }
    }

    // gets called from Mirri.pde when the user clicks anywhere on the app
    // the program will perform sequential checks on all the buttons for all the applications, starting with QuickHide
    // if any of the buttons are found clicked, the function returns
    public void playGroundMouseClicked(int x, int y){

      // add code here to check quickHide first
      // if(quickHide.wasButtonClicked()){
      //   // add code to handle quick hide scenarios
      //   return;
      // }
      keyboardApplication.applicationMouseClicked(x, y);
      musicWidget.applicationMouseClicked(x, y);
      musicList.applicationMouseClicked(x, y);

      for(Application a : applications){
        if(a.applicationMouseClicked(x, y)){

          console.log("app name; " + a.getApplicationName());

          //appdrawer
          if(a.getApplicationName().equals("app_drawer")){
            if(a.clickedApp().equals("social")){
              makeAppVisible(true, "social_media");
              makeAppVisible(false, "newsfeed");
              makeAppVisible(false, "health");
              makeAppVisible(false, "timer");
              makeAppVisible(false, "settings");
            } if(a.clickedApp().equals("newspaper")){
              makeAppVisible(false, "social_media");
              makeAppVisible(true, "newsfeed");
              makeAppVisible(false, "health");
              makeAppVisible(false, "timer");
              makeAppVisible(false, "settings");
            } if(a.clickedApp().equals("health")){
              makeAppVisible(false, "social_media");
              makeAppVisible(false, "newsfeed");
              makeAppVisible(true, "health");
              makeAppVisible(false, "timer");
              makeAppVisible(false, "settings");
            } if(a.clickedApp().equals("alarm")){
              makeAppVisible(false, "social_media");
              makeAppVisible(false, "newsfeed");
              makeAppVisible(false, "health");
              makeAppVisible(true, "timer");
              makeAppVisible(false, "settings");
            } if(a.clickedApp().equals("settings")){
              makeAppVisible(false, "social_media");
              makeAppVisible(false, "newsfeed");
              makeAppVisible(false, "health");
              makeAppVisible(false, "timer");
              makeAppVisible(true, "settings");
            }
          }

          //calendar
          if(a.clickedApp().equals("loginCalendar") && a.isAppVisible()){
            console.log("in login cal in pg");
            makeAppVisible(false, a.getApplicationName());
            keyboardApplication.setAppVisible(true);
            keyboardApplication.setDiplayTagText("Calendar Login");
            keyboardApplication.setInputFieldText("");
            console.log("------ " + keyboardApplication.okPressed());
            if(keyboardApplication.okPressed()){

              keyboardApplication.setOkPressed(false);
              keyboardApplication.setDiplayTagText("Calendar Password");
              keyboardApplication.setInputFieldText("");
            }
          }

        }
      }
    }

    private void makeAppVisible(boolean val, String name){
      for(Application a : applications){
        if(a.getApplicationName().equals(name)){
          a.setAppVisible(val);
        }
      }
    }

    private void setUpCanvas(){
        size(canvasWidth, canvasHeight); //canvas size
        background(204, 204, 204);
        timer = 0;
        secondCounter = 0;
        displayTime="";
        previousTime = floor(millis()/1000);
    }

    private void drawAllApplications(){

      // timer calculations
      int time = floor(millis/1000);
      if(previousTime < time){

        displayTime++;
        previousTime++;

        if(secondCounter == 0){
          timer--;
          secondCounter = 60;
        }

        secondCounter--;
        displayTime = "" + timer + " mins: " + secondCounter + " seconds";

      }

      if(timer == 0 && secondCounter == 0){
        timerOn = false;
        timerRunning = false;
        setTimeOn(false, ""+0);
        makeAppVisible(false, "timerStarted");
      }



      // drawing the keyboard app
      keyboardApplication.drawApplication();

      if(nightMode == false){
          musicWidget.drawApplication();
          musicList.drawApplication();

          if(musicWidget.showMusicList() == true){
              musicList.setAppVisible(true) ;
          }else{
            musicList.setAppVisible(false) ;
          }
       }

      // drawing all the other application
      for(Application a : applications){
        a.drawApplication();

        // displaying timer
        if(a.clickedApp().equals("TurnTimerOn")){
          timerOn = true;
          a.setClickedApp("");
        }

        if(timerOn){
          if(a.getApplicationName().equals("timer")){
              ArrayList<Button> allButton = a.getAllButtons();
              for(Button b : allButton){
                if(b.getImageValue().equals("displayBox")){
                  console.log("b.getDisplayText(): ", b.getDisplayText());
                  setTimeOn(true, b.getDisplayText());
                  timerRunning = true;
                  timerOn = false;
                }
              }
          }
        }

        if(timerRunning){
          if(a.getApplicationName().equals("timerStarted")){
            makeAppVisible(true, "timerStarted");
            a.setTimerText(displayTime);
          }
        }

        // start up logic
        if(a.getApplicationName().equals("createStartupLanguage") && a.isAppVisible()){
          if(a.clickedApp().equals("rightarrow")){
            makeAppVisible(false, "createStartupLanguage");
            makeAppVisible(true, "availablewifi");
            makeAppVisible(false, "wifiPassword");
            makeAppVisible(false, "createUserName");
            makeAppVisible(false, "userPassword");
            makeAppVisible(false, "confirmPassword");
          }
        }
        else if(a.getApplicationName().equals("availablewifi") && a.isAppVisible()){
          if(a.clickedApp().equals("rightarrow")){
            makeAppVisible(false, "createStartupLanguage");
            makeAppVisible(false, "availablewifi");
            makeAppVisible(true, "wifiPassword");
            makeAppVisible(false, "createUserName");
            makeAppVisible(false, "userPassword");
            makeAppVisible(false, "confirmPassword");
          }
        }
       else if(a.getApplicationName().equals("wifiPassword") && a.isAppVisible()){
          if(a.clickedApp().equals("wifiPasswordRightArrow")){
            console.log("wifi Password");
            makeAppVisible(false, "createStartupLanguage");
            makeAppVisible(false, "availablewifi");
            makeAppVisible(false, "wifiPassword");
            makeAppVisible(true, "createUserName");
            makeAppVisible(false, "userPassword");
            makeAppVisible(false, "confirmPassword");
          }
        }
        else if(a.getApplicationName().equals("createUserName") && a.isAppVisible()){
          if(a.clickedApp().equals("createUserNameRightArrow")){
            console.log("createUserName");
            makeAppVisible(false, "createStartupLanguage");
            makeAppVisible(false, "availablewifi");
            makeAppVisible(false, "wifiPassword");
            makeAppVisible(false, "createUserName");
            makeAppVisible(true, "userPassword");
            makeAppVisible(false, "confirmPassword");
          }
        }
        else if(a.getApplicationName().equals("userPassword") && a.isAppVisible()){
          if(a.clickedApp().equals("rightarrow")){
            makeAppVisible(false, "createStartupLanguage");
            makeAppVisible(false, "availablewifi");
            makeAppVisible(false, "wifiPassword");
            makeAppVisible(false, "createUserName");
            makeAppVisible(false, "userPassword");
            makeAppVisible(true, "confirmPassword");
          }
        } else if(a.getApplicationName().equals("confirmPassword") && a.isAppVisible()){
          if(a.clickedApp().equals("confirmPasswordRightArrow")){
            makeAppVisible(false, "createStartupLanguage");
            makeAppVisible(false, "availablewifi");
            makeAppVisible(false, "wifiPassword");
            makeAppVisible(false, "createUserName");
            makeAppVisible(false, "userPassword");
            makeAppVisible(false, "confirmPassword");
          }
        }

        //calendar login
        if(a.clickedApp().equals("loginCalendar") && a.isAppVisible()){
            keyboardApplication.setAppVisible(true);
            keyboardApplication.setDiplayTagText("Calendar Login");
            keyboardApplication.setInputFieldText("");
        } else if(keyboardApplication.clickedApp().equals("ok") && a.getApplicationName().equals("loginCalendar")){
          keyboardApplication.setDiplayTagText("Calendar Password");
        }
        if(keyboardApplication.getOkButtonCounter() == 2 && a.getApplicationName().equals("loginCalendar")){
          keyboardApplication.setAppVisible(false);
          keyboardApplication.setClickedApp("");
          makeAppVisible(false, "loginCalendar");
          a.setClickedApp("");
          keyboardApplication.setOkButtonCounter(0);
          //show calendar widget
          makeAppVisible(true, "calendar");
          console.log("")
        }

      }//end for loop
    }//end method

    private void drawCanvas(){
        //background(0);
        //background(204, 204, 204);
        noStroke();
        fill(204, 204, 204);
        rect(0, 0, getCanvasWidth(), getCanvasHeight());

        drawAllApplications();

        //show date and time
        showDate();
        showTime();
        greetingUserMsg();
        getWeather(1); // default gets Farenheit

    }

    public void drawPlayGround(){
        drawCanvas();
        startTimer();
    }

    public void setAllLocksFalse(){

      for(Application a : applications){
        if(a.getApplicationName().equals(draggedApplication.getApplicationName())) {continue;}

        // check if dragged application is clashing with any other application
        // also
        // check if dragged applicatin is not going out of the window
        if(draggedApplication.isClashingWithOtherApplication(a) ||
            draggedApplication.isApplicationGoingOutOfBounds(getCanvasWidth(), getCanvasHeight())){
          draggedApplication.setPosX(draggedApplication.getStartX());
          draggedApplication.setPosY(draggedApplication.getStartY());
        }
      }

      draggedApplication.setStartX(draggedApplication.getPosX());
      draggedApplication.setStartY(draggedApplication.getPosY());
      draggedApplication.setLock(false);
      draggedApplication.setResize(false);
    }

    private void showDate() {
      float xcord = xCord+170;

      //get week day and month name
      week = new Date().getDay();
      string monthname = months[(month()-1)];

      textSize(65);
      fill(0);
      text(dayName[week] + ", " + monthname + " " + day(), 2362, 105);
      textAlign(CENTER);
    }

    private void showTime() {
      textSize(100);
      fill(0);
      text(getTime(), midWidth, yCordTime);
      textAlign(CENTER);
    }

    private String getTime() {
      String time;
      int hr = hour();
      String min;
      String am_pm = "AM";

     if(hr > 11) {  //noon
       hr -= 12;
       am_pm = "PM";
     }

     if(minute() < 10){
      min = "0" + minute();
     } else {
      min = minute();
     }
     if(hr == 0){
      hr = 12;
     }

     time = hr + ":" + min + " " + am_pm;
     return time;
    }

    private void greetingUserMsg() {
      textSize(65);
      fill(0);
      text(greetingByTime() + "Siri", midWidth, yCordTime+115);
      textAlign(CENTER);
    }

    //@Override
    public void applicationMouseClicked(int x, int y){
    for(Button b : buttons){
        if(b.wasButtonClicked(x, y)){
            b.setButtonSelected(true);
            buttonClicked = true;
            //setClickedApp(applicationName);
            if(b.getImageValue().equals("song1") || b.getImageValue().equals("song2")|| b.getImageValue().equals("song3")){
                musicWidget.playMusic();
            }
        }else{
          buttonClicked = false;
          b.setButtonSelected(false);
        }
    }
  }

    private String greetingByTime() {
      int hr = hour();
      String msg = "";
      if(hr >= 12 && hr < 17) {
        msg = "Good Afternoon ";
            nightMode = false;
      } else if(hr >= 17 && hr < 21) {
        msg = "Good Evening ";
            nightMode = true;
    	} else if(hr >= 21 || hr < 4) {
    		msg = "Good Night ";
            nightMode = true;
      } else {
        msg = "Good Morning ";
            nightMode = false;
      }
      return msg;
    }

    // getWeather : int m (Temparature Measure) - 1 = Farenheit Image
    //                                            0 = Celsius Image
    private void getWeather(int m){
       if(m == 1){
          image(wFaren,xCordWeather,yCordWeather,widthWeather, heightWeather);
       }
       else if (m == 0){
          image(wCelsius,xCordWeather,yCordWeather,widthWeather, heightWeather);
       }

    }

    // performs a check on the screen that was just dragged
    // the method makes sure that the application was not flipped or given a smaller dimension than the start state
    // apps can only be large, not smaller
    public void checkDraggedScreenSize(){

      if(draggedApplication.getSizeX() < draggedApplication.getStartSizeX() || draggedApplication.getSizeY() < draggedApplication.getStartSizeY()){
        draggedApplication.setSizeX(draggedApplication.getStartSizeX());
        draggedApplication.setSizeY(draggedApplication.getStartSizeY());
      }

      // adusting the height and width based on the ratio of the length
      int ratio = draggedApplication.getSizeX() / draggedApplication.getStartSizeX();
      draggedApplication.setSizeY(ratio*draggedApplication.getStartSizeY());

      // checking to see if the app is being resized to go out of bounds
      if(draggedApplication.getSizeX() + draggedApplication.getPosX() > getCanvasWidth()
        || draggedApplication.getSizeY() + draggedApplication.getPosY() > getCanvasHeight()){
        draggedApplication.setSizeX(draggedApplication.getStartSizeX());
        draggedApplication.setSizeY(draggedApplication.getStartSizeY());
      }
    }

    public void checkMousePressed(){
      // check if the app is draggable before proceeding

      for(Application a : applications){
        if(a.getApplicationDraggable() && a.isAppVisible()){
          if(a.getHover()){
            a.setLock(true);
            draggedApplication = a;
            draggedApplication.setDiffX(mouseX-draggedApplication.getPosX());
            draggedApplication.setDiffY(mouseY-draggedApplication.getPosY());
            //return;
          }
        }
      }
    }

    public void checkMouseDragged(){
      // instead of going through the loop, just use the draggedApplication
      if(draggedApplication.getResize()){
        draggedApplication.setSizeX(mouseX - draggedApplication.getPosX());
        draggedApplication.setSizeY(mouseY - draggedApplication.getPosY());
      } else if(draggedApplication.getLock()){
        draggedApplication.setPosX(mouseX - draggedApplication.getDiffX());
        draggedApplication.setPosY(mouseY - draggedApplication.getDiffY());
      }
    }


}
