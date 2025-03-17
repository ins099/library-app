//
//  DropdownView.swift
//  LibraryApp
//
//  Created by Insaram Alam Siddique on 16/10/2024.
//


import SwiftUI

struct DropdownView: View {
    @State private var isExpanded = false
    @State private var selected: String? = nil
    
    var list: [String] = ["United States", "Canada", "United Kingdom", "Germany", "Australia"]
    
    var icon: String = "building.2"
    
    var placeholder: String = "Select Item"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Dropdown Button
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    // Icon on the left
                    Image(systemName: icon)
                        .foregroundColor(.gray)
                    
                    // Selected text or placeholder
                    Text(selected ?? placeholder)
                        .foregroundColor(selected == nil ? .gray : .black)
                        .padding(.leading, 10)
                    
                    Spacer()
                    
                    // Chevron icon on the right
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding()
                .frame(height: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
            }
            
            // Dropdown List
            if isExpanded {
                VStack(spacing: 0) {
                    ForEach(list, id: \.self) { item in
                        Button(action: {
                            withAnimation {
                                selected = item
                                isExpanded = false
                            }
                        }) {
                            HStack {
                                Text(item)
                                    .foregroundColor(.black)
                                    .padding(.leading, 16)
                                Spacer()
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(Color.white)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
            }
        }
    }
}

struct DropdownView_Previews: PreviewProvider {
    static var previews: some View {
        DropdownView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
