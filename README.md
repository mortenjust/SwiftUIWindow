# SwiftUIWindow
Open a new macOS (10.12+) window with SwiftUI contents. Note: macOS Ventura (fall 2022) has [new ways of creating windows from SwiftUI](https://developer.apple.com/documentation/swiftui/window). 

# Installing
Paste this repo's URL into your Package Dependencies

# Demo
![Creating a SwiftUI image](/demo.gif)


# Usage
```
import SwiftUIWindow
```

## Simple standard window
```swift
  SwiftUIWindow.open { _ in 
        Text("Hello new window")
        .frame(width: 400, height: 200) // window size        
    }                                
```

## Using modifiers
This will open a floating window with no standard macOS window UI. You can move the window by dragging anywhere in the visible area.

```swift
  SwiftUIWindow.open { _ in 
        VStack { 
            Text("Hello")
            Button("Click me") { print("clicked") }
        }
        .frame(minWidth: 400, maxWidth: .infinity, minHeight: 200, maxHeight: .infinity)                     
    }                
    .style(.borderless)
    .clickable(true)
    .mouseMovesWindow(true)
    .transparentBackground(true)
    .alwaysOnTop(true)
```
