//
//  SwiftUIWindow.swift
//  BigArea
//
//  Created by Morten Just on 3/8/22.
//

import Foundation
import AppKit
import SwiftUI



public class SwiftUIWindow<Content> : NSWindow where Content: View {
    
    var windowModifier : WindowModifier<Content>!
    var hostingView : HostingView<Content>
    
    public init(@ViewBuilder content: () -> Content) {
        hostingView = HostingView(rootView: content())
        super.init(contentRect: .zero, styleMask: [.titled, .closable, .miniaturizable, .resizable], backing: .buffered, defer: true)
        contentView = hostingView
        
        windowModifier = WindowModifier(window: self)
    }
}


extension SwiftUIWindow {
    
    @discardableResult
    public static func open(@ViewBuilder content: () -> Content) -> WindowModifier<Content> {
        let window = SwiftUIWindow(content: content)
        let wc = NSWindowController(window: window)
        
        print("showing window")
        wc.showWindow(nil)
        
        window.center()
        
        return window.windowModifier
    }
}
