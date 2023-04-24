//
//  AddFriendView.swift
//  Final Project
//
//  Created by Michael Wu on 4/19/23.
//

import SwiftUI

struct User: Identifiable {
    var id: Int
    var name: String
}

struct FriendProfileView: View {
    var friend: User
    
    var body: some View {
        VStack {
            Text(friend.name)
                .font(.largeTitle)
            Spacer()
        }
        .padding()
        .navigationBarTitle("Friend Profile", displayMode: .inline)
    }
}

struct AddFriendView: View {
    @State private var searchQuery: String = ""
    @ObservedObject var navigationManager: ViewNavigationManager
    private let friends = [
        User(id: 1, name: "Bob"),
        User(id: 2, name: "Alice"),
        User(id: 3, name: "Charlie")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                // Add other view components here...
                HStack {
                                Spacer()
                                Text("Add Friends")
                                    .font(.system(size: 28, weight: .semibold))
                                    .foregroundColor(Color(.label))
                                Spacer()
                            }
                            .padding(.vertical, 20)
                            .background(Color(.systemBackground))

                            HStack {
                                TextField("Search", text: $searchQuery)
                                    .padding(.leading, 10)
                                    .frame(height: 40)
                                    .background(Color(.systemGray5))
                                    .cornerRadius(10)
                            }
                            .padding(.horizontal, 20)

                List {
                    ForEach(friends) { friend in
                        NavigationLink(destination: FriendProfileView(friend: friend)) {
                            HStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color(.systemBackground))
                                    .overlay(
                                        Image(systemName: "person.crop.circle")
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                    )
                                    .frame(width: 58, height: 52)
                                Text(friend.name)
                                    .font(.system(size: 20))
                                    .foregroundColor(Color(.label))
                                Spacer()
                            }
                            .padding(.vertical, 8)
                        }
                    }
                }
            }
            .background(Color(.systemBackground))
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarItems(leading: backButton)
        }
    }
    
    var backButton: some View {
        Button(action: navigationManager.goToMainFrameView) {
            HStack (spacing: 10) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .frame(width: 20, height: 20)
                
                Text("Back")
            }
        }
    }
}
