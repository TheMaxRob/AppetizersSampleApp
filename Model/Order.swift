//
//  Order.swift
//  Appetizers
//
//  Created by Max Roberts on 1/2/24.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
}

