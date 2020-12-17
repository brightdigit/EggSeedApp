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

enum ProductType {
  case library, executable
}
struct Product : Identifiable {
  let name : String
  let type: ProductType
  
  var id : String {
    return name
  }
}
struct ContentView: View {
  @State var products : [Product] = [.init(name: "BushelKit", type: .library), .init(name: "bushel", type: .executable)]
  @State var packageName : String = ""
    @Binding var document: eggseed_mac_appDocument

    var body: some View {
      
      VStack{
        Form{
          Section(header: Text("Package").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/), content: {
            TextField("Name", text: $packageName)
            Divider()
            Section(header: Text("Products")) {
              List(self.products) { product in
              
                HStack(content: {
                  Text(product.name)
                })
              }
              
              
            }
          })
        }.padding()
        List(self.products) { product in
        
          HStack(content: {
            Text(product.name)
          }).listRowInsets(EdgeInsets.init(top: 8, leading: 8, bottom: 8, trailing: 8))
        }.listStyle(InsetListStyle())
//        TextField("Template", value: $document.templateURL, formatter: URLFormatter())
//
//        Picker("License", selection: self.$document.license) {
//          ForEach(License.allCases) { (license) in
//            Text(license.rawValue)
//          }
//        }
//
//        ForEach(0..<ContinuousIntegrationSystem.allCases.count){
//          Toggle(ContinuousIntegrationSystem.allCases[$0].description, isOn: $document.ci[$0])
//        }
        
        
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(eggseed_mac_appDocument()))
    }
}
