//
//  MealListViewModel.swift
//  FoundationModelCalorie
//
//  Created by Barış Dilekçi on 28.12.2025.
//

import SwiftUI
import Observation

/// ViewModel for managing the list of meals and total calorie calculations.
@Observable
final class MealListViewModel {
    
    // MARK: - Properties
    
    /// The collection of meals tracked by the user.
    var meals: [Meal] = []
    
    /// Controls the presentation of the "Add Meal" sheet.
    var showingAddMeal = false
    
    /// Computes the total calories from all meals.
    var totalCalories: Int {
        meals.reduce(0) { total, meal in
            total + (meal.calorieInfo?.calories ?? 0)
        }
    }
    
    // MARK: - Actions
    
    /// Adds a new meal to the list.
    /// - Parameter meal: The meal to add.
    func addMeal(_ meal: Meal) {
        meals.append(meal)
        showingAddMeal = false
    }
    
    /// Deletes meals at the specified offsets.
    /// - Parameter offsets: IndexSet of meals to remove.
    func deleteMeal(at offsets: IndexSet) {
        meals.remove(atOffsets: offsets)
    }
}
