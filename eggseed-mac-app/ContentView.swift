//
//  ContentView.swift
//  eggseed-mac-app
//
//  Created by Leo Dion on 12/16/20.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: eggseed_mac_appDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(eggseed_mac_appDocument()))
    }
}
