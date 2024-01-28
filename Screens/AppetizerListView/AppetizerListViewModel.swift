//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Max Roberts on 12/31/23.
//

import SwiftUI

@MainActor final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
//    func getAppetizers() {
//        // At start before getting getAppetizers from NetworkManager, we are loading
//        isLoading = true
//        NetworkManager.shared.getAppetizers { [self] result in
//            
//            // Get to main thread
//            DispatchQueue.main.async {
//                // When we get result back, no longer loading
//                self.isLoading = false
//                switch result {
//                    
//                case .success(let appetizers):
//                    self.appetizers = appetizers
//                    
//                    
//                case .failure(let error):
//                    switch error {
//                        
//                    case .invalidURL:
//                        self.alertItem = AlertContext.invalidURL
//                        
//                    case .invalidResponse:
//                        self.alertItem = AlertContext.invalidResponse
//                        
//                    case .invalidData:
//                        self.alertItem = AlertContext.invalidData
//                        
//                    case .unableToComplete:
//                        self.alertItem = AlertContext.unableToComplete
//                    }
//                }
//            }
//           
//        }
//    }
    
    
    func getAppetizers() {
        isLoading = true
        
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                if let apError = error as? APError {
                    switch apError {
                        case .invalidURL:
                            alertItem = AlertContext.invalidURL
                        case .invalidResponse:
                            alertItem = AlertContext.invalidResponse
                        case .invalidData:
                            alertItem = AlertContext.invalidData
                        case .unableToComplete:
                            alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                }
                isLoading = false
            }
        }
    }
}
