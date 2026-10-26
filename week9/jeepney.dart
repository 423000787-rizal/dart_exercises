// jeepney.dart

class Jeepney {
  // Public fields
  String routeName;
  String plateNumber;
  int capacity;

  // Private field (Encapsulation)
  int _passengerCount;

  // Constructor
  Jeepney({
    required this.routeName,
    required this.plateNumber,
    required this.capacity,
    int initialPassengers = 0,
  }) : _passengerCount = initialPassengers;

  // Getter to read private field
  int get passengerCount => _passengerCount;

  // Method to update private field safely with validation
  bool boardPassengers(int count) {
    if (_passengerCount + count <= capacity) {
      _passengerCount += count;
      print('$count passenger(s) boarded $routeName ($plateNumber). Current passengers: $_passengerCount/$capacity');
      return true;
    } else {
      print('Cannot board $count passenger(s) on $routeName ($plateNumber). Exceeds capacity of $capacity!');
      return false;
    }
  }

  // Behavior method
  void displayInfo() {
    print('--- Jeepney Details ---');
    print('Route: $routeName');
    print('Plate Number: $plateNumber');
    print('Max Capacity: $capacity');
    print('Current Passengers: $_passengerCount');
  }
}

void main() {
  // 1. Instantiating two Jeepney objects
  Jeepney jeepney1 = Jeepney(
    routeName: 'Baclaran - Divisoria',
    plateNumber: 'ABC-1234',
    capacity: 20,
    initialPassengers: 5,
  );

  Jeepney jeepney2 = Jeepney(
    routeName: 'Cubao - Kalentong',
    plateNumber: 'XYZ-5678',
    capacity: 16,
    initialPassengers: 10,
  );

  // 2. Storing objects in a List
  List<Jeepney> jeepneyFleet = [jeepney1, jeepney2];

  print('=== INITIAL FLEET STATUS ===');
  for (var jeepney in jeepneyFleet) {
    jeepney.displayInfo();
    print('');
  }

  print('=== TESTING ENCAPSULATION & METHODS ===');
  // Accessing private field via getter
  print('${jeepney1.routeName} starting passengers: ${jeepney1.passengerCount}');

  // Boarding valid number of passengers
  jeepney1.boardPassengers(10); // Success

  // Attempting to exceed capacity
  jeepney1.boardPassengers(10); // Over capacity error

  // Boarding passengers on second jeepney
  jeepney2.boardPassengers(4);

  print('\n=== UPDATED FLEET STATUS ===');
  for (var jeepney in jeepneyFleet) {
    jeepney.displayInfo();
    print('');
  }
}
