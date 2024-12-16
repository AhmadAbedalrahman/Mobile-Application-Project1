//Name: Ahmad Abedalrahman ID: 52230064
import 'package:flutter/material.dart';

class TemperatureConversionScreen extends StatefulWidget {
  const TemperatureConversionScreen({super.key});

  @override
  State<TemperatureConversionScreen> createState() =>
      _TemperatureConversionScreenState();
}

class _TemperatureConversionScreenState
    extends State<TemperatureConversionScreen> {
  double inputValue = 0;
  double convertedValue = 0;
  String fromUnit = 'Celsius';
  String toUnit = 'Fahrenheit';
  final units = ['Celsius', 'Fahrenheit', 'Kelvin'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Temperature Conversion',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                inputValue = double.tryParse(value) ?? 0;
                convertedValue = 0;
                setState(() {}); // Update UI
              },
              decoration: InputDecoration(
                labelText: 'Enter value in $fromUnit',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "From: ",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                DropdownButton<String>(
                  value: fromUnit,
                  onChanged: (value) {
                    setState(() {
                      fromUnit = value!;
                    });
                  },
                  items: units.map((String unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "To: ",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                DropdownButton<String>(
                  value: toUnit,
                  onChanged: (value) {
                    setState(() {
                      toUnit = value!;
                    });
                  },
                  items: units.map((String unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (fromUnit == 'Celsius' && toUnit == 'Fahrenheit') {
                        convertedValue = (inputValue * 9 / 5) + 32;
                      } else if (fromUnit == 'Fahrenheit' &&
                          toUnit == 'Celsius') {
                        convertedValue = (inputValue - 32) * 5 / 9;
                      } else if (fromUnit == 'Celsius' && toUnit == 'Kelvin') {
                        convertedValue = inputValue + 273.15;
                      } else if (fromUnit == 'Kelvin' && toUnit == 'Celsius') {
                        convertedValue = inputValue - 273.15;
                      } else if (fromUnit == 'Fahrenheit' &&
                          toUnit == 'Kelvin') {
                        convertedValue = (inputValue - 32) * 5 / 9 + 273.15;
                      } else if (fromUnit == 'Kelvin' &&
                          toUnit == 'Fahrenheit') {
                        convertedValue = (inputValue - 273.15) * 9 / 5 + 32;
                      } else if (fromUnit == toUnit) {
                        convertedValue = inputValue;
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor:
                        Colors.white, // Updated to use backgroundColor
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Icon(Icons.calculate)),
            ),
            SizedBox(height: 20),
            Text(
              'Converted Value: $convertedValue $toUnit', // Show the converted value with unit
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}
