//
//  ContentView.swift
//  Demo-macOS
//
//  Created by Anthony Fernandez on 8/28/20.
//  Copyright © 2020 marshallino16. All rights reserved.
//

import SwiftUI
import CodeMirror_SwiftUI

struct ContentView: View {
  
  @State private var codeBlock = try! String(contentsOf: Bundle.main.url(forResource: "Demo", withExtension: "txt")!)
  @State private var codeMode = CodeMode.swift.mode()
  @State private var selectedTheme = 0
  
  private var themes = CodeViewTheme.allCases.sorted {
    return $0.rawValue < $1.rawValue
  }
  
  var body: some View {
    VStack {
      Picker(selection: $selectedTheme, label: Text("Please choose a theme")) {
        ForEach(0 ..< themes.count) {
          Text(self.themes[$0].rawValue)
        }
      }
      .padding()
      GeometryReader { reader in
        ScrollView {
          CodeView(theme: themes[selectedTheme],
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
            .frame(height: reader.size.height)
            .tag(1)
        }.frame(height: reader.size.height)
      }
    }
    
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
