import SwiftUI

struct Signup: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false

    var body: some View {
        BaseLayout(cgb:true){
            VStack {
                
                TopHeader(heading: "Sign Up", description: "Create your account")
                
                
                TextInput(text: $email, placeholder: "First Name", icon: "person")
                TextInput(text: $email, placeholder: "Last Name", icon: "person")
                TextInput(text: $email, placeholder: "Email", icon: "envelope")
                TextInput(text: $email, placeholder: "Phone Number", icon: "iphone.gen3")
                
                GenderSelector()
                
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

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup()
    }
}
