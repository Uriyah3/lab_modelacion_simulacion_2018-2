//____________Universidad de Santiago de Chile__________________
//_______Departamento de Ingeniería en Informática______________
//_______________Modelación y Simulación________________________
//
// Laboratorio 5: Simulación Gravitacional
// Programa: Sistema mono planetario con estrella en movimiento
// 
// Integrantes: Nicolás Mariangel | Juan Pablo Rojas
// Profesor: Fernando Rannou Fuentes
// Ayudante: Francisco Muñoz

// Global variable definitions
Sun sun;
float GConstant = 6.674 * pow(10, -10);
float DELTA_TIME = 0.00006;
float timeCount = 0;

// Change the value of this variable to show trail (EXPERIMENTAL)
// It may affect processor usage
boolean SHOW_HISTORY = true;

void setup() {
  // Define width and height of canvas
  size(800,800);
  // Initialize star (sun) on a 10^-10 scale (of mass).
  sun = new Sun(20, 0, 2*pow(10,20), 5);
  
  // Define parameters for the planet simualting Earth
  float x = 200;
  float y = 0;
  float vx = 0;
  float vy = -25850;
  float planetMass = 4*pow(10,14);
  float planetRadius = planetMass / (1.5*pow(10,13));
  color planetColor = color(80, 180, 180);
  
  // Create the planet "earth" and add it to the orbit
  Planet earth = new Planet(x, y, vx, vy, planetMass, planetRadius, planetColor);
  sun.addPlanet(earth);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  sun.calculatePlanetsOrbit();
  sun.movePlanets();
  sun.display();
  timeCount++;
}

float modulo(PVector obj1, PVector obj2) {
  float mod = pow(obj1.x - obj2.x, 2);
  mod += pow(obj1.y - obj2.y, 2);
  return sqrt(mod);
}
