# SwiftUIWindow

Open a new macOS (10.12+) window with SwiftUI contents. 


# Installing
Paste this repo's URL into your Package Dependencies

# Demo
![Creating a SwiftUI image](/demo.gif)


# Usage

## Simple stnadard window
```swift
  SwiftUIWindow.open {
                    MyView()
                    .frame(width: 400, height: 200) 
                    // this will be the window size. Use maxWidth .infinity to allow resizing
                    
                }                                
```

## Using modifiers
This will open a floating window with no standard macOS window UI. You can move the window by dragging anywhere in the visible area.

```swift
  SwiftUIWindow.open {
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
