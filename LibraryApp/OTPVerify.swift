import SwiftUI

struct OTPVerify: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false

    var body: some View {
        BaseLayout(cgb:true){
            VStack {
                
                TopHeader(heading: "Email Verification", description: "Your account verification code has been Sent to your email address")
                
                VStack(spacing:35){
                    OTPInputView()
                    CustomButton(title: "Verify", onPress: {})
             }
                Spacer()
                
            }
            .padding(30)
        }
    }
}

struct OTPVerify_Previews: PreviewProvider {
    static var previews: some View {
        OTPVerify()
    }
}
