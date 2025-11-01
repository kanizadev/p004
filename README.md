# 🌿 Advanced BMI Calculator

A beautiful, modern Flutter application for calculating Body Mass Index (BMI) and body composition metrics with an elegant glassmorphism design and sage green color scheme.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)


## ✨ Features

### 📊 Comprehensive Health Metrics
- **BMI Calculation** - Accurate body mass index with category classification
- **Body Fat Percentage** - Advanced body fat estimation using Navy method
- **Body Composition Analysis** - Detailed breakdown including:
  - Lean Body Mass
  - Body Water Percentage
  - Muscle Mass
  - Bone Mass

### 🎯 Health Insights
- **Risk Assessment** - Personalized health risk evaluation
- **Health Insights** - BMI trends and body composition scoring
- **Health Age** - Calculated based on your metrics
- **Personalized Goals** - Custom recommendations for your health journey
- **Reference Charts** - BMI and body fat category guidelines

### 🎨 Beautiful UI/UX
- **Glassmorphism Design** - Modern frosted glass effect throughout the app
- **Sage Green Theme** - Calming, nature-inspired color palette
- **Smooth Animations** - Delightful transitions and scaling effects
- **Responsive Layout** - Optimized for all screen sizes
- **Dark Icons & Text** - High contrast for excellent readability

### ⚙️ User-Friendly Features
- **Unit Toggle** - Switch between Metric (kg/cm) and Imperial (lbs/inches)
- **Gender Selection** - Tailored calculations for male and female
- **Real-time Validation** - Instant feedback on input
- **Reset Functionality** - Quick clear all fields


## 📱 Supported Platforms

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 📖 How to Use

1. **Select Your Gender** - Tap on Male or Female
2. **Enter Your Details**
   - Height (in cm or inches)
   - Weight (in kg or lbs)
   - Age (in years)
3. **Calculate** - Tap the Calculate button
4. **View Results** - See your comprehensive health metrics:
   - BMI score and category
   - Body fat percentage
   - Advanced body composition
   - Health risk assessment
   - Personalized insights and recommendations

## 🎯 BMI Categories

| Category | BMI Range | Health Status |
|----------|-----------|---------------|
| Underweight | Below 18.5 | May indicate malnutrition |
| Normal Weight | 18.5 - 24.9 | Healthy weight range |
| Overweight | 25.0 - 29.9 | May increase health risks |
| Obese | 30.0 and above | Higher health risks |

## 🔬 Calculation Methods

### BMI Formula
```
BMI = weight (kg) / (height (m))²
```

### Body Fat Percentage (Navy Method)
**For Men:**
```
Body Fat % = 495 / (1.0324 - 0.19077 × log10(waist - neck) + 0.15456 × log10(height)) - 450
```

**For Women:**
```
Body Fat % = 495 / (1.29579 - 0.35004 × log10(waist + hip - neck) + 0.22100 × log10(height)) - 450
```

### Other Metrics
- **Lean Body Mass** = Weight × (1 - Body Fat %)
- **Body Water** ≈ 73% of Lean Body Mass
- **Muscle Mass** ≈ 45% of Total Weight (with adjustments)
- **Bone Mass** ≈ 15% of Lean Body Mass

## 🎨 Design Features

### Glassmorphism Effect
- Frosted glass containers with blur effect
- Subtle transparency and layering
- Soft shadows and borders
- Gradient overlays

### Color Palette
- **Primary**: Sage Green (#9CAF88)
- **Secondary**: Light Sage (#B2C9AB)
- **Accent**: Deep Sage (#8A9A5B)
- **Text**: Dark Gray (#000000DE)



## 👤 Author

**Your Name**
- GitHub: [@kanizadev](https://github.com/kanizadev)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Material Design for design inspiration
- Google Fonts for the beautiful typography
- The open-source community

## 📸 Screenshots

*Add your app screenshots here*

## 💡 Tips

- For best results, measure yourself at the same time each day
- Body fat calculations are estimates and may vary from professional measurements
- Consult healthcare professionals for medical advice
- Regular exercise and balanced diet are key to maintaining healthy metrics

---

<div align="center">

**⭐ If you like this project, please give it a star! ⭐**

Made with ❤️ and Flutter

</div>
