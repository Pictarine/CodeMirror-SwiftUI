//
//  ContentView.swift
//  Demo-iOS
//
//  Created by Anthony Fernandez on 8/31/20.
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
      .pickerStyle(MenuPickerStyle())
      .padding()
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
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
