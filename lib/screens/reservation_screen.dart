import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/reservation_provider.dart';

class ReservationScreen extends StatefulWidget {
  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTimeRange _dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now().add(Duration(days: 1)),
  );
  String _customerName = '';
  String _accommodationPreferences = '';
  double _price = 0.0;

  final List<Map<String, dynamic>> _rooms = [
    {'description': 'Suíte Simples', 'price': 150.0},
    {'description': 'Suíte Dupla', 'price': 200.0},
    {'description': 'Suíte Luxo', 'price': 350.0},
    {'description': 'Suíte Família', 'price': 300.0},
    {'description': 'Suíte Executiva', 'price': 280.0},
    {'description': 'Suíte Presidencial', 'price': 800.0},
  ];

  void _pickDateRange() async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      initialDateRange: _dateRange,
    );

    if (picked != null && picked != _dateRange) {
      setState(() {
        _dateRange = picked;
      });
    }
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Provider.of<ReservationProvider>(context, listen: false).addReservation(
        _customerName,
        _dateRange.start,
        _dateRange.end,
        _accommodationPreferences,
        _price,
      );
      Navigator.of(context).pushReplacementNamed('/reservations');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fazer Reserva',
        style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Color.fromRGBO(5, 10, 48, 1),
      ),
      backgroundColor: Colors.lightBlue[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: Image.asset('assets/images/Sunshine_hotel_removebg.png'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome Completo'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira seu nome completo';
                  }
                  return null;
                },
                onSaved: (value) {
                  _customerName = value!;
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Data de Entrada e Saída:'),
                  TextButton(
                    onPressed: _pickDateRange,
                    child: Text(
                      '${DateFormat('dd/MM/yyyy').format(_dateRange.start)} - ${DateFormat('dd/MM/yyyy').format(_dateRange.end)}',
                    ),
                  ),
                ],
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Escolha o quarto'),
                items: _rooms.map((room) {
                  return DropdownMenuItem<String>(
                    value: room['description'],
                    child: Text(
                        '${room['description']} - R\$${room['price'].toStringAsFixed(2)}'),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _accommodationPreferences = value!;
                    _price = _rooms.firstWhere(
                        (room) => room['description'] == value)['price'];
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Por favor, selecione um quarto';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveForm,
                child: Text('Reservar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
