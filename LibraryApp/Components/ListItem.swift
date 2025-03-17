//
//  ListItem.swift
//  LibraryApp
//
//  Created by Insaram Alam Siddique on 29/10/2024.
//

import SwiftUI

struct ListItem: View {
    var item: LibraryCard
    
    var isLibrary: Bool = false
    
    var body: some View {
        ZStack {
            VStack(alignment: .trailing) {
                // Use conditional to set heart icon
                Image(systemName: item.isFav ? "heart.fill" : "heart")
                    .foregroundColor(.primaryPurple) // Change color based on favorite status
                Spacer()
                if isLibrary {
                    Text("On Membership")
                        .font(.caption2) // Adjust font size as needed
                        .padding(5) // Add padding around the text
                        .background(Color.lightPurple)
                        .cornerRadius(15)
                } else {
                    Text("$ \(item.price)")
                        .font(.body)
                        .fontWeight(.semibold)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .foregroundStyle(Color.primaryPurple)

            HStack(alignment: .center, spacing: 10) {
                Image("dummyImage")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(12)
                VStack(spacing: 8) {
                    Text(item.placeName)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack {
                        Image(systemName: "location")
                        Text("\(item.city), \(item.country)")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    Text("\(item.duration) - \(item.distance)")
                        .foregroundStyle(.lightgray)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    HStack(alignment: .bottom, spacing: 1) {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                        Text("\(item.reviews)")

                        Text(" (\(item.noOfReviews) Reviews)")
                            .font(.footnote)
                            .foregroundStyle(.lightgray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 140)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 1, x: 0, y: 1)
    }
}

#Preview {
    ListItem(item:LibraryCard(id: 1, placeName: "Place 1", city: "Riydah", country: "Saudia Arabia", duration: "15min", distance: "10km", reviews: "4.5", noOfReviews: "123", price: "30", isFav: true), isLibrary: true).padding()
}
