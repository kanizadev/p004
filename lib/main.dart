import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

void main() {
  runApp(const BMICalculatorApp());
}

// Glassy Card Widget with Glassmorphism Effect
class GlassCard extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final Color? color;
  final double blur;
  final Border? border;

  const GlassCard({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius,
    this.color,
    this.blur = 10.0,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color?.withValues(alpha: 0.2) ??
                      Colors.white.withValues(alpha: 0.2),
                  color?.withValues(alpha: 0.1) ??
                      Colors.white.withValues(alpha: 0.1),
                ],
              ),
              borderRadius: borderRadius ?? BorderRadius.circular(20),
              border:
                  border ??
                  Border.all(
                    color: Colors.white.withValues(alpha: 0.3),
                    width: 1.5,
                  ),
            ),
            padding: padding ?? const EdgeInsets.all(20),
            child: child,
          ),
        ),
      ),
    );
  }
}

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF9CAF88), // Sage green
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        cardTheme: CardThemeData(
          elevation: 8,
          shadowColor: Colors.black.withValues(alpha: 0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 6,
            shadowColor: Colors.black.withValues(alpha: 0.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF9CAF88), width: 2),
          ),
          filled: true,
          fillColor: Colors.grey.shade50,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
        textTheme: GoogleFonts.comicNeueTextTheme().copyWith(
          displayLarge: GoogleFonts.comicNeue(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: GoogleFonts.comicNeue(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
          displaySmall: GoogleFonts.comicNeue(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
          headlineLarge: GoogleFonts.comicNeue(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: GoogleFonts.comicNeue(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: GoogleFonts.comicNeue(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.comicNeue(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          titleMedium: GoogleFonts.comicNeue(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          titleSmall: GoogleFonts.comicNeue(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          bodyLarge: GoogleFonts.comicNeue(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          bodyMedium: GoogleFonts.comicNeue(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          bodySmall: GoogleFonts.comicNeue(
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
          labelLarge: GoogleFonts.comicNeue(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          labelMedium: GoogleFonts.comicNeue(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          labelSmall: GoogleFonts.comicNeue(
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: const BMICalculatorScreen(),
    );
  }
}

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({super.key});

  @override
  State<BMICalculatorScreen> createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  double? _bmi;
  double? _bodyFat;
  double? _leanBodyMass;
  double? _bodyWater;
  double? _boneMass;
  double? _muscleMass;
  String _bmiCategory = '';
  String _bodyFatCategory = '';
  String _healthRisk = '';
  Color _bmiColor = Colors.grey;
  String _gender = 'Male';
  bool _isMetric = true;
  Map<String, dynamic> _healthInsights = {};

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    _ageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _calculateBMI() {
    final heightText = _heightController.text.trim();
    final weightText = _weightController.text.trim();
    final ageText = _ageController.text.trim();

    if (heightText.isEmpty || weightText.isEmpty || ageText.isEmpty) {
      _showErrorDialog('Please enter all required fields');
      return;
    }

    final height = double.tryParse(heightText);
    final weight = double.tryParse(weightText);
    final age = int.tryParse(ageText);

    if (height == null || weight == null || age == null) {
      _showErrorDialog('Please enter valid numbers');
      return;
    }

    if (height <= 0 || weight <= 0 || age <= 0) {
      _showErrorDialog('All values must be positive numbers');
      return;
    }

    if (height > 300 || weight > 1000 || age > 150) {
      _showErrorDialog('Please enter realistic values');
      return;
    }

    setState(() {
      _bmi = _calculateAdvancedBMI(weight, height, age, _gender);
      _bodyFat = _calculateBodyFat(_bmi!, age, _gender);
      _leanBodyMass = _calculateLeanBodyMass(weight, _bodyFat!);
      _bodyWater = _calculateBodyWater(weight, _bodyFat!, _gender);
      _boneMass = _calculateBoneMass(weight, _gender);
      _muscleMass = _calculateMuscleMass(weight, _bodyFat!);
      _updateCategories();
      _calculateHealthRisk();
      _generateHealthInsights();
      _animationController.forward();
    });
  }

  double _calculateAdvancedBMI(
    double weight,
    double height,
    int age,
    String gender,
  ) {
    // Standard BMI calculation
    final standardBMI = weight / ((height / 100) * (height / 100));

    // Age-adjusted BMI (more accurate for older adults)
    if (age > 65) {
      return standardBMI * 0.95; // Slightly lower for elderly
    } else if (age < 18) {
      return standardBMI * 1.02; // Slightly higher for youth
    }

    return standardBMI;
  }

  double _calculateBodyFat(double bmi, int age, String gender) {
    // Multiple body fat calculation methods
    double deurenberg = 0;
    double jacksonPollock = 0;

    // Deurenberg formula
    if (gender == 'Male') {
      deurenberg = (1.20 * bmi) + (0.23 * age) - 16.2;
    } else {
      deurenberg = (1.20 * bmi) + (0.23 * age) - 5.4;
    }

    // Jackson-Pollock formula (simplified)
    if (gender == 'Male') {
      jacksonPollock = (1.20 * bmi) + (0.23 * age) - 10.8;
    } else {
      jacksonPollock = (1.20 * bmi) + (0.23 * age) - 5.4;
    }

    // Return average of methods for better accuracy
    return (deurenberg + jacksonPollock) / 2;
  }

  double _calculateLeanBodyMass(double weight, double bodyFat) {
    return weight * (1 - bodyFat / 100);
  }

  double _calculateBodyWater(double weight, double bodyFat, String gender) {
    // Body water percentage based on body fat
    double baseWater = gender == 'Male' ? 60.0 : 55.0;
    double fatAdjustment = bodyFat * 0.3; // Fat contains less water
    return baseWater - fatAdjustment;
  }

  double _calculateBoneMass(double weight, String gender) {
    // Bone mass estimation (simplified)
    return gender == 'Male' ? weight * 0.15 : weight * 0.12;
  }

  double _calculateMuscleMass(double weight, double bodyFat) {
    // Muscle mass estimation
    double leanMass = _calculateLeanBodyMass(weight, bodyFat);
    return leanMass * 0.5; // Approximately 50% of lean mass is muscle
  }

  void _calculateHealthRisk() {
    if (_bmi == null) return;

    double riskScore = 0;

    // BMI risk factors
    if (_bmi! < 18.5) {
      riskScore += 2; // Underweight risk
    } else if (_bmi! >= 25 && _bmi! < 30) {
      riskScore += 3; // Overweight risk
    } else if (_bmi! >= 30) {
      riskScore += 5; // Obesity risk
    }

    // Body fat risk factors
    if (_bodyFat != null) {
      if (_gender == 'Male') {
        if (_bodyFat! > 25) riskScore += 2;
        if (_bodyFat! > 30) riskScore += 3;
      } else {
        if (_bodyFat! > 32) riskScore += 2;
        if (_bodyFat! > 35) riskScore += 3;
      }
    }

    // Age risk factors
    final age = int.tryParse(_ageController.text) ?? 0;
    if (age > 50) riskScore += 1;
    if (age > 65) riskScore += 2;

    if (riskScore <= 2) {
      _healthRisk = 'Low Risk';
    } else if (riskScore <= 5) {
      _healthRisk = 'Moderate Risk';
    } else if (riskScore <= 8) {
      _healthRisk = 'High Risk';
    } else {
      _healthRisk = 'Very High Risk';
    }
  }

  void _generateHealthInsights() {
    _healthInsights = {
      'bmi_trend': _calculateBMITrend(),
      'body_composition_score': _calculateBodyCompositionScore(),
      'health_age': _calculateHealthAge(),
      'recommendations': _generatePersonalizedRecommendations(),
      'goals': _suggestHealthGoals(),
    };
  }

  String _calculateBMITrend() {
    return 'Not available';
  }

  double _calculateBodyCompositionScore() {
    if (_bmi == null || _bodyFat == null) return 0;

    double score = 100;

    // BMI scoring
    if (_bmi! < 18.5 || _bmi! > 30) {
      score -= 20;
    } else if (_bmi! < 20 || _bmi! > 25) {
      score -= 10;
    }

    // Body fat scoring
    if (_gender == 'Male') {
      if (_bodyFat! < 6 || _bodyFat! > 25) {
        score -= 15;
      } else if (_bodyFat! < 10 || _bodyFat! > 20) {
        score -= 8;
      }
    } else {
      if (_bodyFat! < 10 || _bodyFat! > 32) {
        score -= 15;
      } else if (_bodyFat! < 16 || _bodyFat! > 25) {
        score -= 8;
      }
    }

    return score.clamp(0, 100);
  }

  int _calculateHealthAge() {
    final age = int.tryParse(_ageController.text) ?? 0;
    if (_bmi == null) return age;

    int healthAge = age;

    // Adjust health age based on BMI
    if (_bmi! > 30) {
      healthAge += 5;
    } else if (_bmi! > 25) {
      healthAge += 2;
    } else if (_bmi! < 18.5) {
      healthAge += 3;
    }

    // Adjust based on body fat
    if (_bodyFat != null) {
      if (_gender == 'Male' && _bodyFat! > 25) {
        healthAge += 3;
      } else if (_gender == 'Female' && _bodyFat! > 32) {
        healthAge += 3;
      }
    }

    return healthAge;
  }

  List<String> _generatePersonalizedRecommendations() {
    List<String> recommendations = [];

    if (_bmi != null) {
      if (_bmi! < 18.5) {
        recommendations.addAll([
          'Focus on healthy weight gain through strength training',
          'Increase caloric intake with nutrient-dense foods',
          'Consult a nutritionist for personalized meal planning',
        ]);
      } else if (_bmi! > 25) {
        recommendations.addAll([
          'Implement a sustainable calorie deficit',
          'Increase physical activity to 150+ minutes/week',
          'Focus on whole foods and reduce processed foods',
        ]);
      }
    }

    if (_bodyFat != null) {
      if (_gender == 'Male' && _bodyFat! > 20) {
        recommendations.add('Include resistance training 3-4 times per week');
      } else if (_gender == 'Female' && _bodyFat! > 25) {
        recommendations.add('Combine cardio and strength training');
      }
    }

    return recommendations;
  }

  List<String> _suggestHealthGoals() {
    List<String> goals = [];

    if (_bmi != null) {
      if (_bmi! < 18.5) {
        goals.add('Gain 0.5-1 kg per month');
        goals.add('Increase muscle mass by 2-3 kg');
      } else if (_bmi! > 25) {
        goals.add('Lose 0.5-1 kg per week');
        goals.add('Reduce BMI by 2-3 points');
      }
    }

    goals.add('Maintain consistent exercise routine');
    goals.add('Improve body composition score');

    return goals;
  }

  void _updateCategories() {
    if (_bmi == null) return;

    // BMI Categories
    if (_bmi! < 18.5) {
      _bmiCategory = 'Underweight';
      _bmiColor = Colors.blue;
    } else if (_bmi! < 25) {
      _bmiCategory = 'Normal weight';
      _bmiColor = Colors.green;
    } else if (_bmi! < 30) {
      _bmiCategory = 'Overweight';
      _bmiColor = Colors.orange;
    } else {
      _bmiCategory = 'Obese';
      _bmiColor = Colors.red;
    }

    // Body Fat Categories
    if (_bodyFat != null) {
      if (_gender == 'Male') {
        if (_bodyFat! < 6) {
          _bodyFatCategory = 'Essential Fat';
        } else if (_bodyFat! < 14) {
          _bodyFatCategory = 'Athletes';
        } else if (_bodyFat! < 18) {
          _bodyFatCategory = 'Fitness';
        } else if (_bodyFat! < 25) {
          _bodyFatCategory = 'Average';
        } else {
          _bodyFatCategory = 'Obese';
        }
      } else {
        if (_bodyFat! < 10) {
          _bodyFatCategory = 'Essential Fat';
        } else if (_bodyFat! < 16) {
          _bodyFatCategory = 'Athletes';
        } else if (_bodyFat! < 20) {
          _bodyFatCategory = 'Fitness';
        } else if (_bodyFat! < 25) {
          _bodyFatCategory = 'Average';
        } else {
          _bodyFatCategory = 'Obese';
        }
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _reset() {
    setState(() {
      _heightController.clear();
      _weightController.clear();
      _ageController.clear();
      _bmi = null;
      _bodyFat = null;
      _leanBodyMass = null;
      _bodyWater = null;
      _boneMass = null;
      _muscleMass = null;
      _bmiCategory = '';
      _bodyFatCategory = '';
      _healthRisk = '';
      _bmiColor = Colors.grey;
      _healthInsights = {};
      _animationController.reset();
    });
  }

  void _toggleUnits() {
    setState(() {
      _isMetric = !_isMetric;
      if (!_isMetric) {
        // Convert to imperial
        if (_heightController.text.isNotEmpty) {
          final cm = double.tryParse(_heightController.text);
          if (cm != null) {
            final inches = cm / 2.54;
            _heightController.text = inches.toStringAsFixed(1);
          }
        }
        if (_weightController.text.isNotEmpty) {
          final kg = double.tryParse(_weightController.text);
          if (kg != null) {
            final lbs = kg * 2.205;
            _weightController.text = lbs.toStringAsFixed(1);
          }
        }
      } else {
        // Convert to metric
        if (_heightController.text.isNotEmpty) {
          final inches = double.tryParse(_heightController.text);
          if (inches != null) {
            final cm = inches * 2.54;
            _heightController.text = cm.toStringAsFixed(1);
          }
        }
        if (_weightController.text.isNotEmpty) {
          final lbs = double.tryParse(_weightController.text);
          if (lbs != null) {
            final kg = lbs / 2.205;
            _weightController.text = kg.toStringAsFixed(1);
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF9CAF88), // Light sage
              const Color(0xFFB2C9AB), // Lighter sage
              const Color(0xFF8A9A5B), // Olive sage
              const Color(0xFF9CAF88).withValues(alpha: 0.8),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'Advanced BMI Calculator',
              style: GoogleFonts.comicNeue(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black87,
              ),
            ),
            backgroundColor: Colors.white.withValues(alpha: 0.1),
            elevation: 0,
            flexibleSpace: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withValues(alpha: 0.2),
                        Colors.white.withValues(alpha: 0.1),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            centerTitle: true,
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                child: IconButton(
                  icon: Icon(
                    _isMetric ? Icons.straighten : Icons.straighten_outlined,
                    color: Colors.black87,
                    size: 20,
                  ),
                  onPressed: _toggleUnits,
                  tooltip: 'Toggle Units',
                ),
              ),
            ],
          ),
          body: _buildCalculatorTab(),
        ),
      ),
    );
  }

  Widget _buildCalculatorTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),
          GlassCard(
            padding: const EdgeInsets.all(32.0),
            blur: 15.0,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withValues(alpha: 0.2),
                        Colors.white.withValues(alpha: 0.1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.3),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withValues(alpha: 0.1),
                        blurRadius: 15,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.monitor_weight_outlined,
                    size: 56,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  'Advanced BMI Calculator',
                  style: GoogleFonts.comicNeue(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    letterSpacing: -0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.2),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    '🌿 Health & Wellness',
                    style: GoogleFonts.comicNeue(
                      fontSize: 14,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Calculate BMI, body fat percentage, and track your health journey',
                  style: GoogleFonts.comicNeue(
                    fontSize: 16,
                    color: Colors.black87,
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 48),

          // Gender Selection
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.person_outline,
                      color: Colors.black87,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Gender',
                      style: GoogleFonts.comicNeue(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: _buildGenderOption('Male', Icons.male, 'Male'),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildGenderOption(
                        'Female',
                        Icons.female,
                        'Female',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // Input Fields
          _buildInputField(
            controller: _heightController,
            label: _isMetric ? 'Height (cm)' : 'Height (inches)',
            hint: _isMetric
                ? 'Enter your height in centimeters'
                : 'Enter your height in inches',
            icon: Icons.height,
          ),
          const SizedBox(height: 20),
          _buildInputField(
            controller: _weightController,
            label: _isMetric ? 'Weight (kg)' : 'Weight (lbs)',
            hint: _isMetric
                ? 'Enter your weight in kilograms'
                : 'Enter your weight in pounds',
            icon: Icons.fitness_center,
          ),
          const SizedBox(height: 20),
          _buildInputField(
            controller: _ageController,
            label: 'Age (years)',
            hint: 'Enter your age',
            icon: Icons.cake,
          ),
          const SizedBox(height: 40),

          // Action Buttons
          Row(
            children: [
              Expanded(
                child: GlassCard(
                  padding: EdgeInsets.zero,
                  color: Colors.white,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _calculateBMI,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.calculate_rounded,
                              color: Colors.black87,
                              size: 24,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Calculate',
                              style: GoogleFonts.comicNeue(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.4),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _reset,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.refresh_rounded,
                              color: Colors.black87,
                              size: 24,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Reset',
                              style: GoogleFonts.comicNeue(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 48),

          // Results
          if (_bmi != null) ...[
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.scale(scale: _animation.value, child: child);
              },
              child: Column(
                children: [
                  // BMI Result
                  GlassCard(
                    padding: const EdgeInsets.all(36.0),
                    blur: 15.0,
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(
                      color: _bmiColor.withValues(alpha: 0.3),
                      width: 2,
                    ),
                    child: Column(
                      children: [
                        // Icon with category color ring
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                _bmiColor.withValues(alpha: 0.3),
                                _bmiColor.withValues(alpha: 0.2),
                              ],
                            ),
                            border: Border.all(
                              color: _bmiColor.withValues(alpha: 0.5),
                              width: 3,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: _bmiColor.withValues(alpha: 0.3),
                                blurRadius: 20,
                                spreadRadius: 4,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.monitor_weight_rounded,
                            color: Colors.black87,
                            size: 40,
                          ),
                        ),
                        const SizedBox(height: 28),

                        // Label
                        Text(
                          'Your BMI Score',
                          style: GoogleFonts.comicNeue(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // BMI Value
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.white.withValues(alpha: 0.2),
                                Colors.white.withValues(alpha: 0.1),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.3),
                              width: 1.5,
                            ),
                          ),
                          child: Text(
                            _bmi!.toStringAsFixed(1),
                            style: GoogleFonts.comicNeue(
                              fontSize: 64,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              letterSpacing: -2,
                              height: 1,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Category Badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 28,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                _bmiColor.withValues(alpha: 0.4),
                                _bmiColor.withValues(alpha: 0.3),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: _bmiColor.withValues(alpha: 0.6),
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: _bmiColor.withValues(alpha: 0.3),
                                blurRadius: 15,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white.withValues(
                                        alpha: 0.5,
                                      ),
                                      blurRadius: 8,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                _bmiCategory.toUpperCase(),
                                style: GoogleFonts.comicNeue(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Body Fat Result
                  if (_bodyFat != null)
                    GlassCard(
                      padding: const EdgeInsets.all(36.0),
                      blur: 15.0,
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(
                        color: const Color(0xFF8A9A5B).withValues(alpha: 0.3),
                        width: 2,
                      ),
                      child: Column(
                        children: [
                          // Icon with sage color ring
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  const Color(
                                    0xFF8A9A5B,
                                  ).withValues(alpha: 0.3),
                                  const Color(
                                    0xFF8A9A5B,
                                  ).withValues(alpha: 0.2),
                                ],
                              ),
                              border: Border.all(
                                color: const Color(
                                  0xFF8A9A5B,
                                ).withValues(alpha: 0.5),
                                width: 3,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(
                                    0xFF8A9A5B,
                                  ).withValues(alpha: 0.3),
                                  blurRadius: 20,
                                  spreadRadius: 4,
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.fitness_center_rounded,
                              color: Colors.black87,
                              size: 40,
                            ),
                          ),
                          const SizedBox(height: 28),

                          // Label
                          Text(
                            'Body Fat Percentage',
                            style: GoogleFonts.comicNeue(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Body Fat Value
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white.withValues(alpha: 0.2),
                                  Colors.white.withValues(alpha: 0.1),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.3),
                                width: 1.5,
                              ),
                            ),
                            child: Text(
                              '${_bodyFat!.toStringAsFixed(1)}%',
                              style: GoogleFonts.comicNeue(
                                fontSize: 64,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                letterSpacing: -2,
                                height: 1,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Category Badge
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 28,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  const Color(
                                    0xFF8A9A5B,
                                  ).withValues(alpha: 0.4),
                                  const Color(
                                    0xFF8A9A5B,
                                  ).withValues(alpha: 0.3),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: const Color(
                                  0xFF8A9A5B,
                                ).withValues(alpha: 0.6),
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(
                                    0xFF8A9A5B,
                                  ).withValues(alpha: 0.3),
                                  blurRadius: 15,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withValues(
                                          alpha: 0.5,
                                        ),
                                        blurRadius: 8,
                                        spreadRadius: 2,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  _bodyFatCategory.toUpperCase(),
                                  style: GoogleFonts.comicNeue(
                                    color: Colors.black87,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 32),

                  // Advanced Body Composition
                  _buildAdvancedBodyComposition(),
                  const SizedBox(height: 24),

                  // Health Risk Assessment
                  _buildHealthRiskAssessment(),
                  const SizedBox(height: 24),

                  // Health Insights
                  _buildHealthInsights(),
                  const SizedBox(height: 24),

                  // Health Recommendations
                  _buildHealthRecommendations(),
                  const SizedBox(height: 24),

                  // Reference Charts
                  _buildReferenceCharts(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAdvancedBodyComposition() {
    if (_bmi == null || _bodyFat == null) return const SizedBox.shrink();

    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.analytics, color: Colors.black87),
              const SizedBox(width: 12),
              Text(
                'Advanced Body Composition',
                style: GoogleFonts.comicNeue(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _buildCompositionCard(
                  'Lean Body Mass',
                  '${_leanBodyMass!.toStringAsFixed(1)} kg',
                  Icons.fitness_center,
                  Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildCompositionCard(
                  'Body Water',
                  '${_bodyWater!.toStringAsFixed(1)}%',
                  Icons.water_drop,
                  Colors.cyan,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildCompositionCard(
                  'Muscle Mass',
                  '${_muscleMass!.toStringAsFixed(1)} kg',
                  Icons.sports_gymnastics,
                  Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildCompositionCard(
                  'Bone Mass',
                  '${_boneMass!.toStringAsFixed(1)} kg',
                  Icons.health_and_safety,
                  Colors.orange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCompositionCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.black87, size: 24),
          const SizedBox(height: 12),
          Text(
            value,
            style: GoogleFonts.comicNeue(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: GoogleFonts.comicNeue(fontSize: 12, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildHealthRiskAssessment() {
    if (_bmi == null) return const SizedBox.shrink();

    Color riskColor = Colors.green;
    if (_healthRisk == 'Moderate Risk') riskColor = Colors.orange;
    if (_healthRisk == 'High Risk') riskColor = Colors.red;
    if (_healthRisk == 'Very High Risk') riskColor = Colors.red[800]!;

    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.warning, color: Colors.black87),
              const SizedBox(width: 12),
              Text(
                'Health Risk Assessment',
                style: GoogleFonts.comicNeue(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: riskColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: riskColor.withValues(alpha: 0.3)),
            ),
            child: Row(
              children: [
                Icon(Icons.assessment, color: Colors.black87, size: 32),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _healthRisk,
                        style: GoogleFonts.comicNeue(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        'Based on BMI, body fat, and age analysis',
                        style: GoogleFonts.comicNeue(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthInsights() {
    if (_healthInsights.isEmpty) return const SizedBox.shrink();

    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.insights, color: Colors.black87),
              const SizedBox(width: 12),
              Text(
                'Health Insights',
                style: GoogleFonts.comicNeue(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildInsightRow('BMI Trend', _healthInsights['bmi_trend'] ?? 'N/A'),
          const SizedBox(height: 12),
          _buildInsightRow(
            'Body Composition Score',
            '${_healthInsights['body_composition_score']?.toStringAsFixed(0) ?? '0'}/100',
          ),
          const SizedBox(height: 12),
          _buildInsightRow(
            'Health Age',
            '${_healthInsights['health_age'] ?? 'N/A'} years',
          ),
          const SizedBox(height: 20),
          Text(
            'Personalized Goals:',
            style: GoogleFonts.comicNeue(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          ...(_healthInsights['goals'] as List<String>? ?? []).map(
            (goal) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                children: [
                  Icon(Icons.flag, size: 16, color: Colors.green),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      goal,
                      style: GoogleFonts.comicNeue(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInsightRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.comicNeue(fontSize: 14, color: Colors.black54),
          ),
          Text(
            value,
            style: GoogleFonts.comicNeue(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthRecommendations() {
    if (_bmi == null) return const SizedBox.shrink();

    String recommendation = '';

    if (_bmi! < 18.5) {
      recommendation =
          'Consider consulting a healthcare provider about healthy weight gain strategies.';
    } else if (_bmi! < 25) {
      recommendation =
          'Great! Maintain your current healthy lifestyle with balanced diet and regular exercise.';
    } else if (_bmi! < 30) {
      recommendation =
          'Consider moderate weight loss through diet and exercise. Consult a healthcare provider for guidance.';
    } else {
      recommendation =
          'Consider consulting a healthcare provider about weight management strategies.';
    }

    return GlassCard(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.health_and_safety, color: Colors.black87),
              const SizedBox(width: 8),
              Text(
                'Health Recommendation',
                style: GoogleFonts.comicNeue(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            recommendation,
            style: GoogleFonts.comicNeue(fontSize: 15, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildReferenceCharts() {
    return GlassCard(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'BMI Categories',
            style: GoogleFonts.comicNeue(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          _buildCategoryRow('Underweight', 'Below 18.5', Colors.blue),
          const SizedBox(height: 8),
          _buildCategoryRow('Normal weight', '18.5 - 24.9', Colors.green),
          const SizedBox(height: 8),
          _buildCategoryRow('Overweight', '25.0 - 29.9', Colors.orange),
          const SizedBox(height: 8),
          _buildCategoryRow('Obese', '30.0 and above', Colors.red),
          const SizedBox(height: 24),
          Text(
            'Body Fat Categories',
            style: GoogleFonts.comicNeue(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            _gender == 'Male' ? 'Male Categories:' : 'Female Categories:',
            style: GoogleFonts.comicNeue(
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          _buildCategoryRow(
            'Essential Fat',
            _gender == 'Male' ? '< 6%' : '< 10%',
            Colors.red,
          ),
          const SizedBox(height: 8),
          _buildCategoryRow(
            'Athletes',
            _gender == 'Male' ? '6-14%' : '10-16%',
            Colors.orange,
          ),
          const SizedBox(height: 8),
          _buildCategoryRow(
            'Fitness',
            _gender == 'Male' ? '14-18%' : '16-20%',
            Colors.yellow,
          ),
          const SizedBox(height: 8),
          _buildCategoryRow(
            'Average',
            _gender == 'Male' ? '18-25%' : '20-25%',
            Colors.green,
          ),
          const SizedBox(height: 8),
          _buildCategoryRow(
            'Obese',
            _gender == 'Male' ? '> 25%' : '> 25%',
            Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildGenderOption(String value, IconData icon, String label) {
    final isSelected = _gender == value;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(() {
            _gender = value;
          });
        },
        borderRadius: BorderRadius.circular(16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          decoration: BoxDecoration(
            gradient: isSelected
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withValues(alpha: 0.3),
                      Colors.white.withValues(alpha: 0.2),
                    ],
                  )
                : null,
            color: isSelected ? null : Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected
                  ? Colors.white.withValues(alpha: 0.6)
                  : Colors.white.withValues(alpha: 0.2),
              width: isSelected ? 2.5 : 1.5,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.white.withValues(alpha: 0.2),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.black87, size: isSelected ? 26 : 22),
              const SizedBox(width: 12),
              Text(
                label,
                style: GoogleFonts.comicNeue(
                  color: Colors.black87,
                  fontSize: isSelected ? 17 : 16,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return GlassCard(
      padding: const EdgeInsets.all(4),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.black54, fontSize: 14),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),
          prefixIcon: Icon(icon, color: Colors.black87, size: 22),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Colors.white.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Colors.white.withValues(alpha: 0.5),
              width: 2,
            ),
          ),
          filled: true,
          fillColor: Colors.white.withValues(alpha: 0.05),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryRow(String category, String range, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              category,
              style: GoogleFonts.comicNeue(fontSize: 15, color: Colors.black87),
            ),
          ),
          Text(
            range,
            style: GoogleFonts.comicNeue(fontSize: 13, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
