//
//  WindowModifier.swift
//  BigArea
//
//  Created by Morten Just on 3/8/22.
//

import Foundation
import AppKit
import SwiftUI

public struct WindowModifier<Content> where Content: View {
    public let window : SwiftUIWindow<Content>
    
    
    @discardableResult
    public func style(_ style : NSWindow.StyleMask) -> WindowModifier {
        window.styleMask = style
        return self
    }
    
    @discardableResult
    public func position(_ position : NSPoint) -> WindowModifier {
        window.setFrameOrigin(position)
        return self
    }
    
    @discardableResult
    public func position(x : CGFloat) -> WindowModifier {
        window.setFrameOrigin(CGPoint(x: x, y: window.frame.origin.y))
        return self
    }
    
    @discardableResult
    public func position(y : CGFloat) -> WindowModifier {
        window.setFrameOrigin(CGPoint(x: window.frame.origin.x, y: y))
        return self
    }
    
    @discardableResult
    public func position(x : CGFloat, y : CGFloat) -> WindowModifier {
        window.setFrameOrigin(CGPoint(x: x, y: y))
        return self
    }
    
    @discardableResult
    public func alwaysOnTop(_ floating : Bool) -> WindowModifier {
        window.level = floating ? .floating : .normal
        return self
    }
    
    @discardableResult
    public func level(_ level : NSWindow.Level) -> WindowModifier {
        window.level = level
        return self
    }
    
    @discardableResult
    public func movable(_ movable : Bool) -> WindowModifier {
        window.isMovable = movable
        return self
    }
    
    @discardableResult
    public func opacity(_ opacity : CGFloat) -> WindowModifier {
        window.alphaValue = opacity
        return self
    }
    
    @discardableResult
    public func backgroundColor(_ color : NSColor) -> WindowModifier {
        window.backgroundColor = color
        return self
    }
    
    @discardableResult
    public func transparentBackground(_ transparent : Bool) -> WindowModifier {
        if transparent { window.backgroundColor = .clear }
        return self
    }
    
    @discardableResult
    public func shadow(_ shadow : Bool) -> WindowModifier {
        window.hasShadow = shadow
        return self
    }
    
    
    @discardableResult
    public func closeOnEscape(_ close: Bool) -> WindowModifier {
        
        func localPress(_ event: NSEvent) -> NSEvent? {
            press(event); return event
        }
        
        func press(_ event : NSEvent) {
            if event.keyCode == 53 {
                window.close()
            }
        }
        
        NSEvent.addGlobalMonitorForEvents(matching: .keyDown, handler: press(_:))
        NSEvent.addLocalMonitorForEvents(matching: .keyDown, handler: localPress(_:))
        
        return self
    }
    
    
    @discardableResult
    public func onKeyPresses(modifiers: NSEvent.ModifierFlags?, specialKeys: NSEvent.SpecialKey?, keyCode: UInt16, perform: @escaping (NSWindow) -> Void) -> WindowModifier {
        
        func localPress(_ event: NSEvent) -> NSEvent? {
            press(event); return event
        }
        
        func press(_ event : NSEvent) {
            
            let hasModifiers = event.modifierFlags == modifiers
            let hasSpecials = event.specialKey == event.specialKey
            let hasKeycode = event.keyCode == keyCode
            
            if hasModifiers && hasSpecials && hasKeycode {
                NSEvent.removeMonitor(self)
                perform(window)
            }
        }
        
        NSEvent.addGlobalMonitorForEvents(matching: .keyDown, handler: press(_:))
        NSEvent.addLocalMonitorForEvents(matching: .keyDown, handler: localPress(_:))
        
        return self
    }
    
    @discardableResult
    public func clickable(_ clickable : Bool) -> WindowModifier {
        window.ignoresMouseEvents = !clickable
        return self
    }
    
    @discardableResult
    public func aspect(_ width : CGFloat, to height: CGFloat) -> WindowModifier {
        window.aspectRatio = NSSize(width: width, height: height)
        return self
    }
    
    @discardableResult
    public func mouseMovesWindow(_ moves : Bool) -> WindowModifier {
        window.hostingView.mouseMovesWindow = moves
        return self
    }
}
