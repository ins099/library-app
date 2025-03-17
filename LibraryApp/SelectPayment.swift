//
//  SelectPayment.swift
//  LibraryApp
//
//  Created by Insaram Alam Siddique on 30/10/2024.
//

import SwiftUI

struct SelectPayment: View {
    @State var isSelected: Bool = false
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    ImageBackgroundHeader(title: "Select Payment",cgb:true)
                    VStack{
                        Text("Payment Methods")
                            .foregroundStyle(.primaryPurple)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Select payment method")
                            .font(.headline)
                            .foregroundStyle(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(spacing: 15){
                            PaymentCard(isSelected: true, image: Image("mastercard"))
                            PaymentCard(label:"Bank Account", isSelected: false,
                                        image: Image(systemName: "building.columns")
                            )
                        }.padding(.vertical)
                        
                        NavigationLink(destination:CardDetails(), label: {
                            CustomButton(title: "Buy", disabled: true, onPress: {})
                        })
                        .padding(.top,20)
                    }
                    .padding()
                    
                    Spacer()
                    
                }
            }.ignoresSafeArea()
                .navigationBarHidden(true)
        }

    }
}

private struct PaymentCard : View {
    
    var label : String = "Credit or Debit Card"
    var isSelected: Bool
    var image : Image
    
    var body: some View{
        HStack{
            image
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
            Text(label)
                .font(.title3)
            Spacer()
            Image(isSelected ? "active" : "inactive")
            
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 90)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(.white)
//                    .stroke(isSelected ? Color.primaryPurple : Color.clear, lineWidth: 1.5)
                .stroke(Color.clear, lineWidth: 1.5)
                .shadow(radius: 3, x: 1, y: 1)
        )
    }
}

#Preview {
    SelectPayment()
}
