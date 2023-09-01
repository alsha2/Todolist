//
//  StoreData.swift
//  To do list
//
//  Created by Shahad Al-deewan on 2023-08-01.
//

import SwiftUI

class StoreData: ObservableObject {
    @Published var todos: [ToDoList] = []
    init() {
        loadToDoList()
    }
    func addToDoList(_todos:ToDoList) {
        
    }
    func deleteToDoList(at indexSet: IndexSet){
        
    }
    func loadToDoList() {
        todos = ToDoList.sampleData
    
        func saveToDoList() {
            print("Save ToDoList to file system")
        }
        
    }
}
