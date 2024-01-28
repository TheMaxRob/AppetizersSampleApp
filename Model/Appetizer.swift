//
//  Appetizer.swift
//  Appetizers
//
//  Created by Max Roberts on 12/30/23.
//

import SwiftUI

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    var imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    
    static let sampleAppetizer = Appetizer(id: 0001,
                                           name: "Test Appetizer 1",
                                           description: "This is the description for my appetizer. It's yummy.",
                                           price: 9.99,
                                           imageURL: "food-placerholder",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    static let orderItem1 = Appetizer(id: 0001,
                                           name: "Test Appetizer 1",
                                           description: "This is the description for my appetizer. It's yummy.",
                                           price: 9.99,
                                           imageURL: "food-placerholder",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    static let orderItem2 = Appetizer(id: 0002,
                                           name: "Test Appetizer 2",
                                           description: "This is the description for my appetizer. It's yummy.",
                                           price: 9.99,
                                           imageURL: "food-placerholder",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    static let orderItem3 = Appetizer(id: 0003,
                                           name: "Test Appetizer 3",
                                           description: "This is the description for my appetizer. It's yummy.",
                                           price: 9.99,
                                           imageURL: "food-placerholder",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    static let orderItem4 = Appetizer(id: 0004,
                                           name: "Test Appetizer 4",
                                           description: "This is the description for my appetizer. It's yummy.",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    static let appetizers = [
        orderItem1, orderItem1, orderItem1, orderItem1
    ]
    
    static let orderItems = [
        orderItem1, orderItem2, orderItem3, orderItem4
    ]
}
