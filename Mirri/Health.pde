class Health extends Draggable{

  private Button displayWeight;
  private Button displaySleep;
  private Button displaySteps;
  private Button currentImage;


  Health(String appName, float x, float y, int dx, int dy){
    super(appName, x, y, dx, dy);
    createWeight();
    createSleep();
    createSteps();

    setDisplayImage(displayWeight);
    setCurrentImage("weight");
    displaySleep.setButtonVisibile(false);
    displaySteps.setButtonVisibile(false);

    currentImage = displayWeight;
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
    displaySleep = new Button("mockups/sleepoverview", getPosX()+40, getPosY(), getSizeX()-40, getSizeX(), true);
  }

  private void createSteps(){
    displaySteps = new Button("mockups/stepsoverview", getPosX()+40, getPosY(), getSizeX()-40, getSizeX(), true);
  }

  // @Override
  public void applicationMouseClicked(int x, int y){
    if(getExitButton().wasButtonClicked(x, y)){
      console.log("exit button was clicked from ", getApplicationName());
      // turning off the visibility
      setAppVisible(false);
      return;
    }
    Button temp = currentImage;

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

      // displaying the first image
      if(displayWeight.isButtonVisible() && dist(displayWeight.getPosX(), displayWeight.getPosY() + 150, mouseX, mouseY) < displayWeight.getSizeY()/2 &&
          displayWeight.getImageValue("weightmonthly") && displayWeight.wasButtonClicked(x, y)){
        displayWeight = new Button("mockups/weightoverview", getPosX()+40, getPosY(), getSizeX()-40, getSizeX(), true);
      }

      // displaying the second image
      if(dist(displayWeight.getPosX(), displayWeight.getPosY() + displayWeight.getSizeY(), mouseX, mouseY) < displayWeight.getSizeY()/2 &&
          displayWeight.getImageValue("weightoverview")){
        displayWeight = new Button("mockups/weightmonthly", getPosX()+40, getPosY(), getSizeX()-40, getSizeX(), true);
      }
      temp = displayWeight;

    } else if(displaySleep.wasButtonClicked(x, y) && displaySleep.isButtonVisible()){

      // displaying the first image
      if(displaySleep.isButtonVisible() && dist(displaySleep.getPosX(), displaySleep.getPosY() + 150, mouseX, mouseY) < displaySleep.getSizeY()/2 &&
          displaySleep.getImageValue("sleepmonthly") && displaySleep.wasButtonClicked(x, y)){
        displaySleep = new Button("mockups/sleepoverview", getPosX()+40, getPosY(), getSizeX()-40, getSizeX(), true);
      }

      // displaying the second image
      if(dist(displaySleep.getPosX(), displaySleep.getPosY() + displaySleep.getSizeY(), mouseX, mouseY) < displaySleep.getSizeY()/2 &&
          displaySleep.getImageValue("sleepoverview")){
        displaySleep = new Button("mockups/sleepmonthly", getPosX()+40, getPosY(), getSizeX()-40, getSizeX(), true);
      }
      temp = displaySleep;

    } else if(displaySteps.wasButtonClicked(x, y) && displaySteps.isButtonVisible()){

      // displaying the first image
      if(displaySteps.isButtonVisible() && dist(displaySteps.getPosX(), displaySteps.getPosY() + 150, mouseX, mouseY) < displaySteps.getSizeY()/2 &&
          displaySteps.getImageValue("stepsmonthly") && displaySteps.wasButtonClicked(x, y)){
        displaySteps = new Button("mockups/stepsoverview", getPosX()+40, getPosY(), getSizeX()-40, getSizeX(), true);
      }

      // displaying the second image
      if(dist(displaySteps.getPosX(), displaySteps.getPosY() + displaySteps.getSizeY(), mouseX, mouseY) < displaySteps.getSizeY()/2 &&
          displaySteps.getImageValue("stepsoverview")){
        displaySteps = new Button("mockups/stepsmonthly", getPosX()+40, getPosY(), getSizeX()-40, getSizeX(), true);
      }
      temp = displaySteps;

    }

    currentImage = temp;
    setDisplayImage(temp);
  }



}
