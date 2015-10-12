//
//  GrowthsDetailViewController.swift
//  Universal FE Randomizer
//
//  Created by Shen Lu on 10/8/15.
//  Copyright © 2015 Shen Lu. All rights reserved.
//

import Cocoa

enum GrowthMethod {
    case Variance
    case Redistribution
    case Full
}

class GrowthsDetailViewController: NSViewController, DetailContentViewProtocol {

    @IBOutlet weak var varianceButton: NSButton!
    @IBOutlet weak var redistributionButton: NSButton!
    @IBOutlet weak var fullButton: NSButton!
    
    @IBOutlet weak var descriptionLabel: NSTextField!
    
    @IBOutlet weak var centerStepper: LabeledValueStepper!
    @IBOutlet weak var leftStepper: LabeledValueStepper!
    @IBOutlet weak var rightStepper: LabeledValueStepper!
    @IBOutlet weak var minimumGrowthsCheckbox: NSButton!
    
    weak var delegate : DetailContentViewDelegate?
    
    override func loadView() {

        let nib : NSNib? = NSNib.init(nibNamed: "GrowthsDetailViewController", bundle: nil)
        if (nib != nil) {
            var topLevelObjects: NSArray?
            nib!.instantiateWithOwner(self, topLevelObjects: &topLevelObjects)
            
            for object: AnyObject in topLevelObjects! {
                
                if let obj = object as? NSView {
                    self.view = obj
                    break
                }
            }
            
            self.view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        varianceButton.state = NSOnState
        descriptionLabel.stringValue = "Applies a random delta between 0 and the value specified to every growth area for every character. For example, if the delta value is 20, then every growth rate can move in either direction by 20."
        leftStepper.hidden = true
        rightStepper.hidden = true
        minimumGrowthsCheckbox.hidden = true
        
        centerStepper.hidden = false
        centerStepper.titleLabel.stringValue = "Delta"
        centerStepper.forceCurrentValue(RandomizationSettings.sharedInstance.varianceGrowthsVarianceAmount)
        
        centerStepper.maxValue = 100
        centerStepper.minValue = 1
        
        leftStepper.delegate = self
        centerStepper.delegate = self
        rightStepper.delegate = self
    }
    
    @IBAction func onMinGrowthCheckboxChanged(sender: AnyObject) {
        RandomizationSettings.sharedInstance.forceMinimumGrowths = (self.minimumGrowthsCheckbox.state == NSOnState)
    }
    
    @IBAction func onMethodChange(sender: AnyObject) {
        if (sender === self.varianceButton) {
            descriptionLabel.stringValue = "Applies a random delta between 0 and the value specified to every growth area for every character. For example, if the delta value is 20, then every growth rate can move in either direction by 20."
            leftStepper.hidden = true
            rightStepper.hidden = true
            minimumGrowthsCheckbox.hidden = true
            
            centerStepper.hidden = false
            centerStepper.titleLabel.stringValue = "Delta"
            centerStepper.forceCurrentValue(RandomizationSettings.sharedInstance.varianceGrowthsVarianceAmount)
            
            centerStepper.maxValue = 100
            centerStepper.minValue = 1
            
            RandomizationSettings.sharedInstance.growthsMethod = GrowthMethod.Variance
        }
        else if (sender === self.redistributionButton) {
            descriptionLabel.stringValue = "Sums up a character's total growth and randomly redistributes them, resulting in the same amount of growths total. The variance value can adjust the sum up or down before redistribution."
            
            centerStepper.hidden = true
            rightStepper.hidden = true
            
            leftStepper.hidden = false
            leftStepper.titleLabel.stringValue = "Sum Variance"
            leftStepper.forceCurrentValue(RandomizationSettings.sharedInstance.redistributionGrowthsVarianceAmount)
            
            leftStepper.maxValue = 100
            leftStepper.minValue = 0
            
            minimumGrowthsCheckbox.hidden = false
            minimumGrowthsCheckbox.state = (RandomizationSettings.sharedInstance.forceMinimumGrowths ? NSOnState : NSOffState)
            
            RandomizationSettings.sharedInstance.growthsMethod = GrowthMethod.Redistribution
            
        }
        else if (sender === self.fullButton) {
            descriptionLabel.stringValue = "Generates a random number between a specified minimum growth and maximum growth, without regard to a character's existing growth potential."
            
            centerStepper.hidden = true
            minimumGrowthsCheckbox.hidden = true
            
            leftStepper.hidden = false
            leftStepper.titleLabel.stringValue = "Minimum Growth"
            leftStepper.forceCurrentValue(RandomizationSettings.sharedInstance.minimumAllowedGrowth)
            
            leftStepper.maxValue = RandomizationSettings.sharedInstance.maximumAllowedGrowth
            leftStepper.minValue = 0
            
            rightStepper.hidden = false
            rightStepper.titleLabel.stringValue = "Maximum Growth"
            rightStepper.forceCurrentValue(RandomizationSettings.sharedInstance.maximumAllowedGrowth)
            
            rightStepper.maxValue = 255
            rightStepper.minValue = RandomizationSettings.sharedInstance.minimumAllowedGrowth
            
            RandomizationSettings.sharedInstance.growthsMethod = GrowthMethod.Full
        }
        
        self.view.needsLayout = true
        
        if (self.delegate != nil) {
            self.delegate?.detailContentViewDelegateDidChangeContent(self)
        }
    }
    
    static func descriptionString() -> String {
        if (RandomizationSettings.sharedInstance.growthsMethod == GrowthMethod.Variance) {
            return "\tGrowth Method: Variance\n" + "\t\tDelta: " + String(RandomizationSettings.sharedInstance.varianceGrowthsVarianceAmount)
        }
        else if (RandomizationSettings.sharedInstance.growthsMethod == GrowthMethod.Redistribution) {
            return "\tGrowth Method: Redistribution\n" + "\t\tVariance: " + String(RandomizationSettings.sharedInstance.redistributionGrowthsVarianceAmount) + (RandomizationSettings.sharedInstance.forceMinimumGrowths ? "\n\t5% Minimum Growths" : "")
        }
        else if (RandomizationSettings.sharedInstance.growthsMethod == GrowthMethod.Full) {
            return "\tGrowth Method: Full\n" + "\t\tMinimum: " + String(RandomizationSettings.sharedInstance.minimumAllowedGrowth) + "\n\t\tMaximum: " + String(RandomizationSettings.sharedInstance.maximumAllowedGrowth)
        }
        else {
            return "Unknown Growth Method."
        }
    }
}

extension GrowthsDetailViewController : LabeledValueStepperDelegate {
    func labeledValueStepperDidChangeFromOldValueToNewValue(stepper: LabeledValueStepper, oldValue: NSInteger, newValue: NSInteger) {
        if (stepper == self.centerStepper) {
            if (RandomizationSettings.sharedInstance.growthsMethod == GrowthMethod.Variance) {
                RandomizationSettings.sharedInstance.varianceGrowthsVarianceAmount = newValue
            }
        }
        else if (stepper == self.leftStepper) {
            if (RandomizationSettings.sharedInstance.growthsMethod == GrowthMethod.Redistribution) {
                RandomizationSettings.sharedInstance.redistributionGrowthsVarianceAmount = newValue
            }
            else if (RandomizationSettings.sharedInstance.growthsMethod == GrowthMethod.Full) {
                RandomizationSettings.sharedInstance.minimumAllowedGrowth = newValue
                self.rightStepper.minValue = newValue
            }
        }
        else if (stepper == self.rightStepper) {
            if (RandomizationSettings.sharedInstance.growthsMethod == GrowthMethod.Full) {
                RandomizationSettings.sharedInstance.maximumAllowedGrowth = newValue
                self.leftStepper.maxValue = newValue
            }
        }
        
        if (self.delegate != nil) {
            self.delegate?.detailContentViewDelegateDidChangeContent(self)
        }
    }
}