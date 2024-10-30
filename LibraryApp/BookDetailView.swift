//
//  BookDetailView.swift
//  LibraryApp
//
//  Created by Insaram Alam Siddique on 29/10/2024.
//

import SwiftUI

struct BookDetailView: View {
    var body: some View {
        ZStack{
            VStack{
                PageHeader()
                ScrollView(showsIndicators:false){
                    BookInfoBox()
                    BookStats()
                    BookStoreInfo()
                    BookDescription()
                    ReviewList()
                }.padding()
            }
            
            CustomButton(title: "Add to cart", onPress: {})
                .padding()
                .frame(maxHeight: .infinity, alignment: .bottom)
        }.ignoresSafeArea()
        
    }
}

private struct BookDescription : View {
    var body: some View{
        VStack(alignment: .leading, spacing: 15){
            Text("Book Description")
                .fontWeight(.bold)
                .font(.title2)
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
                .foregroundStyle(.gray)
            
        }.frame(maxWidth:.infinity, alignment: .leading)
            .padding(10)
    }
}

struct BookStoreInfo : View {
    var body: some View{
        VStack(spacing:5){
            Text("Jarir BookStore")
                .multilineTextAlignment(.leading)
                .font(.title2)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack{
                Image(systemName: "location")
                Text("Jeddah, Saudia Arabia")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(.lightgray)
            HStack(alignment: .bottom, spacing: 3) {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
                Text("5.0")
                Text(" (123 Reviews)")
                    .font(.footnote)
                    .foregroundStyle(.lightgray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal,10)
        .padding(.vertical,10)
        .frame(maxWidth: .infinity, alignment: .leading)
//        .frame(height: 120,alignment: .topLeading)
        Divider()
    }
}

struct BookStats: View {
    var body: some View {
        VStack{
            Divider()
            HStack(){
                VStack( spacing: 10){
                    Text("140")
                        .font(.title)
                        .fontWeight(.semibold)
                    Text("Total Requests")
                        .foregroundStyle(.lightgray)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                Divider()
                    .frame(height: 90)
                VStack(spacing: 10){
                    Text("$ 45.0")
                        .font(.title)
                        .fontWeight(.semibold)
                    Text("Price")
                        .foregroundStyle(.lightgray)
                }
                .frame(maxWidth: .infinity)
                Divider()
                    .frame(height: 90)
                VStack(spacing: 10){
                    Text("Available")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundStyle(.green)
                        .padding(5)
                        .background(Color.green.opacity(0.2))
                        .cornerRadius(13)
                    Text("Status")
                        .foregroundStyle(.lightgray)
                }
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 120)
        }
        Divider()
    }
}

private struct BookInfoBox :View {
    var body: some View{
        VStack(alignment: .leading){
            HStack{
                Text("Book Title")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                Spacer()
                Text("On Membership")
                    .font(.caption)
                    .foregroundStyle(.primaryPurple)
                    .padding(7)
                    .background(.lightPurple)
                    .cornerRadius(10)
            }
            Text("by Dr. Wallace")
                .font(.headline)
                .foregroundStyle(.lightgray)
            
            HStack{
                ForEach(0...2, id: \.self) { item in
                    BookCatTag()
               }
            }
        }
    }
}

private struct PageHeader :View {
    var body: some View {
        VStack{
            ZStack{
                Image("headback")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 130)
                CustomHeaderView(title:"", cgb: true, rightIcon: "cart", backgroundColor: .clear)
                    .padding(.top,50)
                Image("bookcover")
                    .resizable()
                    .frame(width: 180, height: 240)
                    .padding(.top,270)
            }.frame(height: 120)
        }
        .frame(height: 300, alignment: .top)
    }
}

#Preview {
    BookDetailView()
}
