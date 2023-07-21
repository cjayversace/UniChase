//
//  LoginSignupView.swift
//  UniChase
//
//  Created by CJ Seigler on 7/20/23.
//
import SwiftUI
import Firebase

struct LoginSignupView: View {
    @State private var email: String = ""
    @State private var name: String = ""
    @State private var password: String = ""
    @State private var isAccountCreated: Bool = false
    @State private var isLoginTapped: Bool = false // New state variable for tracking if login button is tapped

    var body: some View {
        NavigationView { // Wrap in NavigationView to enable navigation
            VStack(alignment: .leading) {
                Text("Let’s Get Started!")
                    .font(
                        Font.custom("SF Pro", size: 28)
                            .weight(.bold)
                    )
                    .padding()

                Text("Fill the form to continue.")
                    .font(Font.custom("Roboto", size: 12))
                    .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.11).opacity(0.6))
                    .padding()

                TextField("Student Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                HStack(spacing: 20) {
                    Button("Submit") {
                        createAccountButtonTapped()
                    }
                    .font(.headline)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)

                    NavigationLink( // Use NavigationLink to navigate to the login screen
                        destination: LoginScreen(), // Replace LoginScreen with the actual login screen view
                        isActive: $isLoginTapped, // Bind the isActive parameter to the isLoginTapped state variable
                        label: {
                            Text("Login Instead?") // The login button label
                                .font(.headline)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.green)
                                .cornerRadius(10)
                        })
                }
                .padding(.top)
                .frame(maxWidth: .infinity)
            }
            .padding()
        }
    }

    private func createAccountButtonTapped() {
            // Perform account creation logic here using Firebase Authentication
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    // Handle error during account creation
                    print("Error creating account: \(error.localizedDescription)")
                } else if let user = authResult?.user {
                    // Account creation successful, save additional user details to Firestore
                    let db = Firestore.firestore()
                    db.collection("users").document(user.uid).setData([
                        "name": name,
                        "email": email,
                        // Firebase Authentication automatically handles password hashing
                        // and securely stores the hashed password
                    ]) { error in
                        if let error = error {
                            // Handle error saving user details to Firestore
                            print("Error saving user details: \(error.localizedDescription)")
                        } else {
                            // Account created and user details saved successfully
                            // Send verification email
                            user.sendEmailVerification { error in
                                if let error = error {
                                    // Handle error sending verification email
                                    print("Error sending verification email: \(error.localizedDescription)")
                                } else {
                                    // Verification email sent successfully
                                    // Navigate to the email verification screen
                                    isAccountCreated = true
                                }
                            }
                        }
                    }
                }
            }
        }
struct LoginSignupView_Previews: PreviewProvider {
    static var previews: some View {
        LoginSignupView()
    }
}
}
