//
//  HostingView.swift
//  BigArea
//
//  Created by Morten Just on 3/8/22.
//

import Foundation
import SwiftUI

class HostingView<Content> : NSHostingView<Content> where Content : View {
    
    var mouseMovesWindow = false
    
    override public func mouseDown(with event: NSEvent) {
        guard mouseMovesWindow else { return }
            window?.performDrag(with: event)
       }
}
