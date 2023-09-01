//import SwiftUI

import SwiftUI

enum Modaltypes: Identifiable, View {
    case now
    case update(toDoList)
    
    var id: String {
        switch self {
        case .now:
            return "now"
        case .update:
            return "update"
        }
    }
    
    var body: some View {
        switch self {
        case .now:
            
            return Text("Now View")
        case .update(let toDoList):
             
            return Text("Update View: \(toDoList.name)")
        }
    }
}

struct toDoList {
    var id: Int
    var name: String
    var completed: Bool
}
