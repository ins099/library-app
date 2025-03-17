
import SwiftUI

struct YourInterest: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false

    var body: some View {
        NavigationStack{
            BaseLayout(cgb: true){
                VStack {
                    TopHeader(heading: "Tell us about your \n interest", description: "Choose your interest")
                    
                    Interests()
                    
                    NavigationLink(destination: MainTabView()){
                        CustomButton(title: "Finish", disabled: true, onPress: {})
                    }
                    
                }
                .padding(.horizontal, 15)
                .padding(.top, 25)
                .padding(.bottom, 25)
            }
            .navigationBarHidden(true)
        }
    }
}


struct Interest_Previews: PreviewProvider {
    static var previews: some View {
        YourInterest()
    }
}
