//
//  ViewNavigationManager.swift
//  Final Project
//
//  Created by Andy Li on 4/23/23.
//

import Foundation
import SwiftUI

// Define a class to manage the state and navigation
class ViewNavigationManager: ObservableObject {
    enum NavigationState {
        case contentView
        case loginView
        case mainFrameView
        case getStartedView
        case settingView
        case profileView
        case addFriendView
        case addStoryView
    }
    
    @Published var currentView: NavigationState = .contentView
    
    // Methods to navigate to different views
    func goToContentView() {
        currentView = .contentView
    }
    
    func goToLoginView() {
        currentView = .loginView
    }
    
    func goToGetStartedView() {
        currentView = .getStartedView
    }
    
    func goToMainFrameView() {
        currentView = .mainFrameView
    }
    
    func goToSettingView() {
        currentView = .settingView
    }
    
    func goToProfileView() {
        currentView = .profileView
    }
    
    func goToAddFriendView() {
        currentView = .addFriendView
    }
    
    func goToAddStoryView() {
        currentView = .addStoryView
    }
}
