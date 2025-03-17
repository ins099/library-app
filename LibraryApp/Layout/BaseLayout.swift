import SwiftUI

struct BaseLayout<Content: View>: View {
    // A closure that returns the content (children)
    let content: () -> Content
    
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    
    var containerWidth: CGFloat = UIScreen.main.bounds.width
    var containerHeight: CGFloat = UIScreen.main.bounds.height
    
    // Header Arguments
    var cgb: Bool
    var title: String?
    var onBackAction: (() -> Void)?
    var onRightAction: (() -> Void)?
    var rightText: String?
    var rightIcon: String?
    
    init(cgb: Bool = false,
         title: String = "" ,
         onRightAction: (() -> Void)? = nil,
         onActionBack: (() -> Void)? = nil,
         rightText:String? = "",
         rightIcon:String? = "",
         content: @escaping () -> Content) {
        self.cgb = cgb
        self.title = title
        self.onBackAction = onActionBack
        self.onRightAction = onActionBack
        self.content = content
        self.rightIcon = rightIcon
        self.rightText = rightText
    }
    
    var body: some View {
        ZStack {
            
            VStack(alignment: .center) {
                CustomHeaderView(title: title ?? "",
                                 cgb: cgb, rightIcon: rightIcon,
                                 rightText: rightText,
                                 onBackAction: onBackAction,
                                 onRightAction: onRightAction)
                VStack(alignment: .leading) {
                    content()
                    Spacer()
                }
                .frame(width: containerWidth)
                .background(Color.white)
                .cornerRadius(50, corners: [.topLeft, .topRight])
                
            }
            .padding(.top, safeAreaInsets.top)
            .labelsHidden()
            
        }
        .ignoresSafeArea()
        .background(Color.primaryPurple)
        .navigationBarTitle("Become Driver")
        .navigationBarHidden(true)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BaseLayout {
            // This is where you provide the children
            VStack {
                Text("This is the main content area")
                Text("You can put any SwiftUI views here")
            }
            .padding()
            .background(Color.green.opacity(0.2))
            .cornerRadius(8)
        }
    }
}
