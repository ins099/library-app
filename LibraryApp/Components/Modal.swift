import SwiftUI

struct Modal: View {
    @State private var isModalVisible = false

    var body: some View {
        ZStack {
            // Main Content
            MainContent(isModalVisible: $isModalVisible)

            // Modal View
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

                        Button("Close Modal") {
                            withAnimation {
                                isModalVisible.toggle()
                            }
                        }
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.primaryPurple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

struct MainContent: View {
    @Binding var isModalVisible: Bool

    var body: some View {
        VStack {
            Button("Open Modal") {
                withAnimation {
                    isModalVisible.toggle()
                }
            }
            .font(.title)
            .padding()
            .background(Color.primaryPurple)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

struct ModalView<Content: View>: View {
    // Use @Binding to receive a reference to the parent state
    @Binding var isVisible: Bool
    // Closure to render child content
    let content: () -> Content

    var body: some View {
        ZStack {
            // Background Dim
            Color.black.opacity(0.5)
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation {
                        isVisible = false
                    }
                }

            // Modal Content
            VStack(spacing: 20) {
                // Custom content passed from parent
                content()
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .frame(maxWidth: 350)
            .shadow(radius: 20)
        }
    }
}

#Preview {
    Modal()
}
