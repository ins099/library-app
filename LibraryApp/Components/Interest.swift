import SwiftUI

struct InterestLayout: View {
    let items: [String]
    let spacing: CGFloat
    let padding: CGFloat

    // State to keep track of selected tags
    @State private var selectedItems: Set<String> = []

    var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
        }
    }

    private func generateContent(in geometry: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(items, id: \.self) { item in
                self.itemView(for: item)
                    .padding([.horizontal, .vertical], self.padding)
                    .alignmentGuide(.leading) { d in
                        if (abs(width - d.width) > geometry.size.width) {
                            width = 0
                            height -= d.height + self.spacing
                        }
                        
                        let result = width
                        if item == self.items.last {
                            width = 0 // last item resets the width
                        } else {
                            width -= d.width + self.spacing
                        }
                        return result
                    }
                    .alignmentGuide(.top) { _ in
                        let result = height
                        if item == self.items.last {
                            height = 0 // last item resets the height
                        }
                        return result
                    }
                    // Add a tap gesture to toggle selection
                    .onTapGesture {
                        toggleSelection(for: item)
                    }
            }
        }
    }

    private func itemView(for text: String) -> some View {
        let isSelected = selectedItems.contains(text)

        return Text(text)
            .padding(15)
            .background(isSelected ? Color.primaryPurple : Color.white)
            .foregroundColor(isSelected ? .white : .black)
            .overlay(
                RoundedRectangle(cornerRadius: 18)
                    .stroke(isSelected ? Color.primaryPurple : Color.gray, lineWidth: 1)
            )
            .cornerRadius(18)
    }

    // Toggle selection for a tag
    private func toggleSelection(for item: String) {
        if selectedItems.contains(item) {
            selectedItems.remove(item) // Deselect if already selected
        } else {
            selectedItems.insert(item) // Select if not selected
        }
    }
}

struct Interests: View {
    private let tags = ["History", "Art", "Children", "Mystery", "Science", "Romance", "Religion","Drama", "Fantasy", "Business","Comedy","Fiction", "Horror", "Poetry", "Suspense", "Crime","Comic"]

    var body: some View {
        ScrollView {
            InterestLayout(items: tags, spacing: 8, padding: 3)
        }
    }
}

#Preview {
    Interests()
}
