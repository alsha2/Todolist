import SwiftUI
import Combine

class StoreData: ObservableObject {
    @Published var todos: [ToDoList] = []

    init() {
        loadToDoList()
    }

    func addTask(_ task: ToDoList) {
        todos.append(task)
        saveToDoList()
    }

    func updateToDoList(_ toDoList: ToDoList) {
        if let index = todos.firstIndex(where: { $0.id == toDoList.id }) {
            todos[index] = toDoList
            saveToDoList()
        }
    }

    func deleteToDoList(at indexSet: IndexSet) {
        todos.remove(atOffsets: indexSet)
        saveToDoList()
    }

    private func loadToDoList() {
         todos = ToDoList.sampleData
    }

    private func saveToDoList() {
         print("Save ToDoList to file system")
    }
}
