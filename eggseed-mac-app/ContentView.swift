//
//  ContentView.swift
//  eggseed-mac-app
//
//  Created by Leo Dion on 12/16/20.
//

import SwiftUI
import EggSeedKit

extension License : Identifiable {
  public var id: String {
    return self.rawValue
  }
  
  
}

enum Topping: String, CaseIterable, Identifiable {
    case nuts
    case cookies
    case blueberries

    var id: String { self.rawValue }
}

extension ContinuousIntegrationSystem : Identifiable {
  public var id: Int {
    return self.rawValue
  }
}

class URLFormatter : Formatter {
  override func string(for obj: Any?) -> String? {
    guard let url = obj as? URL else {
      return nil
    }
    
    return url.absoluteString
  }
  
  override func getObjectValue(_ obj: AutoreleasingUnsafeMutablePointer<AnyObject?>?, for string: String, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
    guard let url = URL(string: string) else {
      return false
    }
    
    obj?.pointee = url as AnyObject
    return true
  }
}
struct ContentView: View {
  
  @State var topping : Topping = .nuts
    @Binding var document: eggseed_mac_appDocument

    var body: some View {
      VStack{
        TextField("Template", value: $document.templateURL, formatter: URLFormatter())
        Picker("License", selection: self.$topping) {
          ForEach(Topping.allCases) { (topping) in
            Text(topping.rawValue)
          }
        }
        
        ForEach(0..<ContinuousIntegrationSystem.allCases.count){
          Toggle(ContinuousIntegrationSystem.allCases[$0].description, isOn: $document.ci[$0])
        }
        Text(self.topping.rawValue)
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(eggseed_mac_appDocument()))
    }
}
