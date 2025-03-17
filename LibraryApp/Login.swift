import SwiftUI

struct Login: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false

    var body: some View {
        NavigationStack{
            BaseLayout{
                VStack {
                    TopHeader(heading: "Sign In", description: "Signin to continue")
                    TextInput(text: $email, placeholder: "Enter Email", icon: "envelope")
                    PasswordInput(text: $password, placeholder: "Enter password")
                    
                    
                    
                    // Forgot password
                    HStack {
                        Spacer()
//                        Button(action: {
//                            // Handle forgot password action
//                        }) {
//                            Text("Forgot Password?")
//                                .font(.footnote)
//                                .foregroundColor(.primaryPurple)
//                        }
                        NavigationLink(destination: ForgotPassword(),label:{
                            Text("Forgot Password?")
                                .font(.footnote)
                                .foregroundColor(.primaryPurple)
                        }
                        )
                    }
                    .padding(.bottom, 30)
                    CustomButton(title: "Login", onPress: {})
                    NavigationLink(destination: Signup(), label: {
                
                        CustomButton(title: "Create an account", isSecondary: true, disabled: true, onPress: {})
                        
                    })
                    
                    Spacer()
                    
                    // Social media login options
                    Text("OR")
                        .foregroundColor(.gray)
                        .padding(.bottom, 10)
                    
                    Text("Login with")
                        .foregroundColor(.gray.opacity(0.7))
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    HStack(spacing: 20) {
                        // Twitter
                        Button(action: {
                            // Handle Twitter login
                        }) {
                            Image("twitter") // Add your twitter logo asset
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                        
                        // Facebook
                        Button(action: {
                            // Handle Facebook login
                        }) {
                            Image("facebook") // Add your Facebook logo asset
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                        
                        // Google
                        Button(action: {
                            // Handle Google login
                        }) {
                            Image("google") // Add your Google logo asset
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                    }
                    
                    Spacer()
                }
                .padding(30)
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
