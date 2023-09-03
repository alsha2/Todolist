import SwiftUI

class ToDoListFormeVM: ObservableObject {
    @Published var name: String = ""
    @Published var completed: Bool = false
    var id: String?
    
    var updating: Bool {
        id = nil
        return completed
    }
    
    var isDisabled: Bool {
        name.isEmpty
    }
    
    init() {}
    
    init(_currentToDoList: ToDoList){
        self.name = _currentToDoList.name
        self.completed = _currentToDoList.completed
    }
}

struct ToDoListForme: View {
    @EnvironmentObject var storeData: StoreData
    @ObservedObject var formVM: ToDoListFormeVM
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                VStack(alignment: .leading) {
                    TextField("ToDoList", text: $formVM.name)
                    Toggle("Completed", isOn: $formVM.completed)
                }
            }
            .navigationTitle("ToDoList")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    func updateToDoList(){
        presentationMode.wrappedValue.dismiss()
    }

    func addToDolist() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct ToDoListForme_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListForme(formVM: ToDoListFormeVM())
            .environmentObject(StoreData())
    }
}
