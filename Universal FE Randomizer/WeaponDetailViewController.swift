//
//  WeaponDetailViewController.swift
//  Universal FE Randomizer
//
//  Created by Shen Lu on 10/10/15.
//  Copyright © 2015 Shen Lu. All rights reserved.
//

import Cocoa

enum ItemMethod {
    case Variance
    case Full
}

class WeaponDetailViewController: NSViewController, DetailContentViewProtocol {

    @IBOutlet weak var varianceButton: NSButton!
    @IBOutlet weak var fullButton: NSButton!
    
    @IBOutlet weak var descriptionLabel: NSTextField!
    
    @IBOutlet weak var leadingView: NSView!
    @IBOutlet weak var centerView: NSView!
    @IBOutlet weak var trailingView: NSView!
    
    weak var delegate : DetailContentViewDelegate?
    
    @IBOutlet weak var mightVarianceField: LabeledValueStepper!
    @IBOutlet weak var mightMinimumField: LabeledValueStepper!
    @IBOutlet weak var mightMaximumField: LabeledValueStepper!
    
    @IBOutlet weak var hitVarianceField: LabeledValueStepper!
    @IBOutlet weak var hitMinimumField: LabeledValueStepper!
    @IBOutlet weak var hitMaximumField: LabeledValueStepper!
    
    @IBOutlet weak var criticalVarianceField: LabeledValueStepper!
    @IBOutlet weak var criticalMinimumField: LabeledValueStepper!
    @IBOutlet weak var criticalMaximumField: LabeledValueStepper!
    
    @IBOutlet weak var weightVarianceField: LabeledValueStepper!
    @IBOutlet weak var weightMinimumField: LabeledValueStepper!
    @IBOutlet weak var weightMaximumField: LabeledValueStepper!
    
    @IBOutlet weak var effectsEnableButton: NSButton!
    @IBOutlet weak var effectsList: NSTableView!
    
    override func loadView() {
        let nib : NSNib? = NSNib.init(nibNamed: "WeaponDetailViewController", bundle: nil)
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
        descriptionLabel.stringValue = "Specify weapon randomization using a delta. This attempts to preserve weapon qualities according to their ranks."
        
        mightVarianceField.title = "Variance"
        mightVarianceField.maxValue = 20
        mightVarianceField.minValue = 1
        mightVarianceField.forceCurrentValue(RandomizationSettings.sharedInstance.mightVariance)
        mightVarianceField.delegate = self
        
        mightMinimumField.title = "Minimum"
        mightMinimumField.minValue = 0
        mightMinimumField.maxValue = RandomizationSettings.sharedInstance.mightRange.location + RandomizationSettings.sharedInstance.mightRange.length
        mightMinimumField.forceCurrentValue(RandomizationSettings.sharedInstance.mightRange.location)
        mightMinimumField.delegate = self
        mightMaximumField.title = "Maximum"
        mightMaximumField.minValue = RandomizationSettings.sharedInstance.mightRange.location
        mightMaximumField.maxValue = 30
        mightMaximumField.forceCurrentValue(RandomizationSettings.sharedInstance.mightRange.location + RandomizationSettings.sharedInstance.mightRange.length)
        mightMaximumField.delegate = self
        
        hitVarianceField.title = "Variance"
        hitVarianceField.maxValue = 150
        hitVarianceField.minValue = 1
        hitVarianceField.forceCurrentValue(RandomizationSettings.sharedInstance.hitVariance)
        hitVarianceField.delegate = self
        
        hitMinimumField.title = "Minimum"
        hitMinimumField.minValue = 0
        hitMinimumField.maxValue = RandomizationSettings.sharedInstance.hitRange.location + RandomizationSettings.sharedInstance.hitRange.length
        hitMinimumField.forceCurrentValue(RandomizationSettings.sharedInstance.hitRange.location)
        hitMinimumField.delegate = self
        hitMaximumField.title = "Maximum"
        hitMaximumField.minValue = RandomizationSettings.sharedInstance.hitRange.location
        hitMaximumField.maxValue = 255
        hitMaximumField.forceCurrentValue(RandomizationSettings.sharedInstance.hitRange.location + RandomizationSettings.sharedInstance.hitRange.length)
        hitMaximumField.delegate = self
        
        criticalVarianceField.title = "Variance"
        criticalVarianceField.minValue = 1
        criticalVarianceField.maxValue = 100
        criticalVarianceField.forceCurrentValue(RandomizationSettings.sharedInstance.critVariance)
        criticalVarianceField.delegate = self
        
        criticalMinimumField.title = "Minimum"
        criticalMinimumField.minValue = 0
        criticalMinimumField.maxValue = RandomizationSettings.sharedInstance.critRange.location + RandomizationSettings.sharedInstance.critRange.length
        criticalMinimumField.forceCurrentValue(RandomizationSettings.sharedInstance.critRange.location)
        criticalMinimumField.delegate = self
        criticalMaximumField.title = "Maximum"
        criticalMaximumField.minValue = RandomizationSettings.sharedInstance.critRange.location
        criticalMaximumField.maxValue = 255
        criticalMaximumField.forceCurrentValue(RandomizationSettings.sharedInstance.critRange.location + RandomizationSettings.sharedInstance.critRange.length)
        criticalMaximumField.delegate = self
        

        weightVarianceField.title = "Variance"
        weightVarianceField.minValue = 1
        weightVarianceField.maxValue = 20
        weightVarianceField.forceCurrentValue(RandomizationSettings.sharedInstance.weightVariance)
        weightVarianceField.delegate = self
        
        weightMinimumField.title = "Minimum"
        weightMinimumField.minValue = 0
        weightMinimumField.maxValue = RandomizationSettings.sharedInstance.weightRange.location + RandomizationSettings.sharedInstance.weightRange.length
        weightMinimumField.forceCurrentValue(RandomizationSettings.sharedInstance.weightRange.location)
        weightMinimumField.delegate = self
        weightMaximumField.title = "Maximum"
        weightMaximumField.minValue = RandomizationSettings.sharedInstance.weightRange.location
        weightMaximumField.maxValue = 30
        weightMaximumField.forceCurrentValue(RandomizationSettings.sharedInstance.weightRange.location + RandomizationSettings.sharedInstance.weightRange.length)
        weightMaximumField.delegate = self
        
        mightMinimumField.hidden = true
        mightMaximumField.hidden = true
        hitMinimumField.hidden = true
        hitMaximumField.hidden = true
        criticalMinimumField.hidden = true
        criticalMaximumField.hidden = true
        weightMinimumField.hidden = true
        weightMaximumField.hidden = true
        
        effectsList.setDelegate(self)
        effectsList.setDataSource(self)
        
        effectsEnableButton.state = RandomizationSettings.sharedInstance.addRandomWeaponEffects ? NSOnState : NSOffState
        effectsList.hidden = !RandomizationSettings.sharedInstance.addRandomWeaponEffects
    }
    
    @IBAction func onMethodChanged(sender: AnyObject) {
        if (sender === self.varianceButton) {
            
            descriptionLabel.stringValue = "Specify weapon randomization using a delta. This attempts to preserve weapon quality with respect to their ranks."
            
            self.mightVarianceField.hidden = false
            self.hitVarianceField.hidden = false
            self.criticalVarianceField.hidden = false
            self.weightVarianceField.hidden = false
            
            self.mightMinimumField.hidden = true
            self.mightMaximumField.hidden = true
            self.hitMinimumField.hidden = true
            self.hitMaximumField.hidden = true
            self.criticalMinimumField.hidden = true
            self.criticalMaximumField.hidden = true
            self.weightMinimumField.hidden = true
            self.weightMaximumField.hidden = true
            
            RandomizationSettings.sharedInstance.itemMethod = ItemMethod.Variance
        }
        else if (sender === self.fullButton) {
            
            descriptionLabel.stringValue = "Specify weapon randomization using a range. This makes no gurantees on any correlation between weapon ranks and weapon quality."
            
            self.mightVarianceField.hidden = true
            self.hitVarianceField.hidden = true
            self.criticalVarianceField.hidden = true
            self.weightVarianceField.hidden = true
            
            self.mightMinimumField.hidden = false
            self.mightMaximumField.hidden = false
            self.hitMinimumField.hidden = false
            self.hitMaximumField.hidden = false
            self.criticalMinimumField.hidden = false
            self.criticalMaximumField.hidden = false
            self.weightMinimumField.hidden = false
            self.weightMaximumField.hidden = false
            
            RandomizationSettings.sharedInstance.itemMethod = ItemMethod.Full
        }
        
        self.delegate?.detailContentViewDelegateDidChangeContent(self)
    }

    @IBAction func onWeaponEffectsEnable(sender: AnyObject) {
        RandomizationSettings.sharedInstance.addRandomWeaponEffects = self.effectsEnableButton.state == NSOnState
        
        if (RandomizationSettings.sharedInstance.addRandomWeaponEffects) {
            self.effectsList.hidden = false
            self.effectsList.reloadData()
            
            let selectedSet : NSMutableIndexSet = NSMutableIndexSet.init()
            
            for effect in WeaponEffects.allValues {
                let mask : NSInteger = ItemManager.effectMaskForEffect(effect)
                let allowed : Bool = (RandomizationSettings.sharedInstance.allowedEffectsFlags & mask) != 0
                
                if (allowed) {
                    selectedSet.addIndex(effect.rawValue)
                }
            }
            
            self.effectsList.selectRowIndexes(selectedSet, byExtendingSelection: false)
        }
        else {
            self.effectsList.hidden = true
        }
    }
    
    static func descriptionString() -> String {
        if (RandomizationSettings.sharedInstance.itemMethod == ItemMethod.Variance) {
            return "Item Method: Variance" + "\n\tMight Delta: " + String(RandomizationSettings.sharedInstance.mightVariance) + "\n\tHit Delta: " + String(RandomizationSettings.sharedInstance.hitVariance) + "\n\tCritical Delta: " + String(RandomizationSettings.sharedInstance.critVariance) + "\n\tWeight Delta: " + String(RandomizationSettings.sharedInstance.weightVariance)
        }
        else if (RandomizationSettings.sharedInstance.itemMethod == ItemMethod.Full) {
            return "Item Method: Full" + "\n\tMight Range: " + String(RandomizationSettings.sharedInstance.mightRange.location) + " - "  + String(RandomizationSettings.sharedInstance.mightRange.length + RandomizationSettings.sharedInstance.mightRange.location) + "\n\tHit Range: " + String(RandomizationSettings.sharedInstance.hitRange.location) + " - " + String(RandomizationSettings.sharedInstance.hitRange.location + RandomizationSettings.sharedInstance.hitRange.length) + "\n\tCritical Range: " + String(RandomizationSettings.sharedInstance.critRange.location) + " - " + String(RandomizationSettings.sharedInstance.critRange.location + RandomizationSettings.sharedInstance.critRange.length) + "\n\tWeight Range: " + String(RandomizationSettings.sharedInstance.weightRange.location) + " - " + String(RandomizationSettings.sharedInstance.weightRange.location + RandomizationSettings.sharedInstance.weightRange.length)
        }
        else {
            return "Unknown Item Method"
        }
    }
    
}

extension WeaponDetailViewController : LabeledValueStepperDelegate {
    func labeledValueStepperDidChangeFromOldValueToNewValue(stepper: LabeledValueStepper, oldValue: NSInteger, newValue: NSInteger) {
        if (stepper == self.mightVarianceField) {
            RandomizationSettings.sharedInstance.mightVariance = newValue
        }
        else if (stepper == self.mightMinimumField) {
            RandomizationSettings.sharedInstance.mightRange = NSMakeRange(newValue, RandomizationSettings.sharedInstance.mightRange.length + RandomizationSettings.sharedInstance.mightRange.location - newValue)
        }
        else if (stepper == self.mightMaximumField) {
            RandomizationSettings.sharedInstance.mightRange = NSMakeRange(RandomizationSettings.sharedInstance.mightRange.location, newValue - RandomizationSettings.sharedInstance.mightRange.location)
        }
        else if (stepper == self.hitVarianceField) {
            RandomizationSettings.sharedInstance.hitVariance = newValue
        }
        else if (stepper == self.hitMinimumField) {
            RandomizationSettings.sharedInstance.hitRange = NSMakeRange(newValue, RandomizationSettings.sharedInstance.hitRange.length + RandomizationSettings.sharedInstance.hitRange.location - newValue)
        }
        else if (stepper == self.hitMaximumField) {
            RandomizationSettings.sharedInstance.hitRange = NSMakeRange(RandomizationSettings.sharedInstance.hitRange.location, newValue - RandomizationSettings.sharedInstance.hitRange.location)
        }
        else if (stepper == self.criticalVarianceField) {
            RandomizationSettings.sharedInstance.critVariance = newValue
        }
        else if (stepper == self.criticalMinimumField) {
            RandomizationSettings.sharedInstance.critRange = NSMakeRange(newValue, RandomizationSettings.sharedInstance.critRange.length + RandomizationSettings.sharedInstance.critRange.location - newValue)
        }
        else if (stepper == self.criticalMaximumField) {
            RandomizationSettings.sharedInstance.critRange = NSMakeRange(RandomizationSettings.sharedInstance.critRange.location, newValue - RandomizationSettings.sharedInstance.critRange.location)
        }
        else if (stepper == self.weightVarianceField) {
            RandomizationSettings.sharedInstance.weightVariance = newValue
        }
        else if (stepper == self.weightMinimumField) {
            RandomizationSettings.sharedInstance.weightRange = NSMakeRange(newValue, RandomizationSettings.sharedInstance.weightRange.length + RandomizationSettings.sharedInstance.weightRange.location - newValue)
        }
        else if (stepper == self.weightMaximumField) {
            RandomizationSettings.sharedInstance.weightRange = NSMakeRange(RandomizationSettings.sharedInstance.weightRange.location, newValue - RandomizationSettings.sharedInstance.weightRange.location)
        }
        
        self.delegate?.detailContentViewDelegateDidChangeContent(self)
    }
}

extension WeaponDetailViewController : NSTableViewDelegate {
    func tableViewSelectionDidChange(notification: NSNotification) {
        let selectedSet : NSIndexSet = self.effectsList.selectedRowIndexes
        
        var newFlags : NSInteger = 0
        for effect in WeaponEffects.allValues {
            let mask : NSInteger = ItemManager.effectMaskForEffect(effect)
            
            if (selectedSet.containsIndex(effect.rawValue)) {
                newFlags |= mask
            }
        }
        
        RandomizationSettings.sharedInstance.allowedEffectsFlags = newFlags
    }
}

extension WeaponDetailViewController : NSTableViewDataSource {
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cellView: NSTableCellView = tableView.makeViewWithIdentifier(tableColumn!.identifier, owner: self) as! NSTableCellView
        
        cellView.textField?.stringValue = ItemManager.friendlyNameForEffect(WeaponEffects(rawValue: row)!)
        
        return cellView
    }
    
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return WeaponEffects.Count.rawValue
    }
}