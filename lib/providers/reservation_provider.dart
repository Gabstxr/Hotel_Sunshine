import 'package:flutter/material.dart';
import '../models/reservation.dart';
import 'dart:math';

class ReservationProvider with ChangeNotifier {
  List<Reservation> _reservations = [];

  List<Reservation> get reservations => [..._reservations];

  void addReservation(String customerName, DateTime checkIn, DateTime checkOut, String accommodationPreferences, double price) {
    final newReservation = Reservation(
      id: Random().nextDouble().toString(),
      customerName: customerName,
      checkIn: checkIn,
      checkOut: checkOut,
      accommodationPreferences: accommodationPreferences,
      price: price,
    );
    _reservations.add(newReservation);
    notifyListeners();
  }
}
