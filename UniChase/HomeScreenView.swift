//
//  HomeScreenView.swift
//  UniChase
//
//  Created by CJ Seigler on 7/21/23.
//

import SwiftUI

struct Business: Identifiable {
    let id = UUID()
    let name: String
    // Add other properties for the business
}

struct HomeScreenView: View {
    @State private var searchText: String = ""
    @State private var selectedCategory: String? = nil

    private let categories = ["Category 1", "Category 2", "Category 3", "Category 4"] // Add your business categories
    private let businesses = [Business(name: "Business 1"), Business(name: "Business 2"), Business(name: "Business 3")]
    // Add your list of businesses

    var body: some View {
        NavigationView {
            ScrollView {
                // Business Categories
                LazyHStack(spacing: 16) {
                    ForEach(categories, id: \.self) { category in
                        Button(action: {
                            selectedCategory = category
                        }) {
                            Text(category)
                                .font(.headline)
                                .foregroundColor(selectedCategory == category ? .white : .blue)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(selectedCategory == category ? Color.blue : Color.white)
                                .cornerRadius(20)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top)

                // Search Button
                Button(action: {
                    // Implement search functionality
                }) {
                    Text("Search")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(Color.blue)
                        .cornerRadius(20)
                }
                .padding(.horizontal)
                .padding(.vertical, 8)

                // Businesses
                VStack(alignment: .leading) {
                    ForEach(businesses) { business in
                        Text(business.name)
                            .font(.headline)
                            .padding(.vertical, 8)
                    }
                }
                .padding()
            }
            .navigationTitle("Home")
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
