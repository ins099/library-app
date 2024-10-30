//
//  SelectPayment 2.swift
//  LibraryApp
//
//  Created by Insaram Alam Siddique on 30/10/2024.
//


//
//  SelectPayment.swift
//  LibraryApp
//
//  Created by Insaram Alam Siddique on 30/10/2024.
//

import SwiftUI

struct CardDetails: View {
    @State var isSelected: Bool = false
    var body: some View {
        ZStack{
            VStack{
                ImageBackgroundHeader(title: "Card Details",cgb:true)
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
                        CreditCardInfoForm()
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

#Preview {
    CardDetails()
}
