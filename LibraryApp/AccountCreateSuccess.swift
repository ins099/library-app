//
//  AccountCreateSuccess.swift
//  LibraryApp
//
//  Created by Insaram Alam Siddique on 24/10/2024.
//

import SwiftUI

struct AccountCreateSuccess: View {
    var body: some View {
        NavigationStack{
            BaseLayout(cgb:true){
                VStack{
                    Image("accountCreateSucces")
                    Text("Account Create \n Successfully!")
                        .foregroundStyle(.primaryPurple)
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.vertical)
                    
                    Text("Your account has been successfully \n Created. Please Click below to \n Explore App ")
                        .foregroundStyle(.lightgray)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                    
                    Spacer()
                    
                    NavigationLink(destination: Login()){
                        CustomButton(title: "Home", disabled: true,onPress: {})
                    }
                    
                }
                .padding(.top,25)
                .padding(.horizontal)
            }
        }
    }
}
#Preview {
    AccountCreateSuccess()
}
