//
//  LabeledValueStepper.swift
//  Universal FE Randomizer
//
//  Created by Shen Lu on 10/5/15.
//  Copyright © 2015 Shen Lu. All rights reserved.
//

import Cocoa

protocol LabeledValueStepperDelegate: class {
    func labeledValueStepperDidChangeFromOldValueToNewValue(stepper: LabeledValueStepper, oldValue: NSInteger, newValue: NSInteger)
}

class LabeledValueStepper : NSView {
    
    override var intrinsicContentSize: NSSize {
        get {
            return NSMakeSize(titleLabel.intrinsicContentSize.width + 5.0 + valueField.intrinsicContentSize.width + 5.0 + stepper.intrinsicContentSize.width, max(max(titleLabel.intrinsicContentSize.height, valueField.intrinsicContentSize.height), stepper.intrinsicContentSize.height))
        }
    }
    
    weak var delegate : LabeledValueStepperDelegate? = nil
    
    var titleLabel: NSTextField
    var valueField: NSTextField
    var stepper: NSStepper
    
    var currentValue: Int = 0
    
    var title: String = "Title" {
        didSet {
            titleLabel.stringValue = title
            invalidateIntrinsicContentSize()
        }
    }
    
    var maxValue: Int = 100 {
        didSet {
            if (self.currentValue > maxValue && maxValue >= minValue) {
                let oldCurrentValue : NSInteger = self.currentValue
                self.currentValue = maxValue
                valueField.integerValue = maxValue
                stepper.integerValue = maxValue
                if (self.delegate != nil) {
                    self.delegate?.labeledValueStepperDidChangeFromOldValueToNewValue(self, oldValue: oldCurrentValue, newValue: self.currentValue)
                }
            }
            else if (maxValue < minValue) {
                self.maxValue = self.minValue
                
                if (self.currentValue > self.maxValue) {
                    let oldCurrentValue : NSInteger = self.currentValue
                    self.currentValue = self.maxValue
                    valueField.integerValue = maxValue
                    stepper.integerValue = maxValue
                    if (self.delegate != nil) {
                        self.delegate?.labeledValueStepperDidChangeFromOldValueToNewValue(self, oldValue: oldCurrentValue, newValue: self.currentValue)
                    }
                }
            }
            
            stepper.maxValue = Double(self.maxValue)
        }
    }
    
    var minValue: Int = 0 {
        didSet {
            if (self.currentValue < minValue && minValue <= maxValue) {
                let oldCurrentValue : NSInteger = self.currentValue
                self.currentValue = minValue
                valueField.integerValue = minValue
                stepper.integerValue = minValue
                if (self.delegate != nil) {
                    self.delegate?.labeledValueStepperDidChangeFromOldValueToNewValue(self, oldValue: oldCurrentValue, newValue: self.currentValue)
                }
            }
            else if (minValue > maxValue) {
                self.minValue = maxValue
                
                if (self.currentValue < self.minValue) {
                    let oldCurrentValue : NSInteger = self.currentValue
                    self.currentValue = self.minValue
                    valueField.integerValue = minValue
                    stepper.integerValue = minValue
                    if (self.delegate != nil) {
                        self.delegate?.labeledValueStepperDidChangeFromOldValueToNewValue(self, oldValue: oldCurrentValue, newValue: self.currentValue)
                    }
                }
            }
            
            stepper.minValue = Double(self.minValue)
        }
    }
    
    override init(frame frameRect: NSRect) {
        titleLabel = NSTextField.init(frame: NSZeroRect)
        valueField = NSTextField.init(frame: NSZeroRect)
        stepper = NSStepper.init(frame: NSZeroRect)
        
        super.init(frame: frameRect)
        
        setupConstraints()
    }
    
    init() {
        titleLabel = NSTextField.init(frame: NSZeroRect)
        valueField = NSTextField.init(frame: NSZeroRect)
        stepper = NSStepper.init(frame: NSZeroRect)
        
        super.init(frame: NSZeroRect)
    }

    required init?(coder: NSCoder) {
        titleLabel = NSTextField.init(frame: NSZeroRect)
        valueField = NSTextField.init(frame: NSZeroRect)
        stepper = NSStepper.init(frame: NSZeroRect)
        
        super.init(coder: coder)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        titleLabel.font = NSFontManager.sharedFontManager().fontWithFamily("Helvetica", traits: NSFontTraitMask.UnboldFontMask, weight: 0, size: 12)
        titleLabel.textColor = NSColor.blackColor()
        titleLabel.editable = false
        titleLabel.bordered = false
        titleLabel.backgroundColor = NSColor.clearColor()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
        
        valueField.bordered = true
        valueField.font = NSFontManager.sharedFontManager().fontWithFamily("Helvetica", traits: NSFontTraitMask.UnboldFontMask, weight: 0, size: 12)
        valueField.textColor = NSColor.blackColor()
        valueField.integerValue = self.currentValue
        valueField.delegate = self
        valueField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(valueField)
        
        stepper.action = Selector("onStepper:")
        stepper.target = self
        stepper.valueWraps = false
        stepper.minValue = Double(self.minValue)
        stepper.maxValue = Double(self.maxValue)
        stepper.increment = 1.0
        stepper.integerValue = self.currentValue
        stepper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stepper)
        
        NSLayoutConstraint.init(item: valueField, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 44.0).active = true
        
        NSLayoutConstraint.init(item: titleLabel, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint.init(item: titleLabel, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: valueField, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: -5.0).active = true
        NSLayoutConstraint.init(item: valueField, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: stepper, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: -2.0).active = true
        NSLayoutConstraint.init(item: stepper, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint.init(item: titleLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint.init(item: valueField, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint.init(item: stepper, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0).active = true
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func forceCurrentValue(newValue: NSInteger) {
        self.currentValue = newValue
        if (newValue < self.minValue) {
            self.minValue = newValue
        }
        if (newValue > self.maxValue) {
            self.maxValue = newValue
        }
        
        self.stepper.integerValue = newValue
        self.valueField.integerValue = newValue
    }
    
    func onStepper(sender: AnyObject?) {
        let oldValue: NSInteger = self.currentValue
        self.currentValue = stepper.integerValue
        self.valueField.integerValue = self.currentValue
        
        if (self.delegate != nil) {
            self.delegate?.labeledValueStepperDidChangeFromOldValueToNewValue(self, oldValue: oldValue, newValue: self.currentValue)
        }
    }
}

extension LabeledValueStepper: NSTextFieldDelegate {
    override func controlTextDidEndEditing(obj: NSNotification) {
        let textField: NSControl = obj.object as! NSControl
        var newValue: Int = textField.integerValue
        let oldValue: NSInteger = self.currentValue
        if (newValue >= self.minValue && newValue <= self.maxValue) {
            self.stepper.integerValue = newValue
        }
        else if (newValue < self.minValue) {
            self.stepper.integerValue = self.minValue
            textField.integerValue = self.minValue
            newValue = self.minValue
        }
        else if (newValue > self.maxValue) {
            self.stepper.integerValue = self.maxValue
            textField.integerValue = self.maxValue
            newValue = self.maxValue
        }
        
        if (newValue != oldValue && self.delegate != nil) {
            self.delegate?.labeledValueStepperDidChangeFromOldValueToNewValue(self, oldValue: oldValue, newValue: newValue)
        }
        
        textField.resignFirstResponder()
    }
}
