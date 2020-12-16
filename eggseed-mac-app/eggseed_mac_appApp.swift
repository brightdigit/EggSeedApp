//
//  eggseed_mac_appApp.swift
//  eggseed-mac-app
//
//  Created by Leo Dion on 12/16/20.
//

import SwiftUI

@main
struct eggseed_mac_appApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: eggseed_mac_appDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
