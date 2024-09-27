import 'package:flutter/material.dart';

class CalorieCount extends StatefulWidget {
  const CalorieCount({super.key});

  @override
  _CalorieCountState createState() => _CalorieCountState();
}

class _CalorieCountState extends State<CalorieCount> {
  final TextEditingController _proteinController = TextEditingController();
  final TextEditingController _carbController = TextEditingController();
  final TextEditingController _fatController = TextEditingController();

  double _totalCalories = 0;

  void _calculateCalories() {
    // Get input values
    double protein = double.tryParse(_proteinController.text) ?? 0;
    double carbs = double.tryParse(_carbController.text) ?? 0;
    double fats = double.tryParse(_fatController.text) ?? 0;

    // Calculate total calories
    setState(() {
      _totalCalories = (protein * 4) + (carbs * 4) + (fats * 9);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calorie Intake Calculator'),
        centerTitle: true,
        backgroundColor: Colors.green[300], // AppBar color
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green[100]!, Colors.white], // Gradient background
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter your intake for each macronutrient:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildTextField(_proteinController, 'Protein (grams)'),
            const SizedBox(height: 16),
            _buildTextField(_carbController, 'Carbohydrates (grams)'),
            const SizedBox(height: 16),
            _buildTextField(_fatController, 'Fats (grams)'),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _calculateCalories,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  backgroundColor: Colors.lightGreen[300], // Button color
                ),
                child: const Text('Calculate Total Calories', style: TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Total Calories: ${_totalCalories.toStringAsFixed(2)} kcal',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build styled text fields
  Widget _buildTextField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
      ),
    );
  }
}
