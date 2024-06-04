import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/reservation_provider.dart';

class ReservationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final reservationProvider = Provider.of<ReservationProvider>(context);
    final reservations = reservationProvider.reservations;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reservas Feitas',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromRGBO(5, 10, 48, 1),
      ),
      backgroundColor: Colors.lightBlue[50],
      body: ListView.builder(
        itemCount: reservations.length,
        itemBuilder: (ctx, i) => Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: ListTile(
            title: Text('Reserva ${reservations[i].id}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 18.0,
                )),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Text(
                  'Cliente: ${reservations[i].customerName}',
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  'Check-in: ${DateFormat('dd/MM/yyyy').format(reservations[i].checkIn)}',
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  'Check-out: ${DateFormat('dd/MM/yyyy').format(reservations[i].checkOut)}',
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  'Quarto: ${reservations[i].accommodationPreferences}',
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  'Preço: R\$${reservations[i].price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
