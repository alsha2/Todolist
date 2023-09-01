//
//  ViewFile.swift
//  To do list
//
//  Created by Shahad Al-deewan on 2023-08-30.
//

import SwiftUI

class ViewFile: ObservableObject {
    @Published var name: String = ""
    @Published var completed: Bool = false
    var id: String?
    
    var updating: Bool {
        id = nil
        return completed
    }
    var isdisabeled: Bool {
        name.isEmpty
    }
    
    init() {}
    
    init(currentToDoList: ToDoList) {
        self.name = currentToDoList.name
        self.completed = currentToDoList.completed
        self.id = currentToDoList.id
    }
}

           
            
                
            
