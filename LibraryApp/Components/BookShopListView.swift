//
//  BookShopListView.swift
//  LibraryApp
//
//  Created by Insaram Alam Siddique on 24/10/2024.
//

import SwiftUI

struct BookShopListView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Book Shop near you")
                    .font(.headline)
                Spacer()
                NavigationLink(destination: BookShopView(), label: {
                    Text("View all")
                        .foregroundColor(.gray)
                })
            }
            .padding([.leading, .trailing], 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    LibraryCardView(name: "Book Shop 1", location: "New York, USA", distance: "30 Min – 4 KM", rating: 4.5)
                    LibraryCardView(name: "Book Shop 2", location: "New York, USA", distance: "30 Min – 4 KM", rating: 4.5)
                }
                .padding(20)
            }
        }
        .padding(.top, 10)
    }
}

#Preview {
    BookShopListView()
}
