import SwiftUI

struct MyBooks: View {
    @State private var search: String = ""
    @State private var showModal: Bool = false
    @State private var rating: Double = 0.0
    @State private var reviewText: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                ImageBackgroundHeader(title: "My Books", cgb: false)
                VStack {
                    MyBook(book: BookCardInfo(id: "4", title: "People and Business", author: "Insaram Alam", extraDetail: "String", CatTags: ["Business", "Ideas"], rating: 3.0, price: "23.00", image: "bookcover"), showModal: $showModal)
//                    MyBook(book: BookCardInfo(id: "4", title: "People and Business", author: "Insaram Alam", extraDetail: "String", CatTags: ["Business", "Ideas"], rating: 3.0, price: "23.00", image: "bookcover"), showModal: $showModal)

                    Spacer()
                }
                .padding()
                .background(Color.background)
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
        }
        .sheet(isPresented: $showModal) {
            ReviewModal(isPresented: $showModal, rating: $rating, reviewText: $reviewText)
        }.background(.red)
    }
}

private struct MyBook: View {
    var book: BookCardInfo
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var showModal : Bool
    
    var body: some View {
        VStack {
            ZStack {
                HStack(alignment: .center) {
                    Image(book.image)
                        .resizable()
                        .frame(width: 100, height: 140)
                    VStack(alignment: .leading, spacing: 7) {
                        Text(book.title)
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text(book.extraDetail)
                            .font(.body)
                            .fontWeight(.thin)
                            .foregroundStyle(.darkgray)
                        Text("by \(book.author)")
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundStyle(.darkgray)
                        HStack {
                            ForEach(book.CatTags, id: \.self) { item in
                                BookCatTag() // Optional: add padding around each text
                            }
                        }
                        StarRatingView(rating: 3)
                    }
                    .padding(5)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                }
                Text("$ \(book.price)")
                    .foregroundStyle(.primaryPurple)
                    .font(.headline)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            }
            Divider()
            
            VStack {
                Text("Library Name")
                    .foregroundStyle(.lightgray)
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 2)
                
                Text("King Fahad Library")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                HStack {
                    Image(systemName: "location")
                    Text("Riyadh, Saudia Arabia")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .foregroundStyle(.lightgray)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            HStack {
                Text("148 Days Left")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.primaryPurple)
                    .font(.headline)
                    .fontWeight(.bold)
                    .background(RoundedCorner(radius: 20).fill(.lightPurple).stroke(.primaryPurple))
                Spacer()
                

                    Text("Review")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                        .font(.headline)
                        .fontWeight(.bold)
                        .background(RoundedCorner(radius: 20).fill(.primaryPurple).stroke(.primaryPurple))
                        .onTapGesture {
                            showModal.toggle()
                        }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 330)
        .background(Color.white)
        .cornerRadius(12)
        .padding(3)
        .shadow(radius: 2, x: 0, y: 1)
    }
}

private struct ReviewModal: View {
    @Binding var isPresented: Bool
    @Binding var rating: Double
    @Binding var reviewText: String
    
    var body: some View {
        ZStack {
            Color.clear.opacity(0).edgesIgnoringSafeArea(.all) // Translucent backdrop
            
            VStack(spacing: 20) {
                HStack {
                    Spacer()
                    Button(action: {
                        isPresented = false
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                    }
                }
                
                Text("Rate This Place")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                
                StarRatingView(rating: rating) // Bind rating to the star rating view
                Text("Tap to rate this place")
                    .foregroundColor(.gray)
                
                TextField("Write your review...", text: $reviewText)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.lightgray, lineWidth: 1))
                
                Button(action: {
                    print("Rating: \(rating), Review: \(reviewText)")
                    isPresented = false // Close modal after submission
                }) {
                    Text("Submit Review")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.primaryPurple)
                        .cornerRadius(8)
                }
            }
            .padding()
            .frame(maxWidth: 300)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
    }
}

#Preview {
    MyBooks()
}
