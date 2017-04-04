
// this the playground where all the logic will be laid out

class PlayGround{

    private int canvasWidth, canvasHeight;
    ArrayList<Application> applications;

    PlayGround(){

      println("Hello from playGround");
      canvasWidth = 2732;
      canvasHeight = 1536;

      // setting up the canvas itself
      setUpCanvas();

      applications = new ArrayList<Application>();

      applications.add(new Application());
    }

    public ArrayList<Application> getApplication(){
        return applications;
    }

    public void playGroundMouseClicked(int x, int y){
      for(Application a : applications){
        a.applicationMouseClicked(x, y);
      }
    }

    private void setUpCanvas(){
        size(canvasWidth, canvasHeight); //canvas size
        background(204, 204, 204);
    }

    private void drawAllApplications(){
      for(Application a : applications){
        a.drawApplication();
      }
    }

    private void drawCanvas(){
        //background(0);
        background(204, 204, 204);
        noStroke();

        drawAllApplications();
    }

    public void drawPlayGround(){
        drawCanvas();
    }
}
