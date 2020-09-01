//
//  ContentView.swift
//  CodeMirroriOS
//
//  Created by Anthony Fernandez on 8/31/20.
//

import SwiftUI
import CodeMirror_SwiftUI

struct ContentView: View {
  
  @State private var codeTheme = "material-palenight"
  @State private var codeBlock = try! String(contentsOf: Bundle.main.url(forResource: "Demo", withExtension: "txt")!)
  @State private var codeMode = CodeMode.swift.mode()
  
  var body: some View {
    CodeView(theme: codeTheme,
             code: codeBlock,
             mode: codeMode)
      .onLoadSuccess {
        print("Loaded")
      }
      .onContentChange { newCode in
        print("Content Change")
      }
      .onLoadFail { error in
        print("Load failed : \(error.localizedDescription)")
      }
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
