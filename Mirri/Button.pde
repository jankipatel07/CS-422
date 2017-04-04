

// xCord:       starting x position
// yCOrd:       starting y position
// deltax:    how far is x position extending
// deltay:    how far is y position extending
class Button {

  private int xCord, yCord, deltaX, deltaY;
  private String imageValue;
  private boolean isVisible;
  private double multiplier;
  private boolean isSelected;
  private PImage selectedImage, notSelectedImage;

  Button(int x, int y, int dx, int dy, String imageVal, double mul){
    xCord = x;
    yCord = y;
    deltax = dx;
    deltay = dy;
    imageValue = imageVal;
    multipler = mul;
    isSelected = false;
    isVisible = true;
    selectedImage = loadImage("images/" + imageVal + "_selected.png");
    notSelectedImage = loadImage("images/" + imageVal + "_notselected.png");
  }

  // is button visible to the naked eye on the screen
  private boolean isButtonVisible(){
    return isVisible;
  }

  public boolean setButtonVisibile(boolean val){
    isVisible = val;
  }

  // is button selected
  // different than isVisible, visible only displays the image
  // selected selects the image
  private boolean isButtonSelected(){
    return isSelected;
  }

  public boolean setButtonSelected(boolean val){
    isSelected = val;
  }

  public boolean wasButtonClicked(int x, int y){
    isSelected = _wasButtonClicked(x, y);
    return isSelected;
  }

  private boolean _wasButtonClicked(int x, int y){
    int diffX = xCord + deltax;
    int diffY = yCord + deltay;
    if(x > xCord && x < diffX){
      if(y > yCord && y < diffY){
        return true;
      }
    }

    return false;
  }

  public void setButtonSelected(boolean val){
    isSelected = val;
  }

  // gets called if the button is selected
  private void drawButtonSelected(){
    image(selectedImage, xCord, yCord, deltax, deltay);
  }

  // gets called if the button is not selected
  private void drawButtonNotSelected(){
    image(notSelectedImage, xCord, yCord, deltax, deltay);
  }

  public boolean drawButton(){
    if(isButtonVisible() && isButtonSelected()){
      drawButtonSelected();
    } else if(isButtonVisible()){
      drawButtonNotSelected();
    }
  }

}
