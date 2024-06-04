import 'package:flutter/material.dart';
import 'reservation_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/Sunshine_hotel.png'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => ReservationScreen()),
                );
              },
              child: const Text('Fazer Reserva'),
            ),
          ],
        ),
      ),
    );
  }
}
