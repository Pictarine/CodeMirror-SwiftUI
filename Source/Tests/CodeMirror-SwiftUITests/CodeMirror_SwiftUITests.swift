
@testable import CodeMirror_SwiftUI
import XCTest

final class CodeMirror_SwiftUITests: XCTestCase {
  
    func testBundlePresent() {
      
      let classBundle = Bundle(for: CodeMirrorViewController.self)
      let url = classBundle.url(forResource: "CodeMirrorView", withExtension: "bundle")!
      XCTAssertNotNil(url)
    }

    static var allTests = [
        ("testBundlePresent", testBundlePresent),
    ]
}
