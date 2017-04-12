class Static extends Application{

    Static(String appName, float x, float y, int dx, int dy){
        super(appName, x, y, dx, dy);
    }

    // @Overwrite
    // public void applicationMouseClicked(int x, int y){
    // 	for(Button b : buttons){
    //     if(b.wasButtonClicked(x, y)){
    //       b.setButtonSelected(true);
    //       buttonClicked = true;
    //       setClickedApp(applicationName);
    //     } else{
    //         buttonClicked = false;
    //         b.setButtonSelected(false);
    //     }  
    //   }
    // }
}
