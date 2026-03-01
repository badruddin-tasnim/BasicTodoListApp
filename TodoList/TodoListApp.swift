//
//  TodoListApp.swift
//  TodoList
//
//  Created by Badruddin Tasnim on 5/2/26.
//

internal import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}

