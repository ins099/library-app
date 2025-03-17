//
//  OTPInputView.swift
//  LibraryApp
//
//  Created by Insaram Alam Siddique on 16/10/2024.
//


import SwiftUI

struct OTPInputView: View {
    // State variables to store each digit
    @State private var otp1: String = ""
    @State private var otp2: String = ""
    @State private var otp3: String = ""
    @State private var otp4: String = ""
    
    // State variables for focus
    @FocusState private var focusedField: OTPField?
    
    // Enum to manage focus between the fields
    enum OTPField {
        case otp1, otp2, otp3, otp4
    }
    
    var body: some View {
        HStack(spacing: 10) {
            // OTP Digit 1
            TextField("", text: $otp1)
                .keyboardType(.numberPad)
                .frame(width: 50, height: 50)
                .background(Color.white)
                .cornerRadius(8)
                .multilineTextAlignment(.center)
                .focused($focusedField, equals: .otp1)
                .onChange(of: otp1) { newValue in
                    if newValue.count == 1 {
                        focusedField = .otp2
                    }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(otp1.isEmpty ? Color.gray : Color.purple, lineWidth: 1)
                )
            
            // OTP Digit 2
            TextField("", text: $otp2)
                .keyboardType(.numberPad)
                .frame(width: 50, height: 50)
                .background(Color.white)
                .cornerRadius(8)
                .multilineTextAlignment(.center)
                .focused($focusedField, equals: .otp2)
                .onChange(of: otp2) { newValue in
                    if newValue.count == 1 {
                        focusedField = .otp3
                    } else if newValue.isEmpty {
                        focusedField = .otp1
                    }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(otp2.isEmpty ? Color.gray : Color.purple, lineWidth: 1)
                )
            
            // OTP Digit 3
            TextField("", text: $otp3)
                .keyboardType(.numberPad)
                .frame(width: 50, height: 50)
                .background(Color.white)
                .cornerRadius(8)
                .multilineTextAlignment(.center)
                .focused($focusedField, equals: .otp3)
                .onChange(of: otp3) { newValue in
                    if newValue.count == 1 {
                        focusedField = .otp4
                    } else if newValue.isEmpty {
                        focusedField = .otp2
                    }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(otp3.isEmpty ? Color.gray : Color.purple, lineWidth: 1)
                )
            
            // OTP Digit 4
            TextField("", text: $otp4)
                .keyboardType(.numberPad)
                .frame(width: 50, height: 50)
                .background(Color.white)
                .cornerRadius(8)
                .multilineTextAlignment(.center)
                .focused($focusedField, equals: .otp4)
                .onChange(of: otp4) { newValue in
                    if newValue.isEmpty {
                        focusedField = .otp3
                    }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(otp4.isEmpty ? Color.gray : Color.purple, lineWidth: 1)
                )
        }
        .onAppear {
            focusedField = .otp1 // Set initial focus to the first field when the view appears
        }
    }
}

struct OTPInputView_Previews: PreviewProvider {
    static var previews: some View {
        OTPInputView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
