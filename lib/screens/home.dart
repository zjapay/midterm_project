import 'package:flutter/material.dart';
import 'calorie_count.dart';
import 'bmi_calculator.dart';
import 'progress.dart';
import 'settings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calorie Counter and BMI Calculator"),
        centerTitle: true,
        elevation: 8,
        backgroundColor: Colors.red[300], // AppBar color
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red[100]!, Colors.white], // Gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App Title
                const Text(
                  'Welcome to Your Health Tracker',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    shadows: [
                      Shadow(
                        blurRadius: 5,
                        color: Colors.grey,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Calorie Counter 
                    _buildBoxButton(
                      context,
                      'Calorie Counter',
                      Icons.fastfood_rounded,
                      Colors.lightGreen[300]!,
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CalorieCount()),
                      ),
                      width: 90, // Button width here
                    ),
                    const SizedBox(width: 20), // Fixed space between buttons

                    // BMI Calculator 
                    _buildBoxButton(
                      context,
                      'BMI Calculator',
                      Icons.calculate_rounded,
                      Colors.orange[300]!,
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BMICalculatorScreen()),
                      ),
                      width: 90, // Button width here
                    ),
                    const SizedBox(width: 20), // Fixed space between buttons

                    // Progress 
                    _buildBoxButton(
                      context,
                      'Progress',
                      Icons.show_chart_rounded,
                      Colors.pink[200]!,
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProgressScreen()),
                      ),
                      width: 90, // Button width here
                    ),
                    const SizedBox(width: 20), // Fixed space between buttons

                    // Settings
                    _buildBoxButton(
                      context,
                      'Settings',
                      Icons.settings_rounded,
                      Colors.purple[200]!,
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SettingsScreen()),
                      ),
                      width: 90, // Button width here
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Box button adjustable width
  Widget _buildBoxButton(BuildContext context, String label, IconData icon, Color color, VoidCallback onPressed, {double width = 80}) {
    return Container(
      width: width, // Set the button width 
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: color,
          elevation: 6,
          shadowColor: Colors.grey.withOpacity(0.5),
        ),
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: Colors.white), // Icon on top
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ), // Text at the bottom
          ],
        ),
      ),
    );
  }
}
