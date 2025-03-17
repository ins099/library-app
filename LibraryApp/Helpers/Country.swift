//
//  Country.swift
//  FlashDriver
//
//  Created by Insaram Alam Siddique on 10/10/2024.
//

import Foundation


// Struct to represent each country
struct Country: Identifiable {
    let id = UUID()
    let name: String
    let code: String
    let flag: String
}


let countries = [
    Country(name: "United States", code: "+1", flag: "🇺🇸"),
    Country(name: "Canada", code: "+1", flag: "🇨🇦"),
    Country(name: "United Kingdom", code: "+44", flag: "🇬🇧"),
    Country(name: "Australia", code: "+61", flag: "🇦🇺")
    // Add more countries as needed
]
