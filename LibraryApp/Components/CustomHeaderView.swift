//
//  CustomHeaderView.swift
//  LibraryApp
//
//  Created by Insaram Alam Siddique on 16/10/2024.
//


import SwiftUI

struct CustomHeaderView: View {
    var title: String = ""
    var cgb: Bool = false
    var rightIcon: String? // SF Symbol name for the icon
    var rightText: String?
    var onBackAction: (() -> Void)?
    var onRightAction: (() -> Void)?

    var body: some View {
        HStack {
            // Back button
            if cgb {
                Button(action: {
                    onBackAction!()
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.white)
                        .font(.title2)
                }
            } else {
                Spacer().frame(width: 40) // Placeholder to keep the title centered when there's no back button
            }
            
            Spacer()
            
            // Title
            Text(title)
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .semibold))
            
            Spacer()
            
            // Right side (icon or text)
            if let rightIcon = rightIcon {
                Button(action: {
                    onRightAction?()
                }) {
                    Image(systemName: rightIcon)
                        .foregroundColor(.white)
                        .font(.title2)
                }
            } else if let rightText = rightText {
                Button(action: {
                    onRightAction?()
                }) {
                    Text(rightText)
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                }
            } else {
                Spacer().frame(width: 40) // Placeholder to keep the title centered when there's no right element
            }
        }
        .padding()
        .background(Color.primaryPurple) // Customize your background color
    }
}

struct CustomHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomHeaderView(
//                title: "Header Title"
                cgb: true
//                rightIcon: "bell", // Use an SF Symbol for the icon
//                rightText: "nil",
//                onBackAction: {
//                    print("Back button pressed")
//                },
//                onRightAction: {
//                    print("Right button pressed")
//                }
            )
            
            Spacer()
        }
        .background(Color.black.edgesIgnoringSafeArea(.all)) // Background for preview visibility
    }
}
