// Declare Mover object.
Mover mover;
Mover mover2;

void setup() {
  size(500,500);
  // Create Mover object.
  mover = new Mover(15,250,1,0,15);
  mover2 = new Mover(485,250,-2,0,20);
}

void draw() {
  background(255);

  //[full] Call functions on Mover object.
  mover.update();
  mover.checkEdges();
  mover.display();
  mover2.update();
  mover2.checkEdges();
  mover2.display();
  mover.checkCollision(mover2);
 
  //[end]
}

class Mover {

  //[full] Our object has two PVectors: location and velocity.
  PVector location;
  PVector velocity;
  float radius;
  //[end]

  Mover(float x, float y, float xSpeed, float ySpeed,float r) {
    location = new PVector(x,y);
    velocity = new PVector(xSpeed,ySpeed);
    radius = r;
  }

void checkCollision(Mover mover2) {

    
    PVector distanceVect = PVector.sub(mover2.location, location);

    
    float distanceVectMag = distanceVect.mag();

    // Minimum distance before they are touching
    float minDistance = 15;

    if (distanceVectMag < minDistance) {
mover2.location.x = mover2.location.x*-1;
location.x = location.x*-1;
    }
}

  void update() {
    // Motion 101: Location changes by velocity.
    location.add(velocity);
  }

  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x,location.y,radius,radius);
    
  }
    

  void checkEdges() {
    if (location.x > width ||location.x < 0) {
      velocity.x =velocity.x *-1 ;
    } 

    if (location.y > 5||location.y<0) {
      velocity.y = velocity.y*-1;
    } 
  }
}
