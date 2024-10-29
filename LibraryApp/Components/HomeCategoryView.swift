

import SwiftUI

struct Category: Hashable {
    var title: String
    var image: String
}


struct HomeCategoryView: View {
    var categories: [Category] = [
        Category(title:"Fantasy", image:"fantasy"),
        Category(title:"Art", image:"art"),
        Category(title:"History", image:"history"),
        Category(title:"Romance", image:"romance")
    ]
    let selectedCategory = "History"

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Categories")
                    .font(.headline)
                Spacer()
                NavigationLink(destination: Categories(), label: {
                    Text("View all")
                        .foregroundColor(.gray)
                })
            }
            .padding([.leading, .trailing], 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(categories, id: \.self) { category in
                        VStack{
                            Image(category.image)
                            Text(category.title)
                        }
                        .frame(width: 65, height: 70, alignment: .center)
                        .padding()
                        .background(category.title == selectedCategory ? Color.primaryPurple : Color.white)
                        .foregroundColor(category.title == selectedCategory ? .white : Color.gray.opacity(0.7))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                    }
                }
                .padding([.leading, .trailing], 20)
            }
        }
        .padding(.top, 10)
    }
}

struct Category_Previews: PreviewProvider {
    static var previews: some View {
        HomeCategoryView()
    }
}
