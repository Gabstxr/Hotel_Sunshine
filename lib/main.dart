import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/splash_screen.dart';
import './screens/reservations_screen.dart';
import './providers/reservation_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => ReservationProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hotel Sunshine',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
        routes: {
          '/reservations': (ctx) => ReservationsScreen(),
        },
      ),
    );
  }
}
