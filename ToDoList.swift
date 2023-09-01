//
//  ToDo.swift
//  To do list
//
//  Created by Shahad Al-deewan on 2023-08-01.
//

import SwiftUI

struct ToDoList: Identifiable,Codable {
    var id: String = UUID().uuidString
    var name:String
    var completed: Bool = false
    
    static var sampleData: [ToDoList] {
    [
        ToDoList(name:"Go to school"),
        ToDoList(name:"Go Code",completed:true)
    ]
    }
    
}
