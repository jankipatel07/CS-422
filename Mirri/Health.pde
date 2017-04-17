class Health extends Draggable{

  private Button displayWeight;
  private Button displaySleep;
  private Button displaySteps;
  private String currentImage;


  Health(String appName, float x, float y, int dx, int dy){
    super(appName, x, y, dx, dy);
    createWeight();
    createSleep();
    createSteps();

    setDisplayImage(displayWeight);
    setCurrentImage("weight");
    displaySleep.setButtonVisibile(false);
    displaySteps.setButtonVisibile(false);
  }

  private void setCurrentImage(String val){
    currentImage = val;
  }

  private void getCurrentImage(){
    return currentImage;
  }

  private void createWeight(){
    displayWeight = new Button("mockups/weightoverview", getPosX()+40, getPosY(), getSizeX()-40, getSizeX(), true);
  }

  private void createSleep(){
    displaySleep = new Button("mockups/sleepoverview", getPosX()+40, getPosY(), getSizeX()-40, getSizeX(), false);
  }

  private void createSteps(){
    displaySteps = new Button("mockups/stepsoverview", getPosX()+40, getPosY(), getSizeX()-40, getSizeX(), false);
  }

  // @Override
  public void applicationMouseClicked(int x, int y){
    if(getExitButton().wasButtonClicked(x, y)){
      console.log("exit button was clicked from ", getApplicationName());
      // turning off the visibility
      setAppVisible(false);
      return;
    }
    Button temp = displayWeight;

    for(Button b : buttons){
      if(b.wasButtonClicked(x, y) && b.isButtonVisible()){
        for(Button b2 : buttons){
          if(!b2.getImageValue().equals(b.getImageValue())){
            b2.setButtonSelected(false);
          }
        }
        b.setButtonSelected(true);
        if(b.getImageValue().equals("scale")){
          displayWeight.setButtonVisibile(true);
          displaySleep.setButtonVisibile(false);
          displaySteps.setButtonVisibile(false);
          temp = displayWeight;
        } else if(b.getImageValue().equals("sleeping")){
          displayWeight.setButtonVisibile(false);
          displaySleep.setButtonVisibile(true);
          displaySteps.setButtonVisibile(false);
          temp = displaySleep;
        } else if(b.getImageValue().equals("footsteps")){
          displayWeight.setButtonVisibile(false);
          displaySleep.setButtonVisibile(false);
          displaySteps.setButtonVisibile(true);
          temp = displaySteps;
        }
      }
    }

    if(displayWeight.wasButtonClicked(x, y) && displayWeight.isButtonVisible()){
      console.log("displayWeight x: ", displayWeight.getPosX());
      console.log("displayWeight y: ", displayWeight.getPosY());
      console.log("x: ", mouseX);
      console.log("Y: ", mouseY);

      if(dist(displayWeight.getPosX(), displayWeight.getPosY() + 150, mouseX, mouseY) < 100){
        console.log("yes dist is true");
      }
    } else if(displaySleep.wasButtonClicked(x, y) && displaySleep.isButtonVisible()){

    } else if(displaySteps.wasButtonClicked(x, y) && displaySteps.isButtonVisible()){

    }

    setDisplayImage(temp);
  }



}
