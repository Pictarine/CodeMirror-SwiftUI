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
  @State private var fontSize = 12
  @State private var showInvisibleCharacters = true
  
  private var themes = CodeViewTheme.allCases.sorted {
    return $0.rawValue < $1.rawValue
  }
  
  var body: some View {
    VStack {
      HStack {
        Picker(selection: $selectedTheme, label: EmptyView()) {
          ForEach(0 ..< themes.count) {
            Text(self.themes[$0].rawValue)
          }
        }
        .frame(minWidth: 100, idealWidth: 150, maxWidth: 150)
        
        Spacer()
        
        Toggle(isOn: $showInvisibleCharacters) {
          Text("Show invisible chars.")
        }
        .padding(.trailing, 8)
        
        Text("Font Size")
        
        Button(action: { fontSize -= 1}) {
          Image("minus")
            .resizable()
            .scaledToFit()
          
        }
        .buttonStyle(PlainButtonStyle())
        .frame(width: 20, height: 20)
        
        Button(action: { fontSize += 1}) {
          Image("plus")
            .resizable()
            .scaledToFit()
        }
        .buttonStyle(PlainButtonStyle())
        .frame(width: 20, height: 20)
      }
      .padding()
      GeometryReader { reader in
        ScrollView {
          CodeView(theme: themes[selectedTheme],
                   code: $codeBlock,
                   mode: codeMode,
                   fontSize: fontSize,
                   showInvisibleCharacters: showInvisibleCharacters)
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
