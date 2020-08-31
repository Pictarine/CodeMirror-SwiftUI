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
  
  @State private var codeBlock = try! String(contentsOf: Bundle.main.url(forResource: "Demo", withExtension: "txt")!)
  @State private var codeMode = CodeMode.swift.mode()
  
  private var themes = ["bbedit",
                       "all-hallow-eve",
                       "idlefingers",
                       "spacecadet",
                       "idle",
                       "oceanic",
                       "clouds",
                       "github",
                       "ryan-light",
                       "black-pearl",
                       "monoindustrial",
                       "happy-happy-joy-joy-2",
                       "cube2media",
                       "friendship-bracelet",
                       "classic-modified",
                       "amy",
                       "demo",
                       "rdark",
                       "espresso",
                       "sunburst",
                       "made-of-code",
                       "arona",
                       "putty",
                       "nightlion",
                       "sidewalkchalk",
                       "swyphs-ii",
                       "iplastic",
                       "solarized-(light)",
                       "mac-classic",
                       "pastels-on-dark",
                       "ir_black",
                       "material",
                       "monokai-fannonedition",
                       "monokai-bright",
                       "eiffel",
                       "base16-light",
                       "oceanic-muted",
                       "summerfruit",
                       "espresso-libre",
                       "krtheme",
                       "mreq",
                       "chanfle",
                       "venom",
                       "juicy",
                       "coda",
                       "fluidvision",
                       "tomorrow-night-blue",
                       "magicwb-(amiga)",
                       "twilight",
                       "vibrant-ink",
                       "summer-sun",
                       "monokai",
                       "rails-envy",
                       "merbivore",
                       "dracula",
                       "pastie",
                       "lowlight",
                       "spectacular",
                       "smoothy",
                       "vibrant-fin",
                       "blackboard",
                       "slush-&-poppies",
                       "freckle",
                       "fantasyscript",
                       "tomorrow-night-eighties",
                       "rhuk",
                       "toy-chest",
                       "fake",
                       "emacs-strict",
                       "merbivore-soft",
                       "fade-to-grey",
                       "monokai-sublime",
                       "johnny",
                       "railscasts",
                       "argonaut",
                       "tomorrow-night-bright",
                       "lazy",
                       "tomorrow-night",
                       "bongzilla",
                       "toulousse-lautrec",
                       "glitterbomb",
                       "ir_white",
                       "zenburnesque",
                       "notebook",
                       "django-(smoothy)",
                       "blackboard-black",
                       "black-pearl-ii",
                       "kuroir",
                       "cobalt",
                       "ayu-mirage",
                       "chrome-devtools",
                       "prospettiva",
                       "espresso-soda",
                       "birds-of-paradise",
                       "text-ex-machina",
                       "django",
                       "tomorrow",
                       "solarized-(dark)",
                       "plasticcodewrap",
                       "material-palenight",
                       "bespin",
                       "espresso-tutti",
                       "vibrant-tango",
                       "tubster",
                       "darkpastel",
                       "dawn",
                       "tango",
                       "clouds-midnight"]
  
  @State private var selectedTheme = 0
  
  var body: some View {
    VStack {
      Picker(selection: $selectedTheme, label: Text("Please choose a theme")) {
        ForEach(0 ..< themes.count) {
          Text(self.themes[$0])
        }
      }
      .padding()
      GeometryReader { reader in
        ScrollView {
          CodeView(theme: themes[selectedTheme],
                   code: codeBlock,
                   mode: codeMode)
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
