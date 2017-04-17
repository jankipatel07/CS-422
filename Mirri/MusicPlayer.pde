class MusicPlayer extends Static{


    private int selectedMusic ;
    private boolean showList;
    private Audio currMusic;
    private boolean play;
    
   MusicPlayer(String appName, float x, float y, int dx, int dy){
        super(appName, x, y, dx, dy);
        selectedMusic = 1;
        showList = true;
        play = false;
        currMusic = new Audio("images/song1.mp3");
    }
    
    public boolean showMusicList(){
            return showList;
    }
    
    public void changeMusicListDisplay(boolean f){
            showList = f;
    }
   
    public void loadSounds(int n){
    
      if(n=1){
            currMusic = new Audio("images/song1.mp3");
            currMusic.load();
        }
        else if(n=2){
            currMusic = new Audio("images/song2.mp3");
            currMusic.load();
        }
        else if(n=3){
            currMusic = new Audio("images/song3.mp3");
            currMusic.load();
        }
        else if(n=4){
            currMusic = new Audio("images/song4.mp3");
            currMusic.load();
        }
        else{
            currMusic = new Audio("images/song1.mp3");
            currMusic.load();
      }
        
    }
    public void playMusic() {
           currMusic.play();
     }
      public void stopMusic() {
           currMusic.pause();
     }
     public void reloadMusic() {
           currMusic.pause();
     }
     
     
     // @Override
   public void applicationMouseClicked(int x, int y){
    for(Button b : buttons){
        if(b.wasButtonClicked(x, y)){
            b.setButtonSelected(true);
            buttonClicked = true;
            //setClickedApp(applicationName);
            if(b.getImageValue().equals("fastforward")){
                if(selectedMusic > 4){
                 selectedMusic = 1;
                }else{
                    selectedMusic++;
                }
                b.drawButtonNotSelected();
                stopMusic();
                loadSounds(selectedMusic);
                playMusic();
            }if(b.getImageValue().equals("play")){
                if(play == false){
                     b.drawButtonSelected();
                     play = true;
                     playMusic();
                }else{
                    b.drawButtonNotSelected();
                    stopMusic();
                    play = false;
                }
            }
            if(b.getImageValue().equals("music")){
                if(showMusicList() == false){
                    changeMusicListDisplay(true);
                }else{
                    changeMusicListDisplay(false);
                }
            }
            
        }else{
          buttonClicked = false;
          b.setButtonSelected(false);
        }
    }
  }
     
    
    
}