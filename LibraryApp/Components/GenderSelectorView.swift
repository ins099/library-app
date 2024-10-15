//
//  GenderSelectorView.swift
//  LibraryApp
//
//  Created by Insaram Alam Siddique on 16/10/2024.
//


import SwiftUI

struct GenderSelector: View {
    @State private var selectedGender: Gender? = nil
    
    enum Gender: String {
        case male = "Male"
        case female = "Female"
    }
    
    var body: some View {
        HStack {
            Text("Gender")
                .foregroundColor(.black)
            
            Spacer()
            
            // Male option
            Button(action: {
                selectedGender = .male
            }) {
                HStack {
                    if selectedGender == .male {
                        Image(systemName: "checkmark")
                            .foregroundColor(.white)
                    } else {
                        Image("male")
                            .foregroundColor(selectedGender == .female ? .white : .black)
                    }
                    Text("Male")
                        .foregroundColor(selectedGender == .male ? .white : .black)
                        .fontWeight(.medium)
                }
                .padding()
                .background(selectedGender == .male ? Color.primaryPurple : Color.lightPurple)
                .cornerRadius(20)
            }
            
            // Female option
            Button(action: {
                selectedGender = .female
            }) {
                HStack {
                    if selectedGender == .female {
                        Image(systemName: "checkmark")
                            .foregroundColor(.white)
                    } else {
                        Image("female")
                            .foregroundColor(selectedGender == .female ? .white : .black)
                    }
                    Text("Female")
                        .foregroundColor(selectedGender == .female ? .white : .black)
                        .fontWeight(.medium)
                }
                .padding()
                .background(selectedGender == .female ? Color.primaryPurple : Color.lightPurple)
                .cornerRadius(20)
            }
        }
    }
}

struct GenderSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        GenderSelector()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
