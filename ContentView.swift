//
//  ContentView.swift
//  To do list
//
//  Created by Shahad Al-deewan on 2023-08-01.
//
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var storeData: StoreData
    
    var body: some View {
        NavigationView {
            List(storeData.todos) { toDo in
                NavigationLink(destination: Text("ToDo Detail View")) {
                    Text(toDo.name)
                        .foregroundColor(toDo.completed ? Color.blue : Color(.label))
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("To-Do List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(StoreData())
    }
}

