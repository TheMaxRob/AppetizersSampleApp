//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Max Roberts on 12/30/23.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
