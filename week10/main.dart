// ==========================================
// 1. ABSTRACT CLASS / INTERFACE
// ==========================================
// Defines a mandatory contract for maintenance.
abstract class Maintainable {
  void performMaintenance();
}

// ==========================================
// 2. BASE CLASS
// ==========================================
// Serves as the parent class for all vehicles.
abstract class Vehicle implements Maintainable {
  String brand;
  int topSpeed;

  Vehicle(this.brand, this.topSpeed);

  // Method to be overridden in derived classes (Polymorphism)
  void startEngine() {
    print('The $brand vehicle engine is starting...');
  }

  void displayInfo() {
    print('Vehicle Brand: $brand | Top Speed: $topSpeed km/h');
  }
}

// ==========================================
// 3. MIXIN
// ==========================================
// Adds reusable electric charging capability outside standard inheritance.
mixin ElectricCapabilities {
  int batteryLevel = 100;

  void chargeBattery() {
    batteryLevel = 100;
    print('⚡ Battery fully charged to $batteryLevel%!');
  }
}

// ==========================================
// 4. DERIVED CLASS 1 (Gas-Powered Car)
// ==========================================
class GasCar extends Vehicle {
  int numberOfDoors;

  GasCar(String brand, int topSpeed, this.numberOfDoors)
      : super(brand, topSpeed);

  // Polymorphism: Overriding startEngine
  @override
  void startEngine() {
    print('🚗 $brand Gas Car: Vroom! The internal combustion engine roars.');
  }

  // Contract implementation from Maintainable interface
  @override
  void performMaintenance() {
    print('🛠️ Maintenance: Changing oil and replacing spark plugs for $brand.');
  }
}

// ==========================================
// 5. DERIVED CLASS 2 (Electric Car with Mixin)
// ==========================================
class ElectricCar extends Vehicle with ElectricCapabilities {
  ElectricCar(String brand, int topSpeed) : super(brand, topSpeed);

  // Polymorphism: Overriding startEngine
  @override
  void startEngine() {
    print('⚡ $brand Electric Car: Turns on silently with a soft digital chime.');
  }

  // Contract implementation from Maintainable interface
  @override
  void performMaintenance() {
    print('🛠️ Maintenance: Checking high-voltage system and battery health for $brand.');
  }
}

// ==========================================
// 6. MAIN APPLICATION ENTRY POINT
// ==========================================
void main() {
  print('=== PC16 WEEK 10: ENHANCED OOP APP ===\n');

  // Creating instances of the derived classes
  GasCar myGasCar = GasCar('Toyota', 180, 4);
  ElectricCar myEV = ElectricCar('Tesla', 220);

  // Polymorphism in action: Storing derived objects in a Base Class list
  List<Vehicle> fleet = [myGasCar, myEV];

  print('--- FLEET STATUS & POLYMORPHISM DEMO ---');
  for (var vehicle in fleet) {
    vehicle.displayInfo();
    vehicle.startEngine();        // Invokes overridden behavior
    vehicle.performMaintenance(); // Invokes implemented interface method
    print('----------------------------------------');
  }

  // Mixin demonstration
  print('\n--- TESTING MIXIN CAPABILITIES ---');
  myEV.chargeBattery();
}
