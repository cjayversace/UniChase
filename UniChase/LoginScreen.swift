//
//  LoginScreen.swift
//  UniChase
//
//  Created by CJ Seigler on 7/20/23.
//

import SwiftUI
import Firebase

struct LoginScreen: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isAuthenticated: Bool = false
    @State private var showTryAgainMessage: Bool = false // New state variable to show the "Try Again" message

    var body: some View {
        NavigationView {
            VStack {
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .navigationBarBackButtonHidden(true)

                TextField("Student Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Login") {
                    loginButtonTapped()
                }
                .font(.headline)
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)

                NavigationLink(destination: HomeScreenView(), isActive: $isAuthenticated) {
                    EmptyView()
                }
                .hidden()

                if showTryAgainMessage {
                    Text("Login attempt failed. Please try again.")
                        .foregroundColor(.red)
                        .padding(.top, 8)
                }
            }
            .padding()
        }
    }

    private func loginButtonTapped() {
            // Perform login logic using Firebase Authentication
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                if let error = error {
                    print("Login error: \(error.localizedDescription)")
                    showTryAgainMessage = true // Login attempt failed, show the "Try Again" message
                } else {
                    print("Login successful.")
                    isAuthenticated = true // Login successful, set isAuthenticated to true to navigate to HomeScreenView
                }
            }
        }
    }

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}

