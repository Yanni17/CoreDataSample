//
//  CoursesListView.swift
//  CoreDataSample
//
//  Created by Syntax on 15.08.24.
//

import SwiftUI

struct CoursesListView: View {
    
    @ObservedObject var viewModel: SharedViewModel
    @State var presentingAddCourse = false
    
    var body: some View {
        NavigationStack {
            List(viewModel.courses, id: \.self) { course in
                HStack {
                    Text(course.name ?? "")
                    Spacer()
                    if let studentsCount = course.students?.count {
                        Text("\(studentsCount)").foregroundStyle(.gray)
                    }
                }
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
    CoursesListView(viewModel: .init())
}
