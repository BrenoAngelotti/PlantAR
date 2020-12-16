//
//  AppDelegate.swift
//  PlantAR
//
//  Created by Breno Angelotti on 26/09/20.
//

import SwiftUI
import CoreSpotlight

@main
struct PlantARApp: App {
    @State var plantId: String?
    
    var body: some Scene {
        WindowGroup {
            ContentView(activityPlantId: $plantId)
                .onContinueUserActivity(CSSearchableItemActionType, perform: handleSpotlight)
        }
    }
    
    func handleSpotlight(_ userActivity: NSUserActivity){
        if let id = userActivity.userInfo?[CSSearchableItemActivityIdentifier] as? String {
            plantId = id
        }
    }
}
