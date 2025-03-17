//
//  HomeTab.swift
//  LibraryApp
//
//  Created by Insaram Alam Siddique on 25/10/2024.
//

import SwiftUI

let categories:[Category] = [
    Category(title: "Fantasy", image: "romance"),
    Category(title: "Art", image: "art"),
    Category(title: "History", image: "fantasy"),
    Category(title: "Romance", image: "fantasy"),
    Category(title: "Drama", image: "fantasy"),
    Category(title: "Science", image: "fantasy"),
    Category(title: "Fantasy", image: "fantasy"),
    Category(title: "Fantasy", image: "fantasy"),
]

struct Categories: View {
    
    let columns: [GridItem] = [
        GridItem(.fixed(150)), GridItem(.fixed(150))
    ]
    
    
    var body: some View {
        NavigationView {
            VStack {
                HomeHeader(title : "Categories", rightIcon: "cart")
                ScrollView(){
                    LazyVGrid(columns: columns, spacing: 20){
                        ForEach(categories,id: \.self){category in
                            CategoryItem(image: category.image, text: category.title)
                        }
                    }
                    .padding(.top,10)
                }
                .padding(.top,60)
            }
            
        }.navigationBarHidden(true)
    }
}

struct CategoryItem : View {
    
    var image: String
    var text: String
    
    var body: some View {
        VStack{
            Image(image)
                .resizable()
                .frame(width: 60,height: 60)
            Text(text)
                .font(.title3)
                .foregroundStyle(Color.gray)
        }
        .frame(width: 110,height: 110)
        .padding()
        .background(.white)
        .cornerRadius(12, corners: .allCorners)
        .shadow(radius: 2, x: 0, y: 0)
        
    }
}

#Preview {
    Categories()
}
