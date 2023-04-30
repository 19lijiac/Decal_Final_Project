//
//  AddFriendView.swift
//  Final Project
//
//  Created by Michael Wu on 4/19/23.
//

import SwiftUI

/*
struct User: Identifiable {
    var id: Int
    var name: String
}
 */

struct FriendProfileView: View {
    var friend: String
    @State private var sent = false
    
    var body: some View {
        VStack {
            Text(friend)
                .font(.largeTitle)
            Spacer()
        }
        .padding()
        .navigationBarTitle("Friend Profile", displayMode: .inline)
        .navigationBarItems(trailing:
                    Button(action: {
                        sent = !sent
                        FirebaseManager.shared.addUser(addUserId: friend)
                    }, label: {
                        Image(systemName: "plus.circle")
                    })
                    .padding(.trailing, 8)
                    .foregroundColor(.blue)
                )
                .alert(isPresented: $sent) {
                    Alert(title: Text("Friend request sent"), message: Text("You've sent a friend request to \(friend)"), dismissButton: .default(Text("OK")))
                }
    }
}

struct AddFriendView: View {
    @State private var searchQuery: String = ""
    @ObservedObject var navigationManager: ViewNavigationManager
    @State private var showPopup = false
    private let friends = FirebaseManager.shared.allUserList
    
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
                    ForEach(friends, id: \.self) { friend in
                        NavigationLink(destination: FriendProfileView(friend: friend)) {
                            ZStack{
                                
                                HStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color(.systemBackground))
                                        .overlay(
                                            Image(systemName: "person.crop.circle")
                                                .resizable()
                                                .frame(width: 50, height: 50)
                                        )
                                        .frame(width: 58, height: 52)
                                    Text(friend)
                                        .font(.system(size: 20))
                                        .foregroundColor(Color(.label))
                                    Spacer()
                                }
                                .padding(.vertical, 8)
                                .allowsHitTesting(false)
                            }
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

