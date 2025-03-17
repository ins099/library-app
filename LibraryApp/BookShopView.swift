//
//  HomeTab.swift
//  LibraryApp
//
//  Created by Insaram Alam Siddique on 25/10/2024.
//

import SwiftUI

private let BookShops: [LibraryCard] = [
        LibraryCard(id:1, placeName: "Place 1", city: "Riydah", country: "Saudia Arabia", duration: "15min", distance: "10km", reviews:"4.5", noOfReviews: "123", price: "$30", isFav: false),
        LibraryCard(id: 1, placeName: "Place 1", city: "Riyadh", country: "Saudi Arabia", duration: "15min", distance: "10km", reviews: "4.5", noOfReviews: "123", price: "$30", isFav: false),
        LibraryCard(id: 2, placeName: "Place 2", city: "Jeddah", country: "Saudi Arabia", duration: "30min", distance: "15km", reviews: "4.0", noOfReviews: "98", price: "$25", isFav: true),
        LibraryCard(id: 3, placeName: "Place 3", city: "Mecca", country: "Saudi Arabia", duration: "20min", distance: "5km", reviews: "4.8", noOfReviews: "200", price: "$40", isFav: false),
        LibraryCard(id: 4, placeName: "Place 4", city: "Dammam", country: "Saudi Arabia", duration: "10min", distance: "8km", reviews: "3.9", noOfReviews: "75", price: "$20", isFav: true),
        LibraryCard(id: 5, placeName: "Place 5", city: "Khobar", country: "Saudi Arabia", duration: "25min", distance: "12km", reviews: "4.2", noOfReviews: "150", price: "$35", isFav: false),
        LibraryCard(id: 6, placeName: "Place 6", city: "Dhahran", country: "Saudi Arabia", duration: "18min", distance: "7km", reviews: "4.3", noOfReviews: "80", price: "$28", isFav: true),
        LibraryCard(id: 7, placeName: "Place 7", city: "Medina", country: "Saudi Arabia", duration: "40min", distance: "25km", reviews: "4.6", noOfReviews: "90", price: "$50", isFav: false),
        LibraryCard(id: 8, placeName: "Place 8", city: "Tabuk", country: "Saudi Arabia", duration: "35min", distance: "18km", reviews: "4.1", noOfReviews: "65", price: "$22", isFav: true),
        LibraryCard(id: 9, placeName: "Place 9", city: "Abha", country: "Saudi Arabia", duration: "45min", distance: "30km", reviews: "3.8", noOfReviews: "110", price: "$18", isFav: false),
        LibraryCard(id: 10, placeName: "Place 10", city: "Najran", country: "Saudi Arabia", duration: "50min", distance: "35km", reviews: "4.7", noOfReviews: "130", price: "$33", isFav: true)
    
]


struct BookShopView: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible())
    ]
    
    
    var body: some View {
        NavigationView {
            VStack {
                HomeHeader(title : "Book Shops", rightIcon: "cart")
                ScrollView(){
                    LazyVGrid(columns: columns, spacing: 10){
                        ForEach(BookShops,id: \.self){bookshop in
                            ListItem(item: bookshop, isLibrary: false)
                        }
                    }
                    .padding()
                }
                .padding(.top,10)
            }
            
        }.navigationBarHidden(true)
    }
}

#Preview {
    BookShopView()
}
