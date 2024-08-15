//
//  AddStudentView.swift
//  CoreDataSample
//
//  Created by Ioannis Pechlivanis on 14.08.24.
//

import SwiftUI

struct AddStudentView: View {
    
    @State private var name = ""
    @State private var selectedCourse: Course?
    @State private var isEditMode: EditMode = .active

    @ObservedObject var viewModel : SharedViewModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack{
            Form{
                Section("Personal Information"){
                    TextField("Name", text: $name)
                        .autocorrectionDisabled()
                    Picker("Courses", selection: $selectedCourse) {
                        ForEach(viewModel.courses) { course in
                            Text(course.name ?? "").tag(course as Course?)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Button{
                    viewModel.saveStudent(name: name, course: selectedCourse)
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
