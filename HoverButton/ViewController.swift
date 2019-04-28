//
//  ViewController.swift
//  HoverButton
//
//  Created by 陳劭任 on 2019/4/28.
//  Copyright © 2019 陳劭任. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet var btn1: HoverButton!
    @IBOutlet var btn2: HoverButton!
    @IBOutlet var btn3: HoverButton!
    @IBOutlet var btn4: HoverButton!
    @IBOutlet var btn5: HoverButton!
    
    var hoverButtons = [HoverButton]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.hoverButtons.append(contentsOf: [btn1, btn2, btn3, btn4, btn5])
        
    }

    override var representedObject: Any? {
        didSet {
        }
    }


    private func clearOtherBtns(_ clickBtn: HoverButton) {
        
        for btn in self.hoverButtons {
            
            if btn == clickBtn { continue }
            
            btn.state = .off
            
            btn.isEnabled = true
            
        }
        
    }
    
    @IBAction func selectedHoverButton(_ sender: HoverButton) {
        
        self.clearOtherBtns(sender)
        
        sender.isEnabled = false
        
    }
}

