//
//  StudentViewModel.swift
//  CoreDataSample
//
//  Created by Ioannis Pechlivanis on 13.08.24.
//

import Foundation
import CoreData

class StudentViewModel: ObservableObject {
    
    
    init(){
        fetchStudents()
    }
    
    
    @Published var students: [Student] = []
    
    @Published var searchText = "" {
        didSet {
            filterStudentsByName()
        }
    }
    
    
    func fetchStudents() {
        
        let request = Student.fetchRequest()
        
        do {
            self.students = try container.context.fetch(request)
        } catch {
            print("error fetching: \(error)")
        }
        
    }
    
    func filterStudentsByName() {
        
        guard !searchText.isEmpty else {
            fetchStudents()
            return
        }
        
        let request = NSFetchRequest<Student>(entityName: "Student")
        request.predicate = NSPredicate(format: "name CONTAINS %@", searchText)
        
        do {
            self.students = try container.context.fetch(request)
        } catch {
            print("error fetching: \(error)")
        }

            
    }
    
    func saveStudent(name: String) {
        
        let student = Student(context: container.context)
        student.id = UUID()
        student.name = name
        
        saveAndFetch()
        
    }
    
    func deleteStudent(student: Student) {
        
        container.context.delete(student)
        
        saveAndFetch()
        
    }
    
    func updateStudent(student: Student, name: String) {
        
        student.name = name
        
        saveAndFetch()
        
    }
    
    private let container = PersistentStore.shared
    
    private func saveAndFetch() {
        
        container.save()
        fetchStudents()
        
    }
    
}
