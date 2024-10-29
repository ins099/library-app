//
//  HomeTab.swift
//  LibraryApp
//
//  Created by Insaram Alam Siddique on 25/10/2024.
//

import SwiftUI

struct HomeTab: View {
    var body: some View {
        NavigationStack {
            VStack {
                HomeHeader(title : "Explore", rightIcon: "cart")
                VStack{
                    ScrollView{
                        Spacer()
                        CategoryListBar()
                        LibraryListView()
                        BookShopListView()
                    }
                    
                }
                .padding(.top)
                .padding([.leading, .trailing], 20)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    HomeTab()
}
