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

struct MyRequests: View {
    @State var isSelected: Bool = false
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    ImageBackgroundHeader(title: "My Request",cgb:true)
                    VStack(spacing: 20){
                        Request()
                        Request()
                    }
                    .padding()
                    
                    Spacer()
                    
                }
            }.ignoresSafeArea()
                .navigationBarHidden(true)
        }

    }
}

private struct Request: View {
    var body: some View {
        ZStack{
            VStack(spacing: 15){
                VStack{
                Text("Book Name: ")
                    .foregroundStyle(.lightgray)
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom,2)
                
                    Text("Catlin's Coach")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Text("by John Grisham")
                        .foregroundStyle(.lightgray)
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                VStack{
                Text("Library Name")
                    .foregroundStyle(.lightgray)
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom,2)
                    
                    Text("King Fahad Library")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    HStack{
                        Image(systemName:"location")
                        Text("Riyadh, Saudia Arabia")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .foregroundStyle(.lightgray)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack{
                Text("Pending")
                    .font(.footnote)
                    .padding(6)
                    .padding(.horizontal,10)
                    .background(.blue.opacity(0.3))
                    .cornerRadius(12)
            }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .foregroundStyle(.blue)
            
            HStack{
                Text("$ 42.05")
                    .font(.headline)
                    .fontWeight(.bold)
                    .cornerRadius(12)
            }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                .foregroundStyle(.primaryPurple)

        }
            .frame(height:210)
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(12)
            .shadow(radius: 3, x:1, y:1)
    }
}

#Preview {
    MyRequests()
}
