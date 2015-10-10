//
//  BasesDetailViewController.swift
//  Universal FE Randomizer
//
//  Created by Shen Lu on 10/10/15.
//  Copyright © 2015 Shen Lu. All rights reserved.
//

import Cocoa

enum BaseMethod {
    case Variance
    case Redistribution
}

class BasesDetailViewController: NSViewController, DetailContentViewProtocol {

    @IBOutlet weak var varianceOptionButton: NSButton!
    @IBOutlet weak var redistributionOptionButton: NSButton!
    
    @IBOutlet weak var descriptionLabel: NSTextField!
    @IBOutlet weak var stepper: LabeledValueStepper!
    
    weak var delegate : DetailContentViewDelegate?
    
    override func loadView() {
        let nib : NSNib? = NSNib.init(nibNamed: "BasesDetailViewController", bundle: nil)
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
        
        varianceOptionButton.state = NSOnState
        descriptionLabel.stringValue = "Applies a random delta between 0 and the value specified to every stat base for every character. For example, if the delta value is 25, then every stat's base value can move in either direction by 5."
        
        stepper.titleLabel.stringValue = "Delta"
        stepper.forceCurrentValue(RandomizationSettings.sharedInstance.varianceBasesVarianceAmount)
        
        stepper.maxValue = 10
        stepper.minValue = 1
        
        stepper.delegate = self
    }
    
    @IBAction func onMethodChanged(sender: AnyObject) {
        if (sender === self.varianceOptionButton) {
            descriptionLabel.stringValue = "Applies a random delta between 0 and the value specified to every stat base for every character. For example, if the delta value is 25, then every stat's base value can move in either direction by 5."
            
            stepper.titleLabel.stringValue = "Delta"
            stepper.forceCurrentValue(RandomizationSettings.sharedInstance.varianceBasesVarianceAmount)
            
            stepper.maxValue = 10
            stepper.minValue = 1
            
            RandomizationSettings.sharedInstance.baseMethod = BaseMethod.Variance
        }
        else if (sender === self.redistributionOptionButton) {
            descriptionLabel.stringValue = "Sums up a character's total personal base stats and randomly redistributes them, resulting in the same amount of base stats total. The variance value can adjust the sum up or down before redistribution."
            
            stepper.titleLabel.stringValue = "Variance"
            stepper.forceCurrentValue(RandomizationSettings.sharedInstance.redistributionBasesVarianceAmount)
            
            stepper.maxValue = 10
            stepper.minValue = 0
            
            RandomizationSettings.sharedInstance.baseMethod = BaseMethod.Redistribution
        }
        
        self.view.needsLayout = true
        
        if (self.delegate != nil) {
            self.delegate?.detailContentViewDelegateDidChangeContent(self)
        }
    }
    
    static func descriptionString() -> String {
        if (RandomizationSettings.sharedInstance.baseMethod == BaseMethod.Variance) {
            return "Bases Method: Variance\n" + "\tDelta: " + String(RandomizationSettings.sharedInstance.varianceBasesVarianceAmount)
        }
        else if (RandomizationSettings.sharedInstance.baseMethod == BaseMethod.Redistribution) {
            return "Bases Method: Redistribution\n" + "\tVariance: " + String(RandomizationSettings.sharedInstance.redistributionBasesVarianceAmount)
        }
        else {
            return "Unknown Bases Method."
        }
    }
}

extension BasesDetailViewController : LabeledValueStepperDelegate {
    func labeledValueStepperDidChangeFromOldValueToNewValue(stepper: LabeledValueStepper, oldValue: NSInteger, newValue: NSInteger) {
        if (stepper == self.stepper) {
            if (RandomizationSettings.sharedInstance.baseMethod == BaseMethod.Variance) {
                RandomizationSettings.sharedInstance.varianceBasesVarianceAmount = newValue
            }
            else if (RandomizationSettings.sharedInstance.baseMethod == BaseMethod.Redistribution) {
                RandomizationSettings.sharedInstance.redistributionBasesVarianceAmount = newValue
            }
        }
        
        if (self.delegate != nil) {
            self.delegate?.detailContentViewDelegateDidChangeContent(self)
        }
    }
}