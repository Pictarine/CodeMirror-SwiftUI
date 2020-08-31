//
//  File.swift
//  
//
//  Created by Anthony Fernandez on 8/31/20.
//

import Foundation

extension Bundle {
  static func codeMirrorBundle() throws -> Bundle {
    let bundle = Bundle.module
    guard let bundlePath = bundle.resourceURL?.appendingPathComponent("CodeMirrorView", isDirectory: false).appendingPathExtension("bundle") else {
      throw NSError(domain: "com.codeMirror-SwiftUI", code: 404, userInfo: [NSLocalizedDescriptionKey: "Missing resource bundle"])
    }
    
    guard let codeMirrorbundle = Bundle(url: bundlePath) else {
      throw NSError(domain: "com.codeMirror-SwiftUI", code: 404, userInfo: [NSLocalizedDescriptionKey: "Missing resource bundle"])
    }
    return codeMirrorbundle
  }
}
