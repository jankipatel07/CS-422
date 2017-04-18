class MusicPlayer extends Static{


    private int selectedMusic ;
    private boolean showList;
    private Audio currSong;
    private Audio prevSong;
    private Audio nextSong;
    private boolean play;
    private String songName;
    private Button currSongDisplay;
    
    
   MusicPlayer(String appName, float x, float y, int dx, int dy){
        super(appName, x, y, dx, dy);
        selectedMusic = 1;
        showList = true;
        play = false;
        currSong = new Audio("images/song1.mp3");
        nextSong = new Audio("images/song2.mp3");
        prevSong = new Audio("images/song4.mp3");
        currSongDisplay = new Button("junior",800, 1420, 570, 80,false);
        this.addNewButton(currSongDisplay);
    }
    
    
    public String getCurrSongName(String name){
    
            String temp;
          if(name.equals("song1")){
                temp = "junior";
          }else if(name.equals("song2")){
                 temp = "hard";
          }else{
                temp = "john";
          }
          return temp;
    }
    public boolean showMusicList(){
            return showList;
    }
    
    public void changeMusicListDisplay(boolean f){
            showList = f;
    }

    public void playMusic() {
           currSong.play();
     }
      public void stopMusic() {
           currSong.pause();
     }
     
    
     public void playNext() {
            
           nextSong = prevSong;
           prevSong = currSong;
           currSong = nextSong;
           currSong.play();
     }
     
      public void playPrev() {
           currSong = prevSong;
           prevSong = nextSong;
           nextSong = currSong;
           currSong = prevSong;
           currSong.play();
     }
     
     
     // @Override
   public void applicationMouseClicked(int x, int y){
    for(Button b : buttons){
        if(b.wasButtonClicked(x, y)){
            b.setButtonSelected(true);
            buttonClicked = true;
            //setClickedApp(applicationName);
            if(b.getImageValue().equals("fastforward")){
                b.setButtonSelected(false);
                stopMusic();
                playNext();
                b.setButtonSelected(true);
            }else if(b.getImageValue().equals("reverseforward")){
                 
                b.setButtonSelected(true);
                stopMusic();
                playMusic();
                b.setButtonSelected(false);
           } else if(b.getImageValue().equals("play")){
                if(play == false){
                     b.setButtonSelected(true);
                     play = true;
                     playMusic();
                }else{
                    stopMusic();
                    play = false;
                    b.setButtonSelected(false);
                }
            }
            else if(b.getImageValue().equals("music")){
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