//
//  ConstitutionDetailViewController.swift
//  Universal FE Randomizer
//
//  Created by Shen Lu on 10/10/15.
//  Copyright © 2015 Shen Lu. All rights reserved.
//

import Cocoa

enum ConstitutionMethod {
    case Variance
    case Full
}

class ConstitutionDetailViewController: NSViewController, DetailContentViewProtocol {

    @IBOutlet weak var varianceButton: NSButton!
    @IBOutlet weak var fullButton: NSButton!
    
    @IBOutlet weak var descriptionLabel: NSTextField!
    
    @IBOutlet weak var centerStepper: LabeledValueStepper!
    @IBOutlet weak var leftStepper: LabeledValueStepper!
    @IBOutlet weak var rightStepper: LabeledValueStepper!
    
    weak var delegate : DetailContentViewDelegate?
    
    override func loadView() {
        let nib : NSNib? = NSNib.init(nibNamed: "ConstitutionDetailViewController", bundle: nil)
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
        descriptionLabel.stringValue = "Applies a random delta between 0 and the value specified to the Constitution stat for every character. For example, if the delta value is 3, then a unit's constitution can be moved by up to 3 in either direction."
        
        centerStepper.titleLabel.stringValue = "Delta"
        centerStepper.forceCurrentValue(RandomizationSettings.sharedInstance.varianceConstitutionVarianceAmount)
        
        centerStepper.maxValue = 25
        centerStepper.minValue = 1
        
        centerStepper.delegate = self
        leftStepper.delegate = self
        rightStepper.delegate = self
        
        leftStepper.hidden = true
        rightStepper.hidden = true
    }
    
    @IBAction func onMethodChanged(sender: AnyObject) {
        if (sender === self.varianceButton) {
            descriptionLabel.stringValue = "Applies a random delta between 0 and the value specified to the Constitution stat for every character. For example, if the delta value is 3, then a unit's constitution can be moved by up to 3 in either direction."
            
            centerStepper.hidden = false
            leftStepper.hidden = true
            rightStepper.hidden = true
            
            centerStepper.titleLabel.stringValue = "Delta"
            centerStepper.forceCurrentValue(RandomizationSettings.sharedInstance.varianceConstitutionVarianceAmount)
            
            centerStepper.maxValue = 25
            centerStepper.minValue = 1
            
            RandomizationSettings.sharedInstance.constitutionMethod = ConstitutionMethod.Variance
        }
        else if (sender === self.fullButton) {
            descriptionLabel.stringValue = "Randomly generates a value for every character's constitution stat between the specified minimum and maximum values."
            
            centerStepper.hidden = true
            leftStepper.hidden = false
            rightStepper.hidden = false
            
            leftStepper.titleLabel.stringValue = "Minimum CON"
            leftStepper.forceCurrentValue(RandomizationSettings.sharedInstance.minimumAllowedConstitution)
            
            leftStepper.maxValue = RandomizationSettings.sharedInstance.maximumAllowedConstitution
            leftStepper.minValue = 1
            
            rightStepper.titleLabel.stringValue = "Maximum CON"
            rightStepper.forceCurrentValue(RandomizationSettings.sharedInstance.maximumAllowedConstitution)
            
            rightStepper.maxValue = 25
            rightStepper.minValue = RandomizationSettings.sharedInstance.minimumAllowedConstitution
            
            RandomizationSettings.sharedInstance.constitutionMethod = ConstitutionMethod.Full
        }
        
        self.view.needsLayout = true
        
        if (self.delegate != nil) {
            self.delegate?.detailContentViewDelegateDidChangeContent(self)
        }
    }
    
    static func descriptionString() -> String {
        if (RandomizationSettings.sharedInstance.constitutionMethod == ConstitutionMethod.Variance) {
            return "CON Method: Variance\n" + "\tDelta: " + String(RandomizationSettings.sharedInstance.varianceConstitutionVarianceAmount)
        }
        else if (RandomizationSettings.sharedInstance.constitutionMethod == ConstitutionMethod.Full) {
            return "CON Method: Full\n" + "\tMinimum: " + String(RandomizationSettings.sharedInstance.minimumAllowedConstitution) + "\n\tMaximum: " + String(RandomizationSettings.sharedInstance.maximumAllowedConstitution)
        }
        else {
            return "Unknown CON Method."
        }
    }
}

extension ConstitutionDetailViewController : LabeledValueStepperDelegate {
    func labeledValueStepperDidChangeFromOldValueToNewValue(stepper: LabeledValueStepper, oldValue: NSInteger, newValue: NSInteger) {
        if (stepper == self.centerStepper) {
            if (RandomizationSettings.sharedInstance.constitutionMethod == ConstitutionMethod.Variance) {
                RandomizationSettings.sharedInstance.varianceConstitutionVarianceAmount = newValue
            }
        }
        else if (stepper == self.leftStepper) {
            if (RandomizationSettings.sharedInstance.constitutionMethod == ConstitutionMethod.Full) {
                RandomizationSettings.sharedInstance.minimumAllowedConstitution = newValue
                self.rightStepper.minValue = newValue
            }
        }
        else if (stepper == self.rightStepper) {
            if (RandomizationSettings.sharedInstance.constitutionMethod == ConstitutionMethod.Full) {
                RandomizationSettings.sharedInstance.maximumAllowedConstitution = newValue
                self.leftStepper.maxValue = newValue
            }
        }
        
        if (self.delegate != nil) {
            self.delegate?.detailContentViewDelegateDidChangeContent(self)
        }
    }
}

