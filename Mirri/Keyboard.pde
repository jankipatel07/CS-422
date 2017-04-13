class Keyboard extends Static{

  private DisplayTag displayTag;
  private InputField inputField;

  Keyboard(String appName, float x, float y, int dx, int dy){
    super(appName, x, y, dx, dy);
  }

  public void createInputField(InputField i){
    inputField = i;
  }

  public void createDisplayTag(DisplayTag t){
    displayTag = t;
  }
}
