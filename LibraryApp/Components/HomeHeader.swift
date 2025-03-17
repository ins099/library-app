//
//  HomeHeader.swift
//  LibraryApp
//
//  Created by Insaram Alam Siddique on 25/10/2024.
//

import SwiftUI

struct HomeHeader: View {
    
    @State var search: String = ""
    var title: String = "Demo Header"
    var cgb: Bool = true
    var rightIcon: String? = "cart" // SF Symbol name for the icon
    var rightText: String?
    var onBackAction: (() -> Void)?
    var onRightAction: (() -> Void)?
    var backgroundColor: Color = .clear
    
    var body: some View {
        VStack (alignment: .leading){
            ZStack{
                Image("headback")
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0) // 👈 This will keep other views (like a large text) in the frame
                    .edgesIgnoringSafeArea(.all)
                    .frame(height: 120)
                VStack{
                    CustomHeaderView(title: title, cgb: cgb, rightIcon: rightIcon, rightText: rightText, onBackAction: onBackAction, onRightAction: onRightAction, backgroundColor:backgroundColor)
                        .padding(.top,10)
                    Spacer()
                }
            }
                VStack{
                    TextField("", text: $search, prompt:
                                Text("Search Here")
                        .foregroundStyle(Color.gray)
                    )
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .foregroundColor(.white)
                    .keyboardType(.default)
                    .padding()
                    .background(.white)
//                    .cornerRadius(12)
                }
                .cornerRadius(12)
                .frame(maxWidth: .infinity, alignment: .center)
                .background(.clear)
                .position(x: UIScreen.main.bounds.width/2.12, y: -14)
                .padding(.horizontal)
                .shadow(radius: 3)
        }
        .frame(height: 100)
    }
}

#Preview {
    @Previewable @State var searchText : String = ""
    HomeHeader()
}
