//
//  LibraryListView.swift
//  LibraryApp
//
//  Created by Insaram Alam Siddique on 24/10/2024.
//
import SwiftUI

struct LibraryListView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Libraries near you")
                    .font(.headline)
                Spacer()
                NavigationLink(destination: LibraryView(), label: {
                    Text("View all")
                        .foregroundColor(.gray)
                })
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    LibraryCardView(name: "King Fahad National", location: "New York, USA", distance: "30 Min – 4 KM", rating: 4.5)
                    LibraryCardView(name: "King Abdulaziz Center", location: "New York, USA", distance: "30 Min – 4 KM", rating: 4.5)
                }
                .padding(.bottom,20)
            }
        }
        .padding(.top, 10)
    }
}

struct LibraryCardView: View {
    let name: String
    let location: String
    let distance: String
    let rating: Double

    var body: some View {
        NavigationLink(destination: LibraryDetailView(), label:{
            ZStack(){
                VStack() {
                    // Replace with your actual image
                    Color.clear
                        .overlay (
                            Image("dummyImage")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        )
                    
                    
                    VStack(alignment: .leading, spacing: 5){
                        Text(name)
                            .font(.headline)
                        
                        Text(location)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Text(distance)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                    }
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .padding(.horizontal,16)
                    .padding(.top,25)
                }// Adjust card width)
                
                
                HStack (alignment:.center, spacing: 2){
                    Image(systemName:"star.fill")
                        .resizable()
                        .frame(width: 10,height: 10)
                        .foregroundStyle(Color.yellow)
                    Text("\(rating, specifier: "%.1f")")
                        .font(.caption)
                }
                .padding(4)
                .background(Color.white)
                .cornerRadius(50)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .padding([.trailing,.top],10)
                .shadow(radius: 3)
                
                VStack{
                    Image(systemName: "heart.fill")
                        .foregroundStyle(Color.primaryPurple)
                        .frame(width: 10, height: 10)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                .padding(.trailing,25)
                .padding(.bottom,10)
                
            }
            .padding(.bottom)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 5)
            .frame(width: 200, height: 220)
        })
    }
}

#Preview(body: {
    LibraryListView()
})
