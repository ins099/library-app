//
//  ReviewList.swift
//  LibraryApp
//
//  Created by Insaram Alam Siddique on 29/10/2024.
//

import SwiftUI

struct ReviewList: View {
    var body: some View {
        VStack{
            HStack{
                Text("Reviews")
                    .font(.title3)
                    .fontWeight(.semibold)
                Spacer()
                Text("(123)")
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            Review()
            Review()
            Review()
            Review()
        }
    }
    
}

struct Review : View {
    var body: some View{
        VStack{
            HStack{
                HStack{
                    Image("demoUser")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .scaledToFit()
                        .cornerRadius(100)
                    VStack(alignment: .leading,spacing:10){
                        Text("Jessica Jones")
                            .fontWeight(.semibold)
                            .font(.title3)
                        HStack{
                            StarRatingView(rating: 4.5)
                            Text("(4.5)")
                                .foregroundStyle(.gray)
                                .font(.caption)
                        }
                    }.frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Spacer()
                VStack{
                    Text("1 day ago")
                        .foregroundStyle(.gray)
                        .padding(.bottom,30)
                }
                
            }.frame(height: 130)
            
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy .")
                .foregroundStyle(.gray)
                .lineSpacing(7)
            
            Divider()
        }
    }
}

#Preview {
    ReviewList()
}
