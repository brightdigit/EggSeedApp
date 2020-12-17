//
//  eggseed_mac_appDocument.swift
//  eggseed-mac-app
//
//  Created by Leo Dion on 12/16/20.
//

import SwiftUI
import EggSeedKit
import UniformTypeIdentifiers

extension UTType {
  static var exampleText: UTType {
    UTType(importedAs: "com.example.plain-text")
  }
}

struct eggseed_mac_appDocument: FileDocument {
  public var license: License
  var ci: [Bool] = [Bool].init(repeating: true, count: ContinuousIntegrationSystem.allCases.count)
  
  var komondor: Bool = true
  var rocket: Bool = true
  public var templateURL: URL = URL(string: "https://github.com/brightdigit/eggseed-template/archive/master.zip")!
  
  // sourcedocs or jazzy
  var documentation: DocumentationTooling = .sourcedocs
  
  // swiftformat or/and swiftlint danger etc...
  public var linters: StylingToolOption = .all
  public var packageType: SwiftPackageType = .library
  public var userName: String?
  init() {
    self.license = .mit
  }
  
  static var readableContentTypes: [UTType] { [.exampleText] }
  
  init(configuration: ReadConfiguration) throws {
    guard let data = configuration.file.regularFileContents,
          let string = String(data: data, encoding: .utf8)
    else {
      throw CocoaError(.fileReadCorruptFile)
    }
    self.license = .mit
  }
  
  func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
    let data = "".data(using: .utf8)!
    return .init(regularFileWithContents: data)
  }
}
