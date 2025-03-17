//
//  BookRequestView.swift
//  LibraryApp
//
//  Created by Insaram Alam Siddique on 30/10/2024.
//

import SwiftUI

var book = BookCardInfo(id: "4", title: "People and Business", author: "Insaram Alam", extraDetail: "String", CatTags: ["Business", "Ideas"], rating: 3.0, price: "23.00", image: "bookcover")
var library =  LibraryCard(id:1, placeName: "Place 1", city: "Riydah", country: "Saudia Arabia", duration: "15min", distance: "10km", reviews:"4.5", noOfReviews: "123", price: "$30", isFav: false)


struct BookRequestView: View {
    var body: some View {
        ZStack{
            VStack{
                ImageBackgroundHeader(title: "Book Request",cgb:true)
                VStack{
                    Text("Book Details")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    BookCardView(book: book)
                    Text("Library  Details")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        ListItem(item: library, isLibrary: true)
                    NavigationLink(destination:BuyMembership(), label: {
                        CustomButton(title: "Buy Membership", disabled: true, onPress: {})
                    })
                        .padding(.top,20)
                }
                .padding()
                
                Spacer()

            }
        }.ignoresSafeArea()
        
    }
}

#Preview {
    BookRequestView()
}
