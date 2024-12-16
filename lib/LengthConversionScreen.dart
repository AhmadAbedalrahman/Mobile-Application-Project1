//Name: Ahmad Abedalrahman ID: 52230064
import 'package:flutter/material.dart';

class LengthConversionScreen extends StatefulWidget {
  const LengthConversionScreen({super.key});

  @override
  State<LengthConversionScreen> createState() => _LengthConversionScreenState();
}

class _LengthConversionScreenState extends State<LengthConversionScreen> {
  double inputValue = 0;
  double convertedValue = 0;
  String fromUnit = 'Meters';
  String toUnit = 'Kilometers';
  final units = ['Meters', 'Kilometers', 'Miles', 'Feet', 'Inches'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Length Conversion',
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
                convertedValue = 0; // Reset converted value on input change
                setState(() {}); // Update UI
              },
              decoration: InputDecoration(
                labelText: 'Enter value in $fromUnit',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
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
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.red),
                ),
                DropdownButton<String>(
                  value: fromUnit,
                  onChanged: (value) {
                    setState(() {
                      fromUnit = value!;
                      convertedValue = 0; // Reset converted value
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
                        convertedValue = 0; // Reset converted value
                      });
                    },
                    items: units.map((String unit) {
                      return DropdownMenuItem<String>(
                        value: unit,
                        child: Text(unit),
                      );
                    }).toList()),
              ],
            ),
            SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (inputValue < 0) {
                        // Optional: Handle negative values if necessary
                        return;
                      }

                      // Conversion logic
                      if (fromUnit == 'Meters') {
                        if (toUnit == 'Kilometers') {
                          convertedValue = inputValue / 1000;
                        } else if (toUnit == 'Miles') {
                          convertedValue = inputValue * 0.000621371;
                        } else if (toUnit == 'Feet') {
                          convertedValue = inputValue * 3.28084;
                        } else if (toUnit == 'Inches') {
                          convertedValue = inputValue * 39.3701;
                        } else {
                          convertedValue = inputValue; // Same unit
                        }
                      } else if (fromUnit == 'Kilometers') {
                        if (toUnit == 'Meters') {
                          convertedValue = inputValue * 1000;
                        } else if (toUnit == 'Miles') {
                          convertedValue = inputValue * 0.621371;
                        } else if (toUnit == 'Feet') {
                          convertedValue = inputValue * 3280.84;
                        } else if (toUnit == 'Inches') {
                          convertedValue = inputValue * 39370.1;
                        } else {
                          convertedValue = inputValue; // Same unit
                        }
                      } else if (fromUnit == 'Miles') {
                        if (toUnit == 'Meters') {
                          convertedValue = inputValue / 0.000621371;
                        } else if (toUnit == 'Kilometers') {
                          convertedValue = inputValue / 0.621371;
                        } else if (toUnit == 'Feet') {
                          convertedValue = inputValue * 5280;
                        } else if (toUnit == 'Inches') {
                          convertedValue = inputValue * 63360;
                        } else {
                          convertedValue = inputValue; // Same unit
                        }
                      } else if (fromUnit == 'Feet') {
                        if (toUnit == 'Meters') {
                          convertedValue = inputValue / 3.28084;
                        } else if (toUnit == 'Kilometers') {
                          convertedValue = inputValue / 3280.84;
                        } else if (toUnit == 'Miles') {
                          convertedValue = inputValue / 5280;
                        } else if (toUnit == 'Inches') {
                          convertedValue = inputValue * 12;
                        } else {
                          convertedValue = inputValue; // Same unit
                        }
                      } else if (fromUnit == 'Inches') {
                        if (toUnit == 'Meters') {
                          convertedValue = inputValue / 39.3701;
                        } else if (toUnit == 'Kilometers') {
                          convertedValue = inputValue / 39370.1;
                        } else if (toUnit == 'Miles') {
                          convertedValue = inputValue / 63360;
                        } else if (toUnit == 'Feet') {
                          convertedValue = inputValue / 12;
                        } else {
                          convertedValue = inputValue; // Same unit
                        }
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Icon(Icons.calculate)),
            ),
            SizedBox(height: 20),
            Text(
              'Converted Value: $convertedValue $toUnit',
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
