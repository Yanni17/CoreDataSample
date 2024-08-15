//
//  CoursesListView.swift
//  CoreDataSample
//
//  Created by Syntax on 15.08.24.
//

import SwiftUI

struct CoursesListView: View {
    
    @StateObject var viewModel = SharedViewModel()
    @State var presentingAddCourse = false
    
    var body: some View {
        NavigationStack {
            List(viewModel.courses, id: \.self) { course in
                Text(course.name ?? "")
            }
            .navigationTitle("Courses")
            .toolbar {
                Button("Add course", systemImage: "plus") {
                    presentingAddCourse.toggle()
                }
            }
            .sheet(isPresented: $presentingAddCourse) {
                AddCourseView(viewModel: viewModel)
                    .presentationDetents([.medium])
            }
        }
    }
}

#Preview {
    CoursesListView()
}
