//
//  OrderView.swift
//  Appetizers
//
//  Created by Max Roberts on 12/30/23.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    @State private var isEmpty = true
    
    var body: some View {

        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCellView(appetizer: appetizer)
                
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .listStyle(PlainListStyle())
                    
                    Button {
                        print("Order placed")
                    } label: {
                        //APButton(title: "$\(order.totalPrice) - Place Order")
                        Text("$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .modifier(standardButtonStyle())
                    .padding(.bottom, 25)
                    .frame(width: 260)
                }
                if order.items.isEmpty {
                    EmptyState(imageName: "food-placeholder",
                               message: "You have no items in your order.")
                }
             
            }
            .navigationTitle("Orders")
        }
    }
    func deleteItems(atOffsets: IndexSet) {
        order.items.remove(atOffsets: atOffsets)
    }
    
}

#Preview {
    OrderView()
}
