import SwiftUI

struct OTPVerify: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var isModalVisible: Bool = false

    var body: some View {
        NavigationStack{
            BaseLayout(cgb:true){
                ZStack{
                    VStack {
                        
                        TopHeader(heading: "Email Verification", description: "Your account verification code has been Sent to your email address")
                        
                        VStack(spacing:35){
                            OTPInputView()
                            CustomButton(title: "Verify", onPress: {
                                withAnimation {
                                    isModalVisible.toggle()
                                }
                            })
                        }
                        Spacer()
                        
                    }
                    .padding(30)
                    
                    if isModalVisible {
                        ModalView(isVisible: $isModalVisible) {
                            VStack {
                                Image("emailSent")
                                    .resizable()
                                    .frame(width: 200, height: 200)
                                    .foregroundColor(.primaryPurple)
                                
                                Text("Email Verified Successfully!")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.primaryPurple)
                                NavigationLink(destination: YourInterest(), label: {
                                    Text("Great")
                                        .font(.headline)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color.primaryPurple)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                        .padding(.horizontal)
                                }
                                )
                            }
                        }
                    }
                }
            }
        }
    }
}

struct OTPVerify_Previews: PreviewProvider {
    static var previews: some View {
        OTPVerify()
    }
}
