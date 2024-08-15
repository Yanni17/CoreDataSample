//
//  CoursesListView.swift
//  CoreDataSample
//
//  Created by Syntax on 15.08.24.
//

import SwiftUI

struct CoursesListView: View {
    let courses: [String] = ["Math", "English", "Spanish"]
    
    var body: some View {
        NavigationStack {
            List(courses, id: \.self) { course in
                Text(course)
            }
            .navigationTitle("Courses")
        }
    }
}

#Preview {
    CoursesListView()
}
