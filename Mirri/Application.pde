class Application{

    private ArrayList<Button> buttons;
    private ArrayList<InputField> inputFields;
    private Button quickHide;

    Application(){
        println("hello from Application");
        buttons = new ArrayList<Button>();
        inputFields = new ArrayList<InputField>();

        buttons.add(new Button(100, 400, 100, 100, "test", 2.5));
    }

    private void drawAllButtons(){
      for(Button b : buttons){
        b.drawButton();
      }
    }

    public void drawApplication(){
      drawAllButtons();
    }

    public void applicationMouseClicked(int x, int y){
      for(Button b : buttons){
        if(b.wasButtonClicked(x, y)){
          console.log("button was clicked on image");
        }
      }
    }

    public void hideApplication(){

    }
}
