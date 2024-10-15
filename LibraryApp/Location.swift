import SwiftUI

struct Location: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false

    var body: some View {
        BaseLayout(cgb:true){
            VStack {
                
                TopHeader(heading: "Location", description: "Provide your location")
                
                VStack(spacing:18){
                DropdownView(placeholder: "Select country")
                DropdownView(placeholder: "Select city")
             }
                Spacer()
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            // Action for the button
                            print("Floating button tapped")
                        }) {
                            Image(systemName: "arrow.right")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                                .frame(width: 60, height: 60)
                                .background(Color.primaryPurple)
                                .clipShape(Circle())
                                .shadow(color: .gray, radius: 5, x: 0, y: 2)
                        }
                    }
                }
            }
            .padding(30)
        }
    }
}

struct Location_Previews: PreviewProvider {
    static var previews: some View {
        Location()
    }
}
