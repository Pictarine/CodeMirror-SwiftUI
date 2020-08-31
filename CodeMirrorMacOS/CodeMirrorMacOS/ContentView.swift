//
//  ContentView.swift
//  CodeMirrorMacOS
//
//  Created by Anthony Fernandez on 8/28/20.
//  Copyright © 2020 marshallino16. All rights reserved.
//

import SwiftUI
import CodeMirror_SwiftUI

struct ContentView: View {
  
  @State private var codeTheme = "material-palenight"
  @State private var codeBlock = try! String(contentsOf: Bundle.main.url(forResource: "Demo", withExtension: "txt")!)
  @State private var codeMode = CodeMode.swift.mode()
  
  var body: some View {
    GeometryReader { reader in
      ScrollView {
        CodeView(theme: codeTheme,
                 code: codeBlock,
                 mode: codeMode)
          .frame(height: reader.size.height)
          .tag(1)
      }.frame(height: reader.size.height)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
