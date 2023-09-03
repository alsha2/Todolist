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
   self.completed = currentToDoList.completed
        self.id = currentToDoList.id
    }
}

           
            
                
            
