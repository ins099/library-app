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
                    HomeCategoryView()
                    LibraryListView()
                    BookShopListView()}
                    
                }
                .padding(.top)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    HomeTab()
}
