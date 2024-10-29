//
//  TopHeader.swift
//  LibraryApp
//
//  Created by Insaram Alam Siddique on 16/10/2024.
//

import SwiftUI

struct TopHeader : View {
    var heading: String
    var description: String
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(heading)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primaryPurple)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(description)
                .foregroundColor(.gray)
        }
        .padding(.bottom, 30)
    }
}


#Preview {
    TopHeader(heading: "Heading", description: "Description")
}
