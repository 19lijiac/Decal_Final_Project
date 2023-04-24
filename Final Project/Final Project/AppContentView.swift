//
//  AppContentView.swift
//  Final Project
//
//  Created by Andy Li on 4/19/23.
//

import SwiftUI

struct AppContentView: View {
    @ObservedObject var navigationManager = ViewNavigationManager()
    @State private var isDarkMode = false
    @StateObject var locationTracker = LocationTracker()
    
    var body: some View {
        VStack {
                    if navigationManager.currentView == .contentView {
                        ContentView(navigationManager: navigationManager)
                    } else if navigationManager.currentView == .loginView {
                        LogInView(navigationManager: navigationManager)
                    } else if navigationManager.currentView == .mainFrameView {
                        MainFrameView(locationTracker: locationTracker, navigationManager: navigationManager, isDarkMode: $isDarkMode)
                    } else if navigationManager.currentView == .getStartedView {
                        GetStartedView(navigationManager: navigationManager)
                    } else if navigationManager.currentView == .settingView {
                        SettingView(navigationManager: navigationManager, isDarkMode: $isDarkMode)
                    } else if navigationManager.currentView == .profileView {
                       ProfileView(navigationManager: navigationManager)
                    } else if navigationManager.currentView == .addFriendView {
                        AddFriendView(navigationManager: navigationManager)
                    } else if navigationManager.currentView == .addStoryView {
                        AddNoteView(navigationManager:navigationManager)
                    }
                }
    }
}
