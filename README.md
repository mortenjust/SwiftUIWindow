# SwiftUIWindow

Open a new macOS (10.12+) window with SwiftUI contents. 


# Installing
Paste this repo's URL into your Package Dependencies

# Usage
```swift
  SwiftUIWindow.open {
                    MyView()
                    .frame(width: 400, height: 200) 
                    // this will be the window size. Use maxWidth .infinity to allow resizing
                    
                }
                // a few examples of modifiers
                .style(.borderless)
                .clickable(true)
                .mouseMovesWindow(true)
                .transparentBackground(true)
                .alwaysOnTop(true)
```
