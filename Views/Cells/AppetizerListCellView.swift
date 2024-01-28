//
//  AppetizerListCellView.swift
//  Appetizers
//
//  Created by Max Roberts on 12/30/23.
//

import SwiftUI

struct AppetizerListCellView: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        HStack(spacing: 20) {
//            AppetizerRemoteImage(urlString: appetizer.imageURL)
//                .aspectRatio(contentMode: .fit)
//                .cornerRadius(8)
//                .frame(width: 120, height: 90)
                
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
                    .cornerRadius(8)
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
                    .cornerRadius(8)
            }

            
            VStack(alignment: .leading, spacing: 5) {
                Text("\(appetizer.name)")
                    .font(.title3)
                Text(" $\(appetizer.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                    
            }
            
            
        }
    }
}

#Preview {
    AppetizerListCellView(appetizer: MockData.orderItem1)
}
