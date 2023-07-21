//
//  ContentView.swift
//  UniChase
//
//  Created by CJ Seigler on 7/17/23.
//
import SwiftUI

struct ContentView: View {
    @State private var showingLoginSignup = false

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) { // Update alignment to .top
                Color.white
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    Text("Discover, Support and Empower Student Businesses")
                        .font(
                            Font.custom("SF Pro", size: 22)
                                .weight(.bold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.06, green: 0.06, blue: 0.06))
                        .frame(width: 325, height: 69, alignment: .top)
                    
                    Text("Your virtual goods and services marketplace")
                        .font(
                            Font.custom("SF Compact", size: 14)
                                .weight(.medium)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.53, green: 0.53, blue: 0.53))
                        .frame(width: 253, alignment: .top)
                    
                    Spacer()
                    
                    NavigationLink(destination: LoginSignupView(), isActive: $showingLoginSignup) {
                        HStack(alignment: .top, spacing: 8) {
                            Text("Get Started")
                                .font(
                                    Font.custom("SF Pro", size: 16)
                                        .weight(.bold)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .top)
                        }
                        .padding(.horizontal, 32)
                        .padding(.vertical, 18)
                        .frame(width: 327, alignment: .topLeading)
                        .background(
                            LinearGradient(
                                gradient: Gradient(stops: [
                                    Gradient.Stop(color: Color(red: 1, green: 0.16, blue: 0.29), location: 0.00),
                                    Gradient.Stop(color: Color(red: 1, green: 0.32, blue: 0.61), location: 1.00)
                                ]),
                                startPoint: UnitPoint(x: 1.07, y: 1.15),
                                endPoint: UnitPoint(x: -0.37, y: -1.96)
                            )
                        )
                        .cornerRadius(12)
                    }
                    .frame(width: 501.85507, height: 473.02661)
                               }
                           }
                       }
                   }

                   struct ContentView_Previews: PreviewProvider {
                       static var previews: some View {
                           ContentView()
                       }
                   }
}
