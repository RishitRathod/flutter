import 'package:flutter/material.dart';

void main() {
  runApp(const UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  const UnitConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const UnitConverterHomePage(),
    );
  }
}

class UnitConverterHomePage extends StatefulWidget {
  const UnitConverterHomePage({super.key});

  @override
  State<UnitConverterHomePage> createState() => _UnitConverterHomePageState();
}

class _UnitConverterHomePageState extends State<UnitConverterHomePage> {
  String _selectedConversionType = 'Length'; // Default conversion type
  double _inputValue = 0; // Input value
  String _convertedValue = ''; // Converted result

  // List of available conversion types
  final List<String> _conversionTypes = ['Length', 'Weight', 'Temperature', 'Area'];

  // Function to convert the input based on selected type
  void _convert() {
    setState(() {
      switch (_selectedConversionType) {
        case 'Length':
          _convertedValue = '${(_inputValue * 3.28084).toStringAsFixed(2)} feet'; // Example: meters to feet
          break;
        case 'Weight':
          _convertedValue = '${(_inputValue * 2.20462).toStringAsFixed(2)} lbs'; // Example: kg to pounds
          break;
        case 'Temperature':
          _convertedValue = '${((_inputValue * 9 / 5) + 32).toStringAsFixed(2)} °F'; // Celsius to Fahrenheit
          break;
        case 'Area':
          _convertedValue = '${(_inputValue * 10.7639).toStringAsFixed(2)} sq ft'; // Square meters to square feet
          break;
        default:
          _convertedValue = 'Invalid conversion type';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unit Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter value to convert',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _inputValue = double.tryParse(value) ?? 0;
                });
              },
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: _selectedConversionType,
              items: _conversionTypes.map((String type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (String? newType) {
                setState(() {
                  _selectedConversionType = newType ?? _selectedConversionType;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convert,
              child: const Text('Convert'),
            ),
            const SizedBox(height: 20),
            Text(
              _convertedValue.isEmpty
                  ? 'Converted value will appear here'
                  : 'Converted Value: $_convertedValue',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}