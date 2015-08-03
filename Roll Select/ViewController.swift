//
//  ViewController.swift
//  Roll Select
//
//  Created by kyz on 15/8/3.
//  Copyright © 2015年 BUAA.Software. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    var isClicked: Bool = false
    var times: Int = 0 {
        didSet {
            passedLable.stringValue = "已点名次数: \(times)次"
        }
    }
    
    //change these to change database...
    let totalNumber = 60
    let totalRow = 8
    
    @IBOutlet weak var lastResultLable: NSTextField!

    @IBOutlet weak var resultLable: NSTextField!
    
    @IBAction func startButton(sender: NSButton) {
        if !isClicked {
            isClicked = true
            let rand = Int(arc4random()) % totalNumber
            let row = rand % totalRow + 1
            let col = rand / totalRow + 1
            resultLable.stringValue = "行：\(row) 列：\(col)"
            times++
        }
    }
    
    @IBAction func resetButton(sender: NSButton) {
        if isClicked {
            isClicked = false
            lastResultLable.stringValue = resultLable.stringValue
            resultLable.stringValue = ""
        }
    }
    
    @IBOutlet weak var passedLable: NSTextField!
}

