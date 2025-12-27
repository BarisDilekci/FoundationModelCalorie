# FoundationModelCalorie

**FoundationModelCalorie** is an iOS application that leverages the power of Foundation Models to estimate calorie counts for various meals. By simply inputting the name of a meal, the app uses a language model to provide an approximate nutritional breakdown.

## Features

- **AI-Powered Calorie Estimation**: Uses `LanguageModelSession` to estimate calories based on food names.
- **Meal Tracking**: Keep a list of your daily meals and view the total calorie intake.
- **Simple & Clean UI**: Built with SwiftUI for a modern and responsive user experience.
- **Offline/On-Device Inference**: (Depending on the model used) potential for privacy-focused local processing.

## Screenshots

<!-- Add screenshots here -->
<p align="center">
  <img src="path/to/screenshot1.png" width="300" alt="Home Screen">
  <img src="path/to/screenshot2.png" width="300" alt="Add Meal Screen">
</p>

## Requirements

- iOS 17.0+
- Xcode 15.0+
- Swift 5.9+

## Installation

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/yourusername/FoundationModelCalorie.git
    cd FoundationModelCalorie
    ```

2.  **Open in Xcode**:
    Double-click `FoundationModelCalorie.xcodeproj` to open the project.

3.  **Build and Run**:
    Select your target simulator or device and press `Cmd + R`.

## Usage

1.  Launch the app.
2.  Tap the `+` button in the top right corner to add a new meal.
3.  Enter the name of the food (e.g., "Cheeseburger").
4.  The app will estimate the calories using the integrated Foundation Model and add it to your daily list.

## Project Structure

- `FoundationModelCalorieApp.swift`: The entry point of the application.
- `ContentView.swift`: The main view displaying the list of meals and total calories.
- `AddMealView.swift`: The screen for adding new meals and performing estimations.
- `FoodCalorieEstimator.swift`: Service class handling the interaction with the Language Model.
- `Meal.swift`: Data models for meals and calorie information.

## Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
# FoundationModelCalorie
