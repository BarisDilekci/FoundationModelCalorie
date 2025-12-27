//
//  AddMealView.swift
//  FoundationModelCalorie
//
//  Created by Barış Dilekçi on 28.12.2025.
//

import SwiftUI

struct AddMealView: View {
    // MARK: - Properties
    
    @Environment(\.dismiss) private var dismiss
    
    /// The ViewModel containing logic for adding a meal.
    @State private var viewModel = AddMealViewModel()
    
    /// Callback closure to handle the saved meal.
    let onSave: (Meal) -> Void
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            Form {
                // Food Input Section
                Section {
                    TextField("Food name", text: $viewModel.foodName)
                } header: {
                    Text("What did you eat?")
                }
                
                // Error Display Section
                if let errorMessage = viewModel.errorMessage {
                    Section {
                        Text(errorMessage)
                            .foregroundStyle(.red)
                    }
                }
            }
            .navigationTitle("Add Meal")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        viewModel.generateNutritionalInformation { meal in
                            onSave(meal)
                            dismiss()
                        }
                    }
                    .disabled(viewModel.foodName.isEmpty || viewModel.isLoading)
                }
            }
            // Loading Overlay
            .overlay {
                if viewModel.isLoading {
                    ZStack {
                        Color.black.opacity(0.3)
                            .ignoresSafeArea()
                        
                        VStack(spacing: 16) {
                            ProgressView()
                                .scaleEffect(1.5)
                            Text("Counting calories...")
                                .font(.headline)
                        }
                        .padding(32)
                        .background(.regularMaterial)
                        .cornerRadius(16)
                    }
                }
            }
        }
    }
}

#Preview {
    AddMealView { _ in }
}
