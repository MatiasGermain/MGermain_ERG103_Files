Mover m;

void setup() {
  size(1000,1000);
  
  m = new Mover(500,1000,0,50,random(1,3));
}



void draw() {
  background(255);
   m.update();
 m.display();

}

class Mover {

  //[full] Our object has two PVectors: location and velocity.
  PVector location;
  PVector velocity;
  PVector acc;
  float radius;
  float yr;
  float p=.004;
  //[end]

  Mover(float x, float y, float xSpeed, float r,float yyr) {
    location = new PVector(x,y);
     yr = yyr;
    velocity = new PVector(xSpeed,yr);
    radius = r;
     acc = new PVector(0,p);
  
  }

void update() {
    // Motion 101: Location changes by velocity.
    
    velocity.sub(acc);
    print(velocity);
    location.sub(velocity);
    
    
}


 void display() {
    stroke(0);
    fill(175);
    ellipse(location.x,location.y,radius,radius);
    }
}



   
