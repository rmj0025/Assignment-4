//
//  SignUpView.swift
//  Assignment 4
//
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMsg = ""
    @State private var isSignedUp = false
    
    var body: some View {
        VStack {
            Text("Sign up for an account: ")
            TextField("Email", text: $email)
                .autocapitalization(.none)
                .padding()
                .background(Color(.secondarySystemBackground))
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.secondarySystemBackground))
            
            Button(action: {
                signUp()
            }) {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding()
            
            Text(errorMsg)
                .foregroundColor(.red)
            
            NavigationLink(destination: SignInView(), isActive: $isSignedUp) {
                EmptyView()
            }
        }
        .padding()
    }
    
    private func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                errorMsg = error.localizedDescription
            } else {
                errorMsg = "Successfully signed up!"
                isSignedUp = true
            }
        }
    }
}

#Preview {
    SignUpView()
}
