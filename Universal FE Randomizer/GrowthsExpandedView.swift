//
//  GrowthsExpandedView.swift
//  Universal FE Randomizer
//
//  Created by Shen Lu on 10/5/15.
//  Copyright © 2015 Shen Lu. All rights reserved.
//

import Cocoa

enum GrowthsMethod {
    case Variance
    case Redistribution
    case Full
}

class GrowthsExpandedView: NSView {
    override var intrinsicContentSize : NSSize {
        get {
            return NSMakeSize(max(max(headerView.intrinsicContentSize.width, typeView.intrinsicContentSize.width), parametersView.intrinsicContentSize.width), headerView.intrinsicContentSize.height + 5.0 + typeView.intrinsicContentSize.height + 5.0 + descriptionView.intrinsicContentSize.height + 5.0 + parametersView.intrinsicContentSize.height + 10.0)
        }
    }
    
    var headerView: GenericCollapsedView

    var typeView: NSView
    var radioMatrix: NSMatrix
    var varianceTypeRadioButton: NSButtonCell
    var redistributionTypeRadioButton: NSButtonCell
    var fullRandomTypeRadioButton: NSButtonCell
    
    var descriptionView: NSTextField
    
    var parametersView: NSView
 
    var varianceAmount: LabeledValueStepper
    
    var redistributionVarianceAmount: LabeledValueStepper
    var forceMinimumGrowthsCheckbox: NSButton
    
    var fullRandomMinimumField: LabeledValueStepper
    var fullRandomMaximumField: LabeledValueStepper
    
    init() {
        headerView = GenericCollapsedView.init()
        headerView.masterEnable.title = "Randomize Growths"
        headerView.masterEnable.state = (RandomizationSettings.sharedInstance.randomizeGrowthsEnabled ? NSOnState : NSOffState)
        headerView.descriptionLabel.stringValue = GrowthsExpandedView.descriptionString()
        
        typeView = NSView.init()
        typeView.translatesAutoresizingMaskIntoConstraints = false
        
        radioMatrix = NSMatrix.init(frame: NSZeroRect, mode: NSMatrixMode.RadioModeMatrix, cellClass: NSButtonCell.classForCoder(), numberOfRows: 1, numberOfColumns: 3)
        radioMatrix.translatesAutoresizingMaskIntoConstraints = false
        radioMatrix.autorecalculatesCellSize = true
        radioMatrix.autosizesCells = true
        
        varianceTypeRadioButton = radioMatrix.cellAtRow(0, column: 0) as! NSButtonCell
        varianceTypeRadioButton.title = "Variance"
        varianceTypeRadioButton.setButtonType(NSButtonType.RadioButton)
        
        redistributionTypeRadioButton = radioMatrix.cellAtRow(0, column: 1) as! NSButtonCell
        redistributionTypeRadioButton.title = "Redistribution"
        redistributionTypeRadioButton.setButtonType(NSButtonType.RadioButton)
        
        fullRandomTypeRadioButton = radioMatrix.cellAtRow(0, column: 2) as! NSButtonCell
        fullRandomTypeRadioButton.title = "Full"
        fullRandomTypeRadioButton.setButtonType(NSButtonType.RadioButton)
        
        radioMatrix.invalidateIntrinsicContentSizeForCell(varianceTypeRadioButton)
        radioMatrix.invalidateIntrinsicContentSizeForCell(redistributionTypeRadioButton)
        radioMatrix.invalidateIntrinsicContentSizeForCell(fullRandomTypeRadioButton)
        
        typeView.addSubview(radioMatrix)
        
        NSLayoutConstraint.init(item: radioMatrix, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: typeView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 10.0).active = true
        NSLayoutConstraint.init(item: radioMatrix, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: typeView, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 10.0).active = true
        NSLayoutConstraint.init(item: radioMatrix, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: typeView, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: -10.0).active = true
        NSLayoutConstraint.init(item: radioMatrix, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: typeView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -10.0).active = true
        
        descriptionView = NSTextField.init(frame: NSZeroRect)
        descriptionView.editable = false
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        
        parametersView = NSView.init(frame: NSZeroRect)
        parametersView.translatesAutoresizingMaskIntoConstraints = false
        
        varianceAmount = LabeledValueStepper.init()
        varianceAmount.title = "Variance"
        varianceAmount.maxValue = 100
        varianceAmount.minValue = 0
        
        parametersView.addSubview(varianceAmount)
        
        NSLayoutConstraint.init(item: varianceAmount, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: parametersView, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint.init(item: varianceAmount, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: parametersView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0).active = true
        
        redistributionVarianceAmount = LabeledValueStepper.init()
        redistributionVarianceAmount.title = "Variance"
        redistributionVarianceAmount.maxValue = 100
        redistributionVarianceAmount.minValue = 0
        
        forceMinimumGrowthsCheckbox = NSButton.init(frame: NSZeroRect)
        forceMinimumGrowthsCheckbox.translatesAutoresizingMaskIntoConstraints = false
        forceMinimumGrowthsCheckbox.setButtonType(NSButtonType.SwitchButton)
        forceMinimumGrowthsCheckbox.title = "Force Minimum Growths (5%)"
        
        parametersView.addSubview(redistributionVarianceAmount)
        parametersView.addSubview(forceMinimumGrowthsCheckbox)
        
        NSLayoutConstraint.init(item: redistributionVarianceAmount, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: parametersView, attribute: NSLayoutAttribute.Trailing, multiplier: 0.25, constant: 0.0).active = true
        NSLayoutConstraint.init(item: forceMinimumGrowthsCheckbox, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: parametersView, attribute: NSLayoutAttribute.Trailing, multiplier: 0.75, constant: 0.0).active = true
        NSLayoutConstraint.init(item: redistributionVarianceAmount, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: parametersView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint.init(item: forceMinimumGrowthsCheckbox, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: parametersView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0).active = true
        
        fullRandomMinimumField = LabeledValueStepper.init()
        fullRandomMinimumField.title = "Minimum Growth"
        fullRandomMinimumField.minValue = 0
        fullRandomMinimumField.maxValue = 255
        fullRandomMinimumField.currentValue = 0
        
        fullRandomMaximumField = LabeledValueStepper.init()
        fullRandomMaximumField.title = "Maximum Growth"
        fullRandomMaximumField.minValue = 0
        fullRandomMaximumField.maxValue = 255
        fullRandomMaximumField.currentValue = 255
        
        parametersView.addSubview(fullRandomMinimumField)
        parametersView.addSubview(fullRandomMaximumField)
        
        NSLayoutConstraint.init(item: fullRandomMinimumField, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: parametersView, attribute: NSLayoutAttribute.Trailing, multiplier: 0.25, constant: 0.0).active = true
        NSLayoutConstraint.init(item: fullRandomMaximumField, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: parametersView, attribute: NSLayoutAttribute.Trailing, multiplier: 0.75, constant: 0.0).active = true
        NSLayoutConstraint.init(item: fullRandomMinimumField, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: parametersView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint.init(item: fullRandomMaximumField, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: parametersView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0).active = true
        
        super.init(frame: CGRectZero)
        
        self.addSubview(headerView)
        self.addSubview(typeView)
        self.addSubview(descriptionView)
        self.addSubview(parametersView)
        
        descriptionView.stringValue = GrowthsExpandedView.detailDescription()
        descriptionView.preferredMaxLayoutWidth = 200
        
        NSLayoutConstraint.init(item: headerView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint.init(item: headerView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint.init(item: headerView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint.init(item: headerView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: typeView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: -5.0).active = true
        
        NSLayoutConstraint.init(item: typeView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint.init(item: typeView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint.init(item: typeView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: descriptionView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: -5.0).active = true
        
        NSLayoutConstraint.init(item: descriptionView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 10.0).active = true
        NSLayoutConstraint.init(item: descriptionView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: -10.0).active = true
        
        NSLayoutConstraint.init(item: descriptionView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: parametersView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: -5.0).active = true
        
        NSLayoutConstraint.init(item: parametersView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint.init(item: parametersView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 0.0).active = true
        
        NSLayoutConstraint.init(item: parametersView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -10.0).active = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func descriptionString() -> String {
        var methodString: String
        var parameterString: String
        switch RandomizationSettings.sharedInstance.growthsMethod {
        case .Variance:
            methodString = "Variance"
            parameterString = "(Each Growth Area +/- " + String(RandomizationSettings.sharedInstance.growthsVarianceAmount) + "%)"
        case .Redistribution:
            methodString = "Redistribution"
            parameterString = "(Sum of Growths +/- " + String(RandomizationSettings.sharedInstance.growthsVarianceAmount) + "%, " + (RandomizationSettings.sharedInstance.forceMinimumGrowths ? "Force Minimum (5%) Growths" : "No Minimum Growth")
        case .Full:
            methodString = "Full"
            parameterString = "(Minimum Growth: " + String(RandomizationSettings.sharedInstance.minimumAllowedGrowth) + "%, Maximum Growth: " + String(RandomizationSettings.sharedInstance.maximumAllowedGrowth) + "%)"
        }
        
        return "Method: " + methodString + " " + parameterString
    }
    
    static func detailDescription() -> String {
        switch RandomizationSettings.sharedInstance.growthsMethod {
        case .Variance:
            return "For each stat growth area, a random number is generated between -Variance and +Variance and applied to the growth, flooring at 0% and capping at 255%."
        case .Redistribution:
            return "All stat growth areas for a character is summed up and redistributed, with an optional +/- Variance if desired. Force Minimum Growths ensures that every stat area starts with at least 5% growth, negating the possibility of 0% growth areas."
        case .Full:
            return "A random number is generated between the minimum and maximum allowed growths for each growth area of every character."
        }
    }
    
    override func layout() {
        super.layout()
        
        descriptionView.preferredMaxLayoutWidth = descriptionView.frame.size.width - 10.0 * 2
        
        super.layout()
    }
}