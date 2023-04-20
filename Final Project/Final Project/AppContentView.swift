//
//  AppContentView.swift
//  Final Project
//
//  Created by Andy Li on 4/19/23.
//

import SwiftUI

struct AppContentView: View {
    @State var logInStatus = false
    @State var getStartedStatus = false
    @State var mainPageStatus = false
    var body: some View {
        return Group {
            if logInStatus {
                if mainPageStatus {
                    MainFrameView()
                } else {
                    LogInView(mainPageStatus: $mainPageStatus)
                }
            } else {
                ContentView(logInStatus: $logInStatus, getStartedStatus: $getStartedStatus)
            }
        }
    }
}

struct AppContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppContentView()
    }
}
