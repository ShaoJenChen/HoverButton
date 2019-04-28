//
//  HoverButton.swift
//  HoverButton
//
//  Created by 陳劭任 on 2019/4/28.
//  Copyright © 2019 陳劭任. All rights reserved.
//

import Cocoa

class HoverButton: NSButton {
    
    @IBInspectable var hoverImage: NSImage!
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        
        self.addObserver(self, forKeyPath: "cell.state", options: .new, context: nil)
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        self.isEnabled = !Bool(truncating: NSNumber(value: self.state.rawValue))
        
        if self.state == .on { swap(&self.image!, &self.hoverImage) }

    }
    
    override func updateTrackingAreas() {
        
        super.updateTrackingAreas()
        
        let options: NSTrackingArea.Options = [.inVisibleRect ,.mouseEnteredAndExited, .activeInKeyWindow]
        
        let trackingArea = NSTrackingArea(rect: NSRect.zero, options: options, owner: self, userInfo: nil)
        
        self.addTrackingArea(trackingArea)
        
    }
    
    override func mouseEntered(with event: NSEvent) {
        
        super.mouseEntered(with: event)
        
        guard self.isEnabled else { return }
        
        if self.state == .off { swap(&self.image!, &self.hoverImage) }
        
        
    }
    
    override func mouseExited(with event: NSEvent) {
        
        super.mouseExited(with: event)
        
        guard self.isEnabled else { return }
        
        if self.state == .off { swap(&self.image!, &self.hoverImage) }
        
    }
    
}
