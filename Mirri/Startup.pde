class Startup extends Static{
  private String[] appsList = {"createStartupLanguage", "availablewifi", "wifipassword", "username", "userpin", "userpin2"}; 
  private int index = 0;

  Startup(String appName, float x, float y, int dx, int dy){
        super(appName, x, y, dx, dy);
        appVisible = true;
        //createExitButton();
  } 

  public void createExitButton(){
    return new Button();
  }

  // @Override
  public void applicationMouseClicked(int x, int y){
    for(Button b : buttons){
      if(b.wasButtonClicked(x, y)){
          b.setButtonSelected(true);
          buttonClicked = true;
          if(b.getImageValue().equals("rightarrow")){
           console.log("app name fromstartup; " + getApplicationName());
           
          }
        }else{
          buttonClicked = false;
          b.setButtonSelected(false);
        }
    }
  }
}