//
//  StudentListView.swift
//  CoreDataSample
//
//  Created by Ioannis Pechlivanis on 14.08.24.
//

import SwiftUI

struct StudentListView: View {
    
    @ObservedObject var viewModel: SharedViewModel
    @State private var presentingSheet = false
    
    var body: some View {
        NavigationStack{
            List(viewModel.students){ student in
                Text(student.name ?? "")
            }
            .searchable(text: $viewModel.searchText)
            .navigationTitle("Students")
            .toolbar {
                ToolbarItem {
                    Button{
                        presentingSheet.toggle()
                    }label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $presentingSheet) {
                AddStudentView(viewModel: viewModel)
                    .presentationDetents([.large,.medium])
            }
        }
    }
}

#Preview {
    StudentListView(viewModel: .init())
}
