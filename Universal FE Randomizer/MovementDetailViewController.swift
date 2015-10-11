//
//  MovementDetailViewController.swift
//  Universal FE Randomizer
//
//  Created by Shen Lu on 10/10/15.
//  Copyright © 2015 Shen Lu. All rights reserved.
//

import Cocoa

enum MovementMethod {
    case Variance
    case Full
}

class MovementDetailViewController: NSViewController, DetailContentViewProtocol {

    @IBOutlet weak var varianceButton: NSButton!
    @IBOutlet weak var fullButton: NSButton!
    
    @IBOutlet weak var descriptionLabel: NSTextField!
    
    @IBOutlet weak var centerStepper: LabeledValueStepper!
    @IBOutlet weak var leftStepper: LabeledValueStepper!
    @IBOutlet weak var rightStepper: LabeledValueStepper!
    
    weak var delegate : DetailContentViewDelegate?
    
    override func loadView() {
        let nib : NSNib? = NSNib.init(nibNamed: "MovementDetailViewController", bundle: nil)
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
        descriptionLabel.stringValue = "Applies a random delta between 0 and the value specified to the Movement range for every class. For example, if the delta value is 3, then the class's movement range can either expand or shrink by up to 3 squares."
        
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
    
    @IBAction func onMethodChange(sender: AnyObject) {
        if (sender === self.varianceButton) {
            descriptionLabel.stringValue = "Applies a random delta between 0 and the value specified to the Movement range for every class. For example, if the delta value is 3, then the class's movement range can either expand or shrink by up to 3 squares."
            
            centerStepper.hidden = false
            leftStepper.hidden = true
            rightStepper.hidden = true
            
            centerStepper.titleLabel.stringValue = "Delta"
            centerStepper.forceCurrentValue(RandomizationSettings.sharedInstance.varianceMovementVarianceAmount)
            
            centerStepper.maxValue = 9
            centerStepper.minValue = 1
            
            RandomizationSettings.sharedInstance.movementMethod = MovementMethod.Variance
        }
        else if (sender === self.fullButton) {
            descriptionLabel.stringValue = "Randomly generates a value for every class's movement range between the specified minimum and maximum values."
            
            centerStepper.hidden = true
            leftStepper.hidden = false
            rightStepper.hidden = false
            
            leftStepper.titleLabel.stringValue = "Minimum MOV"
            leftStepper.forceCurrentValue(RandomizationSettings.sharedInstance.minimumAllowedMovement)
            
            leftStepper.maxValue = RandomizationSettings.sharedInstance.maximumAllowedMovement
            leftStepper.minValue = 1
            
            rightStepper.titleLabel.stringValue = "Maximum MOV"
            rightStepper.forceCurrentValue(RandomizationSettings.sharedInstance.maximumAllowedMovement)
            
            rightStepper.maxValue = 9
            rightStepper.minValue = RandomizationSettings.sharedInstance.minimumAllowedMovement
            
            RandomizationSettings.sharedInstance.movementMethod = MovementMethod.Full
        }
        
        self.view.needsLayout = true
        
        if (self.delegate != nil) {
            self.delegate?.detailContentViewDelegateDidChangeContent(self)
        }
    }
    
    static func descriptionString() -> String {
        if (RandomizationSettings.sharedInstance.movementMethod == MovementMethod.Variance) {
            return "MOV Method: Variance\n" + "\tDelta: " + String(RandomizationSettings.sharedInstance.varianceMovementVarianceAmount)
        }
        else if (RandomizationSettings.sharedInstance.movementMethod == MovementMethod.Full) {
            return "MOV Method: Full\n" + "\tMinimum: " + String(RandomizationSettings.sharedInstance.minimumAllowedMovement) + "\n\tMaximum: " + String(RandomizationSettings.sharedInstance.maximumAllowedMovement)
        }
        else {
            return "Unknown MOV Method."
        }
    }
    
}

extension MovementDetailViewController : LabeledValueStepperDelegate {
    func labeledValueStepperDidChangeFromOldValueToNewValue(stepper: LabeledValueStepper, oldValue: NSInteger, newValue: NSInteger) {
        if (stepper == self.centerStepper) {
            if (RandomizationSettings.sharedInstance.movementMethod == MovementMethod.Variance) {
                RandomizationSettings.sharedInstance.varianceMovementVarianceAmount = newValue
            }
        }
        else if (stepper == self.leftStepper) {
            if (RandomizationSettings.sharedInstance.movementMethod == MovementMethod.Full) {
                RandomizationSettings.sharedInstance.minimumAllowedMovement = newValue
                self.rightStepper.minValue = newValue
            }
        }
        else if (stepper == self.rightStepper) {
            if (RandomizationSettings.sharedInstance.movementMethod == MovementMethod.Full) {
                RandomizationSettings.sharedInstance.maximumAllowedConstitution = newValue
                self.leftStepper.maxValue = newValue
            }
        }
        
        if (self.delegate != nil) {
            self.delegate?.detailContentViewDelegateDidChangeContent(self)
        }
    }
}
