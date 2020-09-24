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
  @State private var fontSize = 12
  @State private var lineWrapping = true
  
  private var themes = CodeViewTheme.allCases.sorted {
    return $0.rawValue < $1.rawValue
  }
  
  var body: some View {
    VStack {
      HStack {
        Picker(selection: $selectedTheme, label: Text("CodeView Theme")) {
          ForEach(0 ..< themes.count) {
            Text(self.themes[$0].rawValue)
          }
        }
        .pickerStyle(MenuPickerStyle())
        .frame(minWidth: 100, idealWidth: 150, maxWidth: 150)

        Spacer()

        Button(action: { lineWrapping.toggle() }) { Text("Wrap") }
        
        Spacer()
        
        Text("Font Size")
        
        Button(action: { fontSize -= 1}) {
          Image("minus")
            .resizable()
            .renderingMode(.template)
            .foregroundColor(.black)
            .scaledToFit()
        }
        .buttonStyle(PlainButtonStyle())
        .frame(width: 20, height: 20)
        
        Button(action: { fontSize += 1}) {
          Image("plus")
            .resizable()
            .renderingMode(.template)
            .foregroundColor(.black)
            .scaledToFit()
        }
        .buttonStyle(PlainButtonStyle())
        .frame(width: 20, height: 20)
      }
      
      .padding()
      CodeView(theme: themes[selectedTheme],
               code: $codeBlock,
               mode: codeMode,
               fontSize: fontSize,
               lineWrapping: lineWrapping)
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
