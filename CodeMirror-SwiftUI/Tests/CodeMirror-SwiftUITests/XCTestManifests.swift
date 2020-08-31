import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(CodeMirror_SwiftUITests.allTests),
    ]
}
#endif
