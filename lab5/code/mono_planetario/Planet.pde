class Planet {
  PVector pos;
  PVector acceleration;
  PVector speed;
  PVector force;
  float mass;
  float radius;
  color c;
  
  Planet(float x, float y, float vx, float vy, float m, float r, color c) {
    this.pos = new PVector(x, y);
    this.speed = new PVector(vx, vy);
    this.acceleration = new PVector(0, 0);
    this.force = new PVector(0,0);
    this.mass = m;
    this.radius = r;
    this.c = c;
  }
  
  void addGravitationForce(PVector objectPos, float objectMass) {
    float dist = modulo(this.pos, objectPos);
    float celestialObjectForce = -GConstant * this.mass * objectMass;
    celestialObjectForce /= pow(dist, 2);
    float Fx = celestialObjectForce * ((this.pos.x - objectPos.x) / dist);
    float Fy = celestialObjectForce * ((this.pos.y - objectPos.y) / dist);
    this.force.add(new PVector(Fx, Fy));
  }
  
  void calculateNewPos() {
    this.force.div(this.mass);
    this.acceleration.set(this.force);
    this.acceleration.mult(DELTA_TIME);
    this.speed.add(this.acceleration); 
    PVector newSpeed = new PVector(this.speed.x, this.speed.y);
    newSpeed.mult(DELTA_TIME);
    this.pos.add(newSpeed);
    
    println(this.speed);
  }
  
  void display() {
    pushMatrix();
    
    fill(c);
    ellipse(pos.x, pos.y, radius*2, radius*2);
    force.set(0, 0);
    
    popMatrix();
  }

}
