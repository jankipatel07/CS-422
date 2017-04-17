class SocialMedia extends Draggable{

  private Button displayTwitter;
  private Button displayFacebook;
  private Button displayYoutube;

  SocialMedia(String appName, float x, float y, int dx, int dy){
    super(appName, x, y, dx, dy);
    createTwitter();
    createFacebook();
    createYoutube();
    setDisplayImage(displayFacebook);
  }

  private void createTwitter(){
      displayTwitter = new Button("mockups/twitter/twitter1", getPosX()+40, getPosY(), getSizeX()-40, getSizeX(), false);
  }

  private void createFacebook(){
      displayFacebook = new Button("mockups/facebook/facebook1", getPosX()+40, getPosY(), getSizeX()-40, getSizeX(), false);
  }

  private void createYoutube(){
      displayYoutube = new Button("mockups/youtube/youtube1", getPosX()+40, getPosY(), getSizeX()-40, getSizeX(), false);
  }

  // @Override
  public void applicationMouseClicked(int x, int y){
    if(getExitButton().wasButtonClicked(x, y)){
      console.log("exit button was clicked from ", getApplicationName());
      // turning off the visibility
      setAppVisible(false);
      return;
    }

    for(Button b : buttons){
      if(b.wasButtonClicked(x, y)){
        Button temp = displayFacebook;
        b.setButtonSelected(true);
        if(b.getImageValue().equals("twitter")){
          displayFacebook.setButtonVisibile(false);
          displayYoutube.setButtonVisibile(false);
          displayTwitter.setButtonVisibile(true);
          temp = displayTwitter;
        } else if(b.getImageValue().equals("facebook")){
          displayFacebook.setButtonVisibile(true);
          displayYoutube.setButtonVisibile(false);
          displayTwitter.setButtonVisibile(false);
          temp = displayFacebook;
        } else if(b.getImageValue().equals("youtube")){
          displayFacebook.setButtonVisibile(false);
          displayYoutube.setButtonVisibile(true);
          displayTwitter.setButtonVisibile(false);
          temp = displayYoutube;
        }

        setDisplayImage(temp);

      }else {
        b.setButtonSelected(false);
      }
    }
  }
}
