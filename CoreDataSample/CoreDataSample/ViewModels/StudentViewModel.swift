//
//  StudentViewModel.swift
//  CoreDataSample
//
//  Created by Ioannis Pechlivanis on 13.08.24.
//

import Foundation
import CoreData

class StudentViewModel : ObservableObject {
    
    
    @Published var students : [Student] = []
    
    
    init(){
        fetchStudents()
    }
    
    
    func fetchStudents() {
        
        let request = Student.fetchRequest()
        
        do{
            self.students = try container.context.fetch(request)
        }catch {
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
