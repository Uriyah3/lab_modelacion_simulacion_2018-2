Sun sun;
float GConstant = 6.674 * pow(10, -10);
float DELTA_TIME = 0.00006;

void setup() {
  size(800,800);
  sun = new Sun(0, 0, 2*pow(10,20), 5);
  
  float x = 200;
  //float y = -sqrt(pow(200,2)-pow(x, 2));
  float y = 0;
  float vx = 0;
  float vy = -24000;
  float planetMass = 4*pow(10,14);
  float planetRadius = planetMass / (1.5*pow(10,13));
  color planetColor = color(random(0,255), random(0,255), random(0,255));
  Planet earth = new Planet(x, y, vx, vy, planetMass, planetRadius, planetColor);
  sun.addPlanet(earth);
  
  Planet marte = new Planet(200, 200, -16000, 16000, 6.4*pow(10,13), 6.4*pow(10,13) / (5.5*pow(10,12)), color(230, 90, 90));
  sun.addPlanet(marte);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  sun.calculatePlanetsOrbit();
  sun.movePlanets();
  sun.display();
}

float modulo(PVector obj1, PVector obj2) {
  float mod = pow(obj1.x - obj2.x, 2);
  mod += pow(obj1.y - obj2.y, 2);
  return sqrt(mod);
}
