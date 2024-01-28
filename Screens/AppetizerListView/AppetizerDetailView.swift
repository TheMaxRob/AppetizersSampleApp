//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Max Roberts on 12/31/23.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
    
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            Text("\(appetizer.name)")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.bottom, 7.5)
            
            Spacer()
                .frame(height: 5)
            
            Text("\(appetizer.description)")
                .padding()
                .font(.body)
                .multilineTextAlignment(.center)
                
            
            HStack(spacing: 35) {
                NutritionInfo(title: "Calories", value: "\(appetizer.calories)")
                NutritionInfo(title: "Carbs", value: "\(appetizer.carbs) g")
                NutritionInfo(title: "Protein", value: "\(appetizer.protein) g")
            }
            
            Spacer()
            
            Button {
                order.items.append(appetizer)
                isShowingDetail = false
            } label: {
                //APButton(title: "$\(String(format: "%.2f", appetizer.price)) - Add to Order")
                Text("$\(String(format: "%.2f", appetizer.price)) - Add to Order")
            }
            .modifier(standardButtonStyle())
            //.buttonStyle(.bordered)
            //.tint(Color("brandPrimary"))
            //.controlSize(.large)
            .padding(.bottom, 25)
        }
        
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        } label: {
            XDismissButton()
        }, alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
}

struct NutritionInfo: View {
    
    let title: String
    let value: String
    
    var body: some View {
        VStack {
            Text("\(title)")
                .font(.system(size: 12))
            
            Text("\(value)")
                .font(.system(size: 20))
                .foregroundColor(.gray)
        }
       
    }
}
