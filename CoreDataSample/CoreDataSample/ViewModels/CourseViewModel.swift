//
//  CourseViewModel.swift
//  CoreDataSample
//
//  Created by Syntax on 15.08.24.
//

import Foundation

class CourseViewModel: ObservableObject {
    
    @Published var courses = ["Math", "English", "Spanish"]
    
    func save(course: String) {
        
    }
}
