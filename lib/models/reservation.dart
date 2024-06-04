class Reservation {
  final String id;
  final String customerName;
  final DateTime checkIn;
  final DateTime checkOut;
  final String accommodationPreferences;
  final double price;

  Reservation({
    required this.id,
    required this.customerName,
    required this.checkIn,
    required this.checkOut,
    required this.accommodationPreferences,
    required this.price,
  });
}
