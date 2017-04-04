class Application{

    ArrayList<Button> buttons;
    ArrayList<InputField> inputFields;

    Application(){
        println("hello from Application");
        buttons = new ArrayList<Button>();
        inputFields = new ArrayList<InputField>();
    }

    private void drawAllButtons(){
      for(Button b : buttons){
        b.drawButton();
      }
    }

    public void drawApplication(){
      drawAllButtons();
    }
}
