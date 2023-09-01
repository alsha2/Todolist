//
//  ToDoListForme.swift
//  To do list
//
//  Created by Shahad Al-deewan on 2023-08-30.
//

import SwiftUI
import Combine

class ToDoListFormeVM: ObservableObject {
    @Published var name: String = ""
    @Published var completed: Bool = false
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
