//
//  ContentView.swift
//  CoreDataSample
//
//  Created by Ioannis Pechlivanis on 13.08.24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = SharedViewModel()
    
    var body: some View {
        TabView {
            StudentListView(viewModel: viewModel)
                .tabItem {
                    Label(
                        title: { Text("Students") },
                        icon: { Image(systemName: "studentdesk") }
                    )
                }
            CoursesListView(viewModel: viewModel)
                .tabItem {
                    Label(
                        title: { Text("Courses") },
                        icon: { Image(systemName: "book.closed.fill") }
                    )
                }
        }
    }
}

#Preview {
    ContentView()
}
