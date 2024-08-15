//
//  ContentView.swift
//  CoreDataSample
//
//  Created by Ioannis Pechlivanis on 13.08.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            StudentListView()
                .tabItem {
                    Label(
                        title: { Text("Students") },
                        icon: { Image(systemName: "studentdesk") }
                    )
                }
            CoursesListView()
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
