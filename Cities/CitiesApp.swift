//
//  CitiesApp.swift
//  Cities
//
//  Created by Данила on 05.01.2023.
//

import SwiftUI

@main
struct CitiesApp: App {
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(Model())
        }
        .onChange(of: scenePhase) { newScenePhase in
              switch newScenePhase {
              case .active:
                  print("cds")
              case .inactive:
                print("App is inactive")
              case .background:
                print("App is in background")
              @unknown default:
                print("Oh - interesting: I received an unexpected new value.")
              }
            }
    }
}
