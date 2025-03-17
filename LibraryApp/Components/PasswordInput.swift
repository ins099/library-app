//
//  PasswordInput.swift
//  LibraryApp
//
//  Created by Insaram Alam Siddique on 16/10/2024.
//

import SwiftUI

struct PasswordInput: View {
    

    @Binding var text: String // Change to a Binding variable
    
    @State private var isPasswordVisible: Bool = false
    @State var placeholder: String = ""
    
    var body: some View {
        // Password input
        HStack {
            Image(systemName: "lock")
                .foregroundColor(.gray)
            
            if isPasswordVisible {
                TextField(placeholder, text: $text)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .foregroundColor(.black)
            } else {
                SecureField(placeholder, text: $text)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .foregroundColor(.black)
            }
            
            Button(action: {
                isPasswordVisible.toggle()
            }) {
                Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.5), lineWidth: 1))
        .padding(.bottom, 10)
    }
}

#Preview {
    @Previewable @State var text :String = ""
    PasswordInput(text:$text)
}
