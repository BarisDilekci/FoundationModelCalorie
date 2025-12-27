//
//  FoodCalorieEstimator.swift
//  FoundationModelCalorie
//
//  Created by Barış Dilekçi on 28.12.2025.
//

import Foundation
import FoundationModels


/// Protocol defining the contract for calorie estimation.
protocol IFoodCalorieEstimator {
    /// Estimates the calories for a given meal.
    /// - Parameter meal: The meal object containing the name of the food.
    /// - Returns: A `CalorieInfo` object containing the estimated calories.
    func estimatorCalories(meal: Meal) async throws -> CalorieInfo
}

/// A service responsible for estimating calories using a Foundation Model.
@Observable
final class FoodCalorieEstimator : IFoodCalorieEstimator {
    
    // MARK: - Properties
    
    /// The language model session used for generating responses.
    private let session = LanguageModelSession()
    
    // MARK: - Methods
    
    /// Estimates the calorie count for a specific meal by querying the language model.
    /// - Parameter meal: The meal to estimate.
    /// - Returns: Derived `CalorieInfo` from the model's response.
    func estimatorCalories(meal: Meal) async throws -> CalorieInfo {
        let prompt = "Calculate the approximate calories count for meal with name \(meal.name)"
        let response = try await session.respond(to: prompt , generating: CalorieInfo.self)
        
        return response.content
    }
}
