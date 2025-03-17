//
//  Input.swift
//  LibraryApp
//
//  Created by Insaram Alam Siddique on 11/09/2024.
//

import SwiftUI

struct Input: View {
    var body: some View {
        TextField("This is placholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(""))
            .padding(.all, 8.0)
            .frame(width: 200.0, height: 50.0)
            .accessibilityHidden(false)
            .accessibilityLabel("Label")
            .accessibilityValue("Value")
            .cornerRadius(20.0)
            .overlay( /// apply a rounded border
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.blue, lineWidth: 1.2)
            )
            
            
    }
}

#Preview {
    Input()
}
