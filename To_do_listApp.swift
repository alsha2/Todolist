//
//  To_do_listApp.swift
//  To do list
//
//  Created by Shahad Al-deewan on 2023-08-01.
//

import SwiftUI

@main
struct To_do_listApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(StoreData())
        }
    }
}
