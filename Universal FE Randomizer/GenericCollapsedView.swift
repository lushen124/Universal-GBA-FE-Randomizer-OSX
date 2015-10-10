//
//  RandomizeGrowthsCollapsedView.swift
//  Universal FE Randomizer
//
//  Created by Shen Lu on 10/3/15.
//  Copyright © 2015 Shen Lu. All rights reserved.
//

import Cocoa

class GenericCollapsedView: NSView {
    
    var masterEnable: NSButton
    var descriptionLabel: NSTextField
    
    override var intrinsicContentSize: NSSize {
        get {
            return NSMakeSize(self.masterEnable.intrinsicContentSize.width + self.descriptionLabel.intrinsicContentSize.width + 200.0, max(self.masterEnable.intrinsicContentSize.height, self.descriptionLabel.intrinsicContentSize.height) + 10.0 * 2)
        }
    }
    
    init() {
        
        self.masterEnable = NSButton.init()
        
        self.masterEnable.title = "Randomize Growths"
        self.masterEnable.setButtonType(NSButtonType.SwitchButton)
        self.masterEnable.state = NSOffState
        
        self.descriptionLabel = NSTextField.init(frame: NSZeroRect)
        
        self.descriptionLabel.stringValue = "Disabled"
        self.descriptionLabel.bordered = false
        self.descriptionLabel.editable = false
        self.descriptionLabel.textColor = NSColor.lightGrayColor()
        self.descriptionLabel.font = NSFontManager.sharedFontManager().fontWithFamily("Helvetica", traits: NSFontTraitMask.ItalicFontMask, weight: 0, size: 12)
        
        super.init(frame: NSZeroRect)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.masterEnable.translatesAutoresizingMaskIntoConstraints = false
        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(self.masterEnable)
        self.addSubview(self.descriptionLabel)
        
        self.masterEnable.setContentHuggingPriority(NSLayoutPriorityRequired, forOrientation: NSLayoutConstraintOrientation.Horizontal)
        
//        NSLayoutConstraint.init(item: self.masterEnable, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 10.0).active = true
//        NSLayoutConstraint.init(item: self.descriptionLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 10.0).active = true
        
        NSLayoutConstraint.init(item: self.masterEnable, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 5.0).active = true
        NSLayoutConstraint.init(item: self.descriptionLabel, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 200.0).active = true
        
        NSLayoutConstraint.init(item: self.descriptionLabel, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: -10.0).active = true
        
//        NSLayoutConstraint.init(item: self.descriptionLabel, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -10.0).active = true
        
        NSLayoutConstraint.init(item: self.masterEnable, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint.init(item: self.descriptionLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0).active = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        // Drawing code here.
    }
}
