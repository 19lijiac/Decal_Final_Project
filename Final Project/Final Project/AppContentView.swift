//
//  AppContentView.swift
//  Final Project
//
//  Created by Andy Li on 4/19/23.
//

import SwiftUI

struct AppContentView: View {
    @ObservedObject var navigationManager = ViewNavigationManager()
    @StateObject var locationTracker = LocationTracker()
    
    var body: some View {
        VStack {
                    if navigationManager.currentView == .contentView {
                        ContentView(navigationManager: navigationManager)
                    } else if navigationManager.currentView == .loginView {
                        LogInView(navigationManager: navigationManager)
                    } else if navigationManager.currentView == .mainFrameView {
                        MainFrameView(locationTracker: locationTracker, navigationManager: navigationManager).onAppear {startBackgroundTask()}
                    } else if navigationManager.currentView == .getStartedView {
                        GetStartedView(navigationManager: navigationManager)
                    } else if navigationManager.currentView == .settingView {
                        SettingView(navigationManager: navigationManager, locationTracker: locationTracker)
                    } else if navigationManager.currentView == .profileView {
                        ProfileView(locationTracker: locationTracker, navigationManager: navigationManager)
                    } else if navigationManager.currentView == .addFriendView {
                        AddFriendView(navigationManager: navigationManager)
                    } else if navigationManager.currentView == .addStoryView {
                        AddNoteView(navigationManager:navigationManager, locationTracker: locationTracker)
                    }
                }
    }
    
    //refresh mainframeview data in the background when the view is open
    @State private var backgroundTaskID: UIBackgroundTaskIdentifier = .invalid
    private let backgroundQueue = DispatchQueue.global(qos: .background)

    private func startBackgroundTask() {
        backgroundTaskID = UIApplication.shared.beginBackgroundTask(withName: "BackgroundTask") {
            // End the background task if it is running when the time limit expires
            UIApplication.shared.endBackgroundTask(backgroundTaskID)
        }

        backgroundQueue.async {
            while navigationManager.currentView == .mainFrameView {
                // Run your background function here
                FirebaseManager.shared.readFriends()

                // Sleep for some interval before running the function again
                sleep(5)
                //test
                print("run")
            }

            // End the background task when the loop is finished
            UIApplication.shared.endBackgroundTask(backgroundTaskID)
            //test
            print("stop")
        }
    }
}
