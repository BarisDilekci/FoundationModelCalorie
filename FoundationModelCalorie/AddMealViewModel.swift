//
//  AddMealViewModel.swift
//  FoundationModelCalorie
//
//  Created by Barış Dilekçi on 28.12.2025.
//

import SwiftUI
import Observation

/// ViewModel for the Add Meal screen.
/// Handle's user input validation and interaction with the calorie estimator service.
@Observable
final class AddMealViewModel {
    
    // MARK: - Properties
    
    /// User input for the food name.
    var foodName = ""
    
    /// Indicates if an asynchronous task is running.
    var isLoading = false
    
    /// Holds error messages to be displayed to the user.
    var errorMessage: String?
    
    // MARK: - Dependencies
    
    private let estimator = FoodCalorieEstimator()
    
    // MARK: - Actions
    
    /// Generates nutritional information for the entered food name.
    /// - Parameter onSave: Closure to execute upon successful estimation and creation of the meal.
    func generateNutritionalInformation(onSave: @escaping (Meal) -> Void) {
        // Validation: Ensure food name is not empty
        guard !foodName.isEmpty else { return }
        
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                var meal = Meal(name: foodName)
                
                // Fetch calorie info from the service
                let calorieInfo = try await estimator.estimatorCalories(meal: meal)
                meal.calorieInfo = calorieInfo
                
                // Update UI on Main Actor and notify success
                await MainActor.run {
                    self.isLoading = false
                    onSave(meal)
                }
            } catch {
                await MainActor.run {
                    self.isLoading = false
                    self.errorMessage = "Failed to count calories: \(error.localizedDescription)"
                }
            }
        }
    }
}
