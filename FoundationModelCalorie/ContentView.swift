//
//  ContentView.swift
//  FoundationalCalories
//
//  Created by Atil Samancioglu on 15.11.2025.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    
    /// The ViewModel handling the business logic for the meal list.
    @State private var viewModel = MealListViewModel()
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.meals.isEmpty {
                    // Show a placeholder when no meals are added
                    ContentUnavailableView(
                        "No Meals Yet",
                        systemImage: "fork.knife",
                        description: Text("Add your first meal to start tracking calories")
                    )
                } else {
                    // List of meals
                    List {
                        Section {
                            ForEach(viewModel.meals) { meal in
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(meal.name)
                                            .font(.headline)
                                        
                                        if let calories = meal.calorieInfo?.calories {
                                            Text("\(calories) calories")
                                                .font(.subheadline)
                                                .foregroundStyle(.secondary)
                                        }
                                    }
                                    
                                    Spacer()
                                    
                                    if let calories = meal.calorieInfo?.calories {
                                        Text("\(calories)")
                                            .font(.title3)
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.blue)
                                    }
                                }
                                .padding(.vertical, 4)
                            }
                            .onDelete(perform: viewModel.deleteMeal)
                        }
                        
                        // Total Calories Footer
                        Section {
                            HStack {
                                Text("Total Calories")
                                    .font(.headline)
                                Spacer()
                                Text("\(viewModel.totalCalories)")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.green)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Calorie Tracker")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        viewModel.showingAddMeal = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
                if !viewModel.meals.isEmpty {
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }
                }
            }
            .sheet(isPresented: $viewModel.showingAddMeal) {
                AddMealView { meal in
                    viewModel.addMeal(meal)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
