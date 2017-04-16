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
    private int timerVal=0;
    private boolean isTimerOn;
    
    PlayGround(){

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
      // load the music Player
      applications.add(new Builder().createNewApplication("music"));
      //load music list
      applications.add(new Builder().createNewApplication("musicList"));
      //health
      applications.add(new Builder().createNewApplication("health"));
      //timer
      applications.add(new Builder().createNewApplication("timer"));
      //timer started
      applications.add(new Builder().createNewApplication("timerStarted"));
      //language options
      //applications.add(new Builder().createNewApplication("createLanguageOptions"));
      //wifi
      applications.add(new Builder().createNewApplication("availablewifi"));
      applications.add(new Builder().createNewApplication("clearmode"));
      //applications.add(new Builder().createNewApplication("settings"));
      //keyboard application
      keyboardApplication = new Builder().createNewApplication("keyboard");
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

      for(Application a : applications){
        a.applicationMouseClicked(x, y);
        console.log("app clickedApp: " + a.clickedApp());
        if(a.clickedApp().equals("loginCalendar")){
          showAppsAfterLogin("loginCalendar");
        }
        if(a.clickedApp().equals("uparrow") || a.clickedApp().equals("downarrow")){
          incrementTimerVal(a.clickedApp());
        }
      }
    }

    private void setUpCanvas(){
        size(canvasWidth, canvasHeight); //canvas size
        background(204, 204, 204);
    }

    private void drawAllApplications(){
      // drawing the keyboard app
      keyboardApplication.drawApplication();

      // drawing all the other application
      for(Application a : applications){
        a.drawApplication();
      }
    }

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
       // getMusicPlayer();
    }

    public void drawPlayGround(){
        drawCanvas();
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

    private String greetingByTime() {
    	int hr = hour();
    	String msg = "";
    	if(hr >= 12 && hr < 17) {
    		msg = "Good Afternoon ";
            nightMode = false;
    	} else if(hr >= 17 && hr < 21) {
    		msg = "Good Evening ";
            nightMode = true;
    	} else if(hr >= 21 && hr < 4) {
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
