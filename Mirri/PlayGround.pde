
// this the playground where all the logic will be laid out

class PlayGround{

    private Button quickHide;
    private int canvasWidth, canvasHeight;
    ArrayList<Application> applications;
    private Application draggedApplication;
    private float testX;
    private float testY;
    private float xCordCal, yCordCal, widthCal, heightCal;
    private float xCordWeather, yCordWeather, widthWeather, heightWeather;
    private string[] months = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
    private string[] dayName = {"Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"};
    private int week;
    private float yCordTime = 100;

    PlayGround(){

      canvasWidth = 2732;
      canvasHeight = 1536;
	  midWidth = canvasWidth/2;
      midHeight = canvasHeight/2;

      //calendar variables
      xCordCal = canvasWidth-540, yCordCal = 170, widthCal = 520, heightCal = 600;
      //weather variables
      xCordWeather = 20, yCordWeather = 20;

      // setting up the canvas itself
      setUpCanvas();

      // creating the quickHide button
      //quickHide = new Button()
      applications = new ArrayList<Application>();

      applications.add(new Static("test application", 700.0, 800.0, 500, 600));
      applications.add(new Draggable("2nd application", 100.0, 150.0, 600, 600));
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

    // gets called from Mirri.pde when the user clicks anywhere on the app
    // the program will perform sequential checks on all the buttons for all the applications, starting with QuickHide
    // if any of the buttons are found clicked, the function returns
    public void playGroundMouseClicked(int x, int y){

      // add code here to check quickHide first
      // if(quickHide.wasButtonClicked()){
      //   // add code to handle quick hide scenarios
      //   return;
      // }

      for(Application a : applications){
        if(a.applicationMouseClicked(x, y)){
          console.log("from playGroundMouseClicked");
          return;
        }
      }
    }

    private void setUpCanvas(){
        size(canvasWidth, canvasHeight); //canvas size
        background(204, 204, 204);
    }

    private void drawAllApplications(){
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
    }

        private void showDate() {
    	float xcord = xCordCal+170;
    	float ycord = yCordWeather+85;
    	
    	//get week day and month name
    	week = new Date().getDay();
    	string monthname = months[(month()-1)];

    	textSize(65);
    	fill(0);
    	text(dayName[week] + ", " + monthname + " " + day(), 2362, ycord);
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
		 
		 if(minute() < 10) {
		 	min = "0" + minute();
		 	console.log("minute: " + min);
		 } else {
		 	min = minute();
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
    	} else if(hr >= 17 && hr < 21) {
    		msg = "Good Evening ";
    	} else if(hr >= 21 && hr < 4) {
    		msg = "Good Night ";
    	} else {
    		msg = "Good Morning ";
    	}
    	return msg;
    }

    public void checkMousePressed(){
      // check if the app is draggable before proceeding
      for(Application a : applications){
        if(a.getApplicationDraggable()){
          if(a.getHover()){
            a.setLock(true);
            draggedApplication = a;
            draggedApplication.setDiffX(mouseX-draggedApplication.getPosX());
            draggedApplication.setDiffY(mouseY-draggedApplication.getPosY());
            return;
          }
        }
      }
    }

    public void checkMouseDragged(){
      // instead of going through the loop, just use the draggedApplication
      if(draggedApplication.getLock()){
        draggedApplication.setPosX(mouseX - draggedApplication.getDiffX());
        draggedApplication.setPosY(mouseY - draggedApplication.getDiffY());
      }
    }
}
