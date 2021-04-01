CodeMirror-SwiftUI
==================

![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/Pictarine/CodeMirror-SwiftUI)
[![Swift Package Manager](https://img.shields.io/badge/SPM-Compatible-brightgreen.svg?style=flat)](https://swift.org/package-manager)
![Swift5](https://img.shields.io/badge/Swift-5-orange.svg)
![Platform](https://img.shields.io/badge/platform-iOS|macOS-blue.svg?style=flat)
![GitHub repo size](https://img.shields.io/github/repo-size/Pictarine/CodeMirror-SwiftUI)


![CodeMirror-SwiftUI](https://user-images.githubusercontent.com/1506323/91988828-08cbab80-ed30-11ea-9d6f-1ae9660b9796.png)


CodeMirror-SwiftUI is a lightweight wrapper of CodeMirror for macOS and iOS packaged for SwiftUI. 

This package is a fork from [CodeMirror-Swift](https://github.com/ProxymanApp/CodeMirror-Swift)

## Features
- 🍭 Lightweight CodeMirror wrapper (build 5.59.4)
- ✅ 100% Native Swift 5 and modern WKWebView
- 👑 Support iOS & macOS
- 🎧 Built-in addons
- 📕 100+ built-in themes and syntax highlight modes
- ⚡️ Ready to go


## Requirements

- Xcode 12
- Swift 5.3


## Integration

CodeMirror-SwiftUI is available via [Swift Package Manager](https://swift.org/package-manager/)

Using Xcode 12, go to `File -> Swift Packages -> Add Package Dependency` and enter [https://github.com/Pictarine/CodeMirror-SwiftUI](https://github.com/Pictarine/CodeMirror-SwiftUI)

## Usage 

`CodeMirror` gives you access to a new view called `CodeView`. It can be integrated within your view `body` like this : 

```swift
CodeView(theme: themes[selectedTheme],
         code: $codeBlock,
         mode: codeMode,
         fontSize: fontSize,
         showInvisibleCharacters: showInvisibleCharacters,
         lineWrapping: lineWrapping)
.onLoadSuccess {
  print("Loaded")
}
.onContentChange { newCodeBlock in
  print("Content Change")
}
.onLoadFail { error in
  print("Load failed : \(error.localizedDescription)")
}
```

## Details


#### Code Editor Features

- CodeMirror v5.59.4
- Better find and replace dialog integration
- Autocompletion hints (ctrl+space)
- Reindent (ctrl+i)
- Auto close tags and brackets


#### Parameters

CodeView has multiple params:

| Parameter name          | Optional | Type            | Default             |
|-------------------------|----------|-----------------|---------------------|
| code                    | false    | Binding<String> |                     |
| mode                    | false    | Mode            |                     |
| theme                   | true     | CodeViewTheme   | \.materialPalenight |
| fontSize                | true     | Int             | 12 \(px\)           |
| showInvisibleCharacters | true     | Bool            | true                |
| lineWrapping            | true     | Bool            | true                |



#### Modifiers 

CodeView comes with three modifiers 

```swift
onLoadSuccess { ... }
```

```swift
onLoadFail { ... }
```
```swift
onContentChange { ... }
```

## Demo 

- [macOS Demo](https://github.com/Pictarine/CodeMirror-SwiftUI/tree/master/Demo-macOS) and [iOS Demo](https://github.com/Pictarine/CodeMirror-SwiftUI/tree/master/Demo-iOS) are available 

- [Snip](https://github.com/Pictarine/macos-snippets), a snippet manager for macOS is also using CodeMirror-SwiftUI

[![black_light_theme](https://user-images.githubusercontent.com/1506323/110323754-5560ae00-8015-11eb-98a3-7822772cbe00.png)](https://github.com/Pictarine/macos-snippets)


## License

CodeMirror-SwiftUI is available under the MIT license. See the LICENSE file for more info.


