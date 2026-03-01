//
//  AddView.swift
//  TodoList
//
//  Created by Badruddin Tasnim on 5/2/26.
//

internal import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var task: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Enter your task", text: $task)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("TextFieldBG"))
                    .cornerRadius(16)
                    
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Save".uppercased())
                }
                .padding()
                .frame(maxWidth: .infinity)
                .font(.headline)
                .background(Color.blue)
                .foregroundStyle(Color.white)
                .cornerRadius(16)
//                .disabled(task.count<3)

            }
            .padding(12)
        }
        .navigationTitle("Add New Task 🖋️")
        .alert(alertTitle, isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        }
    }
    
    func saveButtonPressed(){
        if isTextOk(){
            listViewModel.addItem(title: task)
            dismiss()
        } else {
            alertTitle = "Your task must be at least 3 characters long."
            showAlert = true
        }
    }
    
    func isTextOk() -> Bool{
        if task.count<3 {
            return false
        }
        
        return true
    }
    
}

#Preview {
        NavigationStack {
            AddView()
        }
        .environmentObject(ListViewModel())
}
