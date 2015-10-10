//
//  AppDelegate.swift
//  Universal FE Randomizer
//
//  Created by Shen Lu on 10/1/15.
//  Copyright © 2015 Shen Lu. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    
    var mainVC: MainViewController!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        mainVC = MainViewController(nibName: "MainViewController", bundle: nil)
        window.contentView?.addSubview(mainVC.view)
        mainVC.view.frame = window.contentView!.bounds
        
        // Make sure the main view controller always stretches to match the window's size.
        mainVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.init(item: mainVC.view, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: window.contentView, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint.init(item: mainVC.view, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: window.contentView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint.init(item: mainVC.view, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: window.contentView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint.init(item: mainVC.view, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: window.contentView, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 0.0).active = true
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

