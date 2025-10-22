// src = https://dart.dev/language/enums#declaring-enhanced-enums
enum Vehicle implements Comparable<Vehicle> {
  car(tires: 4, passengers: 5, carbonPerKilometer: 400, name: "car"),
  bus(tires: 6, passengers: 50, carbonPerKilometer: 800, name: "bus"),
  bicycle(tires: 2, passengers: 1, carbonPerKilometer: 0, name: "bicycle");

  const Vehicle({
    required this.tires,
    required this.passengers,
    required this.carbonPerKilometer,
    required this.name,
  });

  final int tires;
  final int passengers;
  final int carbonPerKilometer;
  final String name;

  int get carbonFootprint => (carbonPerKilometer / passengers).round();

  bool get isTwoWheeled => this == Vehicle.bicycle;

  @override
  int compareTo(Vehicle other) => carbonFootprint - other.carbonFootprint;

  @override
  String toString() {
    return "$name : carbonPerKm =$carbonFootprint ";
  }
}

void main(List<String> arguments) {
  for (Vehicle v in Vehicle.values) {
    print(v);
  }
}

// output: 
//   car : carbonPerKm =80 
//   bus : carbonPerKm =16 
//   bicycle : carbonPerKm =0 
