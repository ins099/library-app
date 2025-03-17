//
//  MainTabView.swift
//  LibraryApp
//
//  Created by Insaram Alam Siddique on 24/10/2024.
//
import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeTab()
            .tabItem {
                Image(systemName: "house.fill")
                Text("Explore")
            }
            
            Favourite()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favorites")
                }
            
            MyBooks()
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("My Books")
                }
            
            Notifications()
                .tabItem {
                    Image(systemName: "bell.fill")
                    Text("Notifications")
                }
            
            Text("More")
                .tabItem {
                    Image(systemName: "ellipsis")
                    Text("More")
                }
        }
    }
}

#Preview {
    MainTabView()
}
