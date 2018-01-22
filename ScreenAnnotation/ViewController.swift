//
//  ViewController.swift
//  ScreenAnnotation
//
//  Created by Derrick Ho on 1/22/18.
//  Copyright © 2018 Derrick Ho. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var clearButton: NSMenuItem!
    @IBOutlet weak var toggleButton: NSMenuItem!
    @IBOutlet var optionsMenu: NSMenu!
    
    let lineWeight: CGFloat = 10
    let strokeColor: NSColor = .red
    var currentPath: NSBezierPath?
    var currentShape: CAShapeLayer?
    
    private let offText = "Disable Drawing"
    private let onText = "Enable Drawing"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.frame = CGRect(origin: CGPoint(), size: NSScreen.main!.visibleFrame.size)
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func startDrawing(at point: NSPoint) {
        currentPath = NSBezierPath()
        currentShape = CAShapeLayer()
        
        currentShape?.lineWidth = lineWeight
        currentShape?.strokeColor = strokeColor.cgColor
        currentShape?.fillColor = NSColor.clear.cgColor
        
        currentShape?.lineJoin = kCALineCapRound
        currentShape?.lineCap = kCALineCapRound
        
        currentPath?.move(to: point)
        currentPath?.line(to: point)
        
        currentShape?.path = currentPath?.cgPath
        
        view.layer?.addSublayer(currentShape!)
    }
    
    func continueDrawing(at point: NSPoint) {
        currentPath?.line(to: point)
        
        if let shape = currentShape {
            shape.path = currentPath?.cgPath
        }
    }
    
    func endDrawing(at point: NSPoint) {
        currentPath?.line(to: point)
        
        if let shape = currentShape {
            shape.path = currentPath?.cgPath
        }
        
        currentPath = nil
        currentShape = nil
    }

    // MARK: - Actions
    
    @IBAction func clearButtonClicked(_ sender: Any) {
        view.window!.ignoresMouseEvents = !view.window!.ignoresMouseEvents
        toggleButton.title = view.window!.ignoresMouseEvents ? onText : offText
    }
    
    @IBAction func toggleButtonClicked(_ sender: Any) {
    }
    
}

