//
//  CourseViewModel.swift
//  CoreDataSample
//
//  Created by Syntax on 15.08.24.
//

import Foundation

class CourseViewModel: ObservableObject {
    
    @Published var courses: [Course] = []
    
    func save(course name: String) {
        let course = Course(context: container.context)
        course.id = UUID()
        course.name = name
        
        saveAndFetch()
    }
    
    func fetchCourses() {
        let request = Course.fetchRequest()
        do {
            courses = try container.context.fetch(request)
        } catch {
            print("error fetching: \(error)")
        }
    }
    
    private func saveAndFetch() {
        container.save()
        fetchCourses()
    }
    
    private let container = PersistentStore.shared
}
