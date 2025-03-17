//
//  LibraryDetailView.swift
//  LibraryApp
//
//  Created by Insaram Alam Siddique on 29/10/2024.
//

import SwiftUI

struct LibraryDetailView: View {
    
    @State private var search : String = ""
    
    var body: some View {
        NavigationStack{
            VStack(){
                PageHeader()
                VStack{
                    PageSearch(search: $search)
                    CategoryListBar()
                    BooksListView()
                    
                    
                    Spacer()
                }
                .padding()
                .background(Color.background)
            }.ignoresSafeArea()
                .navigationBarHidden(true)
        }
    }
}

private struct PageSearch : View {
    
    @Binding var search : String
    
    var body: some View {
            TextField("", text: $search, prompt:
                        Text("Search Book")
                .foregroundStyle(Color.gray)
            )
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .foregroundColor(.white)
            .keyboardType(.default)
            .padding()
            .background(.white)
            .cornerRadius(12)
            .shadow(radius: 3, x:0, y:1)
    }
}

private struct PageHeader :View {
    var body: some View {
        ZStack{
            Image("dummyImage")
                .resizable()
                .frame(maxWidth: .infinity)
                .frame(height: 250)
                .opacity(0.7)
            CustomHeaderView(title:"Some Page", cgb: true, rightIcon: "cart", backgroundColor: .clear)
                .padding(.bottom,100)
        }
    }
}

#Preview {
    LibraryDetailView()
}
