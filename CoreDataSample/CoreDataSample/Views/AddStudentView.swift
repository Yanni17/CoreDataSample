//
//  AddStudentView.swift
//  CoreDataSample
//
//  Created by Ioannis Pechlivanis on 14.08.24.
//

import SwiftUI

struct AddStudentView: View {
    
    @State private var name = ""
    @State private var course: Course?
    
    @ObservedObject var viewModel : SharedViewModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack{
            Form{
                Section("Personal Information"){
                    TextField("Name", text: $name)
                        .autocorrectionDisabled()
                }
                Button{
                    viewModel.saveStudent(name: name)
                    dismiss()
                }label: {
                    Text("Save")
                }
            }
            .navigationTitle("Add Student")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction){
                    Button{
                        dismiss()
                    }label: {
                        Text("Cancel")
                    }
                }
            }
        }
    }
}

#Preview {
    AddStudentView(viewModel: SharedViewModel())
}
