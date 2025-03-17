//
//  BookRequestView.swift
//  LibraryApp
//
//  Created by Insaram Alam Siddique on 30/10/2024.
//

import SwiftUI

struct MembershipDetails: Identifiable, Hashable {
    let id: String;
    let label: String;
    let image: String;
    let price: String;
    let timeLine : String;
}

struct BuyMembership: View {
    var body: some View {
        ZStack{
            VStack{
                ImageBackgroundHeader(title: "Membership",cgb:true)
                VStack{
                    Text("Select Membership")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(spacing: 15){
                        MembershipCard(membership: MembershipDetails(id:"1", label:"Basic Membership", image:"paperplane",price: "30", timeLine: "01 Years"), isSelected: false)
                        MembershipCard(membership: MembershipDetails(id:"1", label:"Basic Membership", image:"airplane",price: "30", timeLine: "01 Years"), isSelected: true)
                        MembershipCard(membership: MembershipDetails(id:"1", label:"Basic Membership", image:"rocket",price: "30", timeLine: "01 Years"), isSelected: false)
                    }.padding(.vertical)
                    
                    
                    NavigationLink(destination:SelectPayment(), label: {
                        CustomButton(title: "Buy", disabled: true, onPress: {})
                    })
                        .padding(.top,20)
                }
                .padding()
                
                Spacer()

            }
        }.ignoresSafeArea()
        
    }
}

struct MembershipCard :View {
    
    var membership : MembershipDetails
    @State var isSelected : Bool = false
    
    
    var body: some View{
        ZStack{
            ZStack{
                VStack(alignment:.leading, spacing: 10){
                    Text(membership.label)
                        .font(.title2)
                    Text(membership.timeLine)
                        .font(.headline)
                        .foregroundStyle(.lightgray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("$\(membership.price)")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.primaryPurple)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            }
            .padding()
            Image(membership.image)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .padding(.bottom,50)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(.white)
                .stroke(isSelected ? Color.primaryPurple : Color.clear, lineWidth: 1.5)
                .shadow(radius: 3, x: 1, y: 1)
        )
        
    }
}

#Preview {
    BuyMembership()
}
