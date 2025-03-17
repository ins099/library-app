//
//  CreditCardInfoForm.swift
//  LibraryApp
//
//  Created by Insaram Alam Siddique on 30/10/2024.
//
import SwiftUI

struct CreditCardInfoForm: View {
    @State private var cardNumber: String = ""
    @State private var cardHolderName: String = ""
    @State private var cvv: String = ""
    @State private var expiryDate: String = ""
    @State private var cardType: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Card Number Field
            VStack(alignment: .leading) {
                Text("Card Number")
                    .foregroundColor(Color.lightgray)
                
                HStack {
                    TextField("Enter your card number", text: $cardNumber)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(Color.white)
                        .onChange(of: cardNumber) { newValue in
                            cardType = determineCardType(cardNumber: newValue)
                        }
                    
                    // Show the card type image
                    if !cardType.isEmpty {
                        Image(cardType == "Visa" ? "visa" : "mastercard") // Make sure these image names match your asset names
                            .resizable()
                            .frame(width: 40, height: 25) // Adjust size as needed
                            .padding(.trailing, 10) // Add some spacing between text field and image
                    }
                }
//                .background(RoundedRectangle(cornerRadius: 8).fill(Color.white)) // Rounded rectangle background
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.lightgray, lineWidth: 1)) // Light gray border

            }


            // Card Holder Name Field
            VStack(alignment: .leading) {
                Text("Account Holder Name")
                    .foregroundColor(.lightgray)
                TextField("Enter account holder's name", text: $cardHolderName)
                    .padding()
                    .background(Color.white)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.lightgray, lineWidth: 1)) // Light gray border
            }
            
            // CVV and Expiry Date Fields
            HStack {
                VStack(alignment: .leading) {
                    Text("CVV")
                        .foregroundColor(.lightgray)
                    TextField("Enter CVV", text: $cvv)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(Color.white)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.lightgray, lineWidth: 1)) // Light gray border
                }
                
                VStack(alignment: .leading) {
                    Text("Expiry Date")
                        .foregroundColor(.lightgray)
                    TextField("MM/YY", text: $expiryDate)
                        .padding()
                        .background(Color.white)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.lightgray, lineWidth: 1)) // Light gray border
                }
            }
        }
    }
    
    // Function to determine card type
    private func determineCardType(cardNumber: String) -> String {
        let trimmedCardNumber = cardNumber.replacingOccurrences(of: " ", with: "")
        
        if trimmedCardNumber.hasPrefix("4") {
            return "Visa"
        } else if trimmedCardNumber.hasPrefix("5") {
            return "MasterCard"
        }
        return "Unknown"
    }
}

#Preview {
    CreditCardInfoForm()
        .padding()
}
