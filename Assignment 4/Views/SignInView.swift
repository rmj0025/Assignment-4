//
//  SignInView.swift
//  Assignment 4
//
//

import SwiftUI
import FirebaseAuth

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMsg = ""
    @State private var isSignedIn = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Sign in to your account: ")
                    .bold()
                TextField("Email", text: $email)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                
                NavigationLink(destination: SignUpView()) {
                    Text("Don't have an account?")
                        .foregroundColor(.blue)
                }
                
                Button(action: {
                    signIn()
                }) {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()
                
                Text(errorMsg)
                    .foregroundColor(.red)
                
                NavigationLink(destination: MainPage(), isActive: $isSignedIn) {
                    EmptyView()
                }
            }
            .padding()
        }
    }
    
    private func signIn() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                errorMsg = error.localizedDescription
            } else {
                errorMsg = "Successfully signed in!"
                isSignedIn = true
            }
        }
    }
}

#Preview {
    SignInView()
}
