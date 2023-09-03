import SwiftUI
import Firebase
import FirebaseFirestore

struct ContentView1: View {
  @EnvironmentObject var storeData: StoreData
  @State private var newTaskName = ""
  
  var body: some View {
      NavigationView {
          List() {
              ForEach(storeData.todos) { todolist in
                  NavigationLink(destination: Text("ToDo Detail View")) {
                      Text(todolist.name)
                          .font(.title)
                          .strikethrough(todolist.completed)
                          .foregroundColor(todolist.completed ? .orange : Color(.label))
                  }
              }
          }
          .listStyle(InsetGroupedListStyle())
          .toolbar {
              ToolbarItem(content: {
                  Text("The Notes App")
                      .foregroundColor(.pink)
                      .font(.largeTitle)
              })
              
              ToolbarItem(placement: .navigationBarTrailing, content: {
                  Button(action: {
                       isPresentingAddTaskView.toggle()
                  }) {
                      Image(systemName: "plus.circle.fill")
                  }
              })
          }
          Button("Crash") {
            fatalError("Crash was triggered")
          }
          
      }
      .sheet(isPresented: $isPresentingAddTaskView) {
          NavigationView {
              VStack {
                   TextField("Enter Task Name", text: $newTaskName)
                      .textFieldStyle(RoundedBorderTextFieldStyle())
                      .padding()
                  
                  Button("Add Task") {
                      let newTask = ToDoList(name: newTaskName)
                      
                       let db = Firestore.firestore()
                      
                       let tasksRef = db.collection("tasks")
                      
                       tasksRef.addDocument(data: [
                          "name": newTask.name,
                          "completed": newTask.completed
                      ]) { error in
                          if let error = error {
                              print("Error adding document: \(error)")
                          } else {
                              print("Document added successfully")
                              
                               storeData.addTask(newTask)
                              
                               newTaskName = ""
                              
                               isPresentingAddTaskView = false
                          }
                      }
                  }
                  .padding()
              }
              .navigationBarTitle("Add Task", displayMode: .inline)
              .navigationBarItems(trailing:
                  Button("Cancel") {
                      isPresentingAddTaskView = false
                  }
              )
          }
      }
  }
  
  @State private var isPresentingAddTaskView = false
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
      ContentView().environmentObject(StoreData())
  }
}

