//
//  TextInput.swift
//  LibraryApp
//
//  Created by Insaram Alam Siddique on 16/10/2024.
//

import SwiftUI

struct TextInput: View {
    @Binding var text: String // Change to a Binding variable
    
    var label: String?
    var placeholder: String?
    var icon: String?
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        // Email input
        HStack {
            Image(systemName: icon ?? "envelope")
                .foregroundColor(.gray)
            
            TextField(placeholder ?? "Demo placeholder", text: $text)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .foregroundColor(.black)
                .keyboardType(keyboardType)
            
            if !text.isEmpty {
                Image(systemName: "checkmark.circle")
                    .foregroundColor(.green)
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.5), lineWidth: 1))
        .padding(.bottom, 20)
    }
}

#Preview {
    @Previewable @State var text: String = ""
    TextInput(text: $text)
}
