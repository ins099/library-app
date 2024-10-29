//
//  BooksListView.swift
//  LibraryApp
//
//  Created by Insaram Alam Siddique on 29/10/2024.
//

import SwiftUI

struct BookCardInfo: Identifiable {
    var id: String
    var title: String;
    var author: String;
    var extraDetail: String;
    var CatTags: [String];
    var rating: Double;
    var price: String;
    var image: String
}

private var BookList : [BookCardInfo] =
    [
        BookCardInfo(id: "1", title: "People and Business", author: "Insaram Alam", extraDetail: "String", CatTags: ["Business", "Ideas"], rating: 3.0, price: "23.00", image: "bookcover"),
        BookCardInfo(id: "2", title: "People and Business", author: "Insaram Alam", extraDetail: "String", CatTags: ["Business", "Ideas"], rating: 3.0, price: "23.00", image: "bookcover"),
        BookCardInfo(id: "3", title: "People and Business", author: "Insaram Alam", extraDetail: "String", CatTags: ["Business", "Ideas"], rating: 3.0, price: "23.00", image: "bookcover"),
        BookCardInfo(id: "4", title: "People and Business", author: "Insaram Alam", extraDetail: "String", CatTags: ["Business", "Ideas"], rating: 3.0, price: "23.00", image: "bookcover"),
    ]

struct BooksListView: View {
    var body: some View {
        VStack(alignment: .leading) {
        HStack {
            Text("Books")
                .font(.headline)
            Spacer()
            NavigationLink(destination: BooksView(), label: {
                Text("View all")
                    .foregroundColor(.gray)
            })
        }
        
            ScrollView(showsIndicators:false) {
                ForEach(BookList) { book in
                    BookCardView(book: book)
                }
        }
        
    }
    .padding(.top, 10)
    }
}

private struct BookCardView : View {
    
    var book: BookCardInfo;
    
    var body: some View {
        ZStack{
            HStack(alignment: .center){
                Image(book.image)
                    .resizable()
                    .frame(width: 100, height: 140)
                VStack(alignment: .leading, spacing: 7){
                    Text(book.title)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(book.extraDetail)
                        .font(.body)
                        .fontWeight(.thin)
                        .foregroundStyle(.darkgray)
                    Text("by \(book.author)")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundStyle(.darkgray)
                    HStack{
                        ForEach(book.CatTags, id: \.self) { item in
                            BookCatTag()     // Optional: add padding around each text
                       }
                    }
                    StarRatingView(rating: 3)
                }
                .padding(5)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
            Text("$ \(book.price)")
                .foregroundStyle(.primaryPurple)
                .font(.headline)
                .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 180)
        .background(Color.white)
        .cornerRadius(12)
        .padding(3)
        .shadow(radius: 2, x:0, y:1)
    }
}

private struct BookCatTag: View {
    var body : some View {
        Text("Category")
            .font(.caption2)
            .padding(4)
            .background(.lightPurple)
            .cornerRadius(6)
            .foregroundColor(.primaryPurple)
    }
}

#Preview {
    BooksListView()
        .padding()
}
