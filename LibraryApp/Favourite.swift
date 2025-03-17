//
//  HeaderView.swift
//  LibraryApp
//
//  Created by Insaram Alam Siddique on 30/10/2024.
//


import SwiftUI

private let Libraries: [LibraryCard] = [
        LibraryCard(id:1, placeName: "Place 1", city: "Riydah", country: "Saudia Arabia", duration: "15min", distance: "10km", reviews:"4.5", noOfReviews: "123", price: "$30", isFav: false),
        LibraryCard(id: 1, placeName: "Place 1", city: "Riyadh", country: "Saudi Arabia", duration: "15min", distance: "10km", reviews: "4.5", noOfReviews: "123", price: "$30", isFav: false),
        LibraryCard(id: 2, placeName: "Place 2", city: "Jeddah", country: "Saudi Arabia", duration: "30min", distance: "15km", reviews: "4.0", noOfReviews: "98", price: "$25", isFav: true),
    ]
private let BookShops: [LibraryCard] = [
        LibraryCard(id:1, placeName: "Place 1", city: "Riydah", country: "Saudia Arabia", duration: "15min", distance: "10km", reviews:"4.5", noOfReviews: "123", price: "$30", isFav: false),
        LibraryCard(id: 1, placeName: "Place 1", city: "Riyadh", country: "Saudi Arabia", duration: "15min", distance: "10km", reviews: "4.5", noOfReviews: "123", price: "$30", isFav: false),
        LibraryCard(id: 2, placeName: "Place 2", city: "Jeddah", country: "Saudi Arabia", duration: "30min", distance: "15km", reviews: "4.0", noOfReviews: "98", price: "$25", isFav: true),
        LibraryCard(id: 3, placeName: "Place 3", city: "Mecca", country: "Saudi Arabia", duration: "20min", distance: "5km", reviews: "4.8", noOfReviews: "200", price: "$40", isFav: false),
]

struct Favourite: View {
    @State private var selectedTab: String = "tab-1"
    
    let columns: [GridItem] = [
        GridItem(.flexible())
    ]

    
    var body: some View {
        ZStack{
            VStack{
                FavPageHeader(selectedTab: $selectedTab)
                ScrollView(){
                    LazyVGrid(columns: columns, spacing: 10){
                        if(selectedTab == "tab-1"){
                            ForEach(Libraries,id: \.self){library in
                                ListItem(item: library, isLibrary: true)
                            }
                        } else{
                            ForEach(BookShops,id: \.self){book in
                                ListItem(item: book, isLibrary: true)
                        }
                    }
                }
                .padding()
                }
            }
        }.ignoresSafeArea()
    }
}

struct FavPageHeader: View {
    @Binding var selectedTab: String
    var body: some View {
        VStack{
            ZStack{
                Image("headback")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 170)
                CustomHeaderView(title:"Favourite",rightIcon: "cart",backgroundColor: .clear)
                    .padding(.top,10)
                HStack {
                    TabButton(title: "Library", isSelected: selectedTab == "tab-1") {
                        withAnimation(.easeOut){
                            selectedTab = "tab-1"
                        }
                        // Add action for when Tab 1 is selected
                    }
                    
                    TabButton(title: "Book Store", isSelected: selectedTab == "tab-2") {
                        withAnimation(.easeIn){
                            selectedTab = "tab-2"
                        }
                        // Add action for when Tab 2 is selected
                    }
                }
                .frame(height: 40)
                .padding(.horizontal)
                .background(Color.clear) // Transparent background
                .padding(.top,112)
            }
        }
        .frame(height: 160, alignment: .top)
    }
}

struct TabButton: View {
    let title: String
    let isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                Text(title)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity) // Make the button full width
                    .frame(height: 40, alignment:.center)
                
                if isSelected {
                    Rectangle()
                        .fill(Color.white)
                        .frame(height: 4) // Bottom line for selected tab
                        .padding(.top, 5)
                } else {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 4) // Placeholder for spacing
                }
            }
        }
        .frame(maxWidth: .infinity) // Equal width for tabs
        .contentShape(Rectangle()) // Make the entire area tappable
    }
}


struct Favourite_Previews: PreviewProvider {
    static var previews: some View {
        Favourite()
    }
}
