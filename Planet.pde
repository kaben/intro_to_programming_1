public class Planet{
  float[] loc;
  color myColor;
  int mySize;
  float dx, dy;
  String name;
  boolean  following;
  
  public Planet(){
    println("making an planet");
    loc = new float[2];
    following = false;
    assignDefaultValues();
  }
  
  void assignDefaultValues(){
    println("assigning values");
    name = "a planet";
    loc[0] = 100;
    loc[1] = 200;
    myColor = color(255,255,0);
    mySize = 50;
    dx = dy = 10;
  }
  
  void drawPlanet(){
    fill(myColor);
    ellipse(loc[0], loc[1], mySize, mySize);
    if( loc[0] + mySize / 2 >= 600 || loc[0] - mySize / 2 <= 0 ){
      dx *= -1;
    }
    if( loc[1] + mySize / 2 >= 600 || loc[1] - mySize / 2 <= 0 ){
      dy *= -1;
    }
    loc[0] += dx;
    loc[1] += dy;
//    println(name+ " loc: " + loc[0] + ", " + loc[1]);
  }
}

public class Meteor extends Planet {
  
  boolean followMouse;
  
  public Meteor(){
    super();
    println("actually im a meteor");
    
    myColor = color( random(255), random(255), random(255) );
    
    dx = (int) random(3, 17);
    dy = (int) random(3, 17);
    
    followMouse = false;
  }
  
  void drawPlanet(){
    if ( followMouse ) {
      fill(myColor);
      loc[0] = mouseX;
      loc[1] = mouseY;
      ellipse(loc[0], loc[1], mySize, mySize);
    }
    else{
      super.drawPlanet();
    }
    
  }
  
}
