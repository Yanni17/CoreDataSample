//
//  AddCourseView.swift
//  CoreDataSample
//
//  Created by Syntax on 15.08.24.
//

import SwiftUI

struct AddCourseView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var viewModel: SharedViewModel
    @State var courseName: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name", text: $courseName)
                }
                Section {
                    Button("Save", action: save)
                        .disabled(courseName.isEmpty)
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add course")
        }
    }
    
    private func save() {
        viewModel.save(course: courseName)
        dismiss()
    }
}

#Preview {
    AddCourseView(viewModel: SharedViewModel())
}
