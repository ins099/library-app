import SwiftUI

struct ForgotPassword: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false

    var body: some View {
        BaseLayout{
            VStack {
                TopHeader(heading: "Forgot Password", description: "If you have forgotten your password You can reset here.")
                
                TextInput(text: $email, placeholder: "Enter Email", icon: "envelope")

                
                CustomButton(title: "Send Otp", onPress: {})
                
                Spacer()
            }
            .padding(30)
        }
    }
}


struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassword()
    }
}
