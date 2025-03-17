
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

struct Notifications: View {
    @State var isSelected: Bool = false
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    ImageBackgroundHeader(title: "Notifications",cgb:false)
                    VStack(spacing: 20){
                        NotificationBar()
                        NotificationBar()
                        NotificationBar()
                        NotificationBar()
                        NotificationBar()
                        NotificationBar()
                        NotificationBar()
                    }
                    .padding()
                }
            }.ignoresSafeArea()
                .navigationBarHidden(true)
        }

    }
}

private struct NotificationBar: View {
    var body: some View {
        VStack(){
            Text("King Fahad Library has accepted your book request")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.body)
                .fontWeight(.semibold)
            
            Text("8:03 PM")
                .foregroundStyle(.lightgray)
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(12)
        .shadow(radius: 3, x: 1, y: 1)
        
    }
}

#Preview {
    Notifications()
}
