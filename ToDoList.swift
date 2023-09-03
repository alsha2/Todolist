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
