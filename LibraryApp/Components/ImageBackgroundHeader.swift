//
//  ImageBackgroundHeader.swift
//  LibraryApp
//
//  Created by Insaram Alam Siddique on 30/10/2024.
//

import SwiftUI

struct ImageBackgroundHeader :View {
    
    var title: String = "Title"
    var cgb : Bool = true
    var rightIcon : String = "cart"
    var backgroundColor : Color = .clear
    var onBackAction : ()->() = {}
    var onRightAction: ()->() = {}
    
    
    var body: some View {
        VStack{
            ZStack{
                Image("headback")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 130)
                CustomHeaderView(title:title, cgb: cgb, rightIcon: rightIcon, onBackAction: onBackAction, onRightAction:onRightAction, backgroundColor: backgroundColor)
                    .padding(.top,50)
            }
        }
        .frame(height: 130, alignment: .top)
    }
}

#Preview {
    ImageBackgroundHeader()
}
