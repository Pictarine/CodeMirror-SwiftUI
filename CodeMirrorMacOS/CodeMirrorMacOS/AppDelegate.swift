//
//  AppDelegate.swift
//  CodeMirrorMacOS
//
//  Created by Anthony Fernandez on 8/28/20.
//  Copyright © 2020 marshallino16. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
  
  var window: NSWindow!
  
  
  func applicationDidFinishLaunching(_ aNotification: Notification) {
    
    let contentView = ContentView()
    
    window = NSWindow(
      contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
      styleMask: [.fullSizeContentView,
                  .titled, .closable,
                  .miniaturizable,
                  .resizable,],
      backing: .buffered, defer: false)
    window.center()
    window.setFrameAutosaveName("Main Window")
    window.contentView = NSHostingView(rootView: contentView)
    window.makeKeyAndOrderFront(nil)
  }
  
  func applicationWillTerminate(_ aNotification: Notification) {
    // N/A
  }
  
  
}

