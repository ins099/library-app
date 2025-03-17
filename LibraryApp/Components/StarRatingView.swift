//
//  StarRatingView.swift
//  LibraryApp
//
//  Created by Insaram Alam Siddique on 29/10/2024.
//
import SwiftUI

struct StarRatingView: View {
    var rating: Double // Rating value (e.g., 4.5)
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<5) { index in
                if index < Int(rating) {
                    // Filled star for whole number rating
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                } else if index == Int(rating) {
                    // Partial star for fractional rating
                    Image(systemName: "star.leadinghalf.filled")
                        .foregroundColor(.yellow)
                } else {
                    // Outlined star for remaining
                    Image(systemName: "star")
                        .foregroundColor(.yellow)
                }
            }
        }
    }
}

#Preview(){
    StarRatingView(rating: 3)
}
