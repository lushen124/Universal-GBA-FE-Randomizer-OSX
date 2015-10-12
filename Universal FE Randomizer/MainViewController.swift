//
//  MainViewController.swift
//  Universal FE Randomizer
//
//  Created by Shen Lu on 10/1/15.
//  Copyright © 2015 Shen Lu. All rights reserved.
//

import Cocoa

protocol DetailContentViewDelegate : class {
    func detailContentViewDelegateDidChangeContent(view: DetailContentViewProtocol)
}

protocol DetailContentViewProtocol : class {
    weak var delegate : DetailContentViewDelegate? {get set}
    
    static func descriptionString() -> String
}

class MainViewController: NSViewController {

    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var DetailContainer: NSBox!
    
    @IBOutlet weak var masterEnabledSwitch: NSButton!
    
    var growthsDetailViewController : GrowthsDetailViewController?
    var basesDetailViewController : BasesDetailViewController?
    var constitutionDetailViewController : ConstitutionDetailViewController?
    var movementDetailViewController : MovementDetailViewController?
    var weaponDetailViewController : WeaponDetailViewController?
    var classesDetailViewController : ClassesDetailViewController?
    
    var growthContentView : NSView {
        get {
            if (growthsDetailViewController == nil) {
                self.growthsDetailViewController = GrowthsDetailViewController()
                self.growthsDetailViewController?.delegate = self
            }
            
            return growthsDetailViewController!.view
        }
    }
    
    var basesContentView : NSView {
        get {
            if (basesDetailViewController == nil) {
                self.basesDetailViewController = BasesDetailViewController()
                self.basesDetailViewController?.delegate = self
            }
            
            return basesDetailViewController!.view
        }
    }
    
    var constitutionContentView : NSView {
        get {
            if (self.constitutionDetailViewController == nil) {
                self.constitutionDetailViewController = ConstitutionDetailViewController()
                self.constitutionDetailViewController?.delegate = self
            }
            
            return constitutionDetailViewController!.view
        }
    }
    
    var movementContentView : NSView {
        get {
            if (self.movementDetailViewController == nil) {
                self.movementDetailViewController = MovementDetailViewController()
                self.movementDetailViewController?.delegate = self
            }
            
            return movementDetailViewController!.view
        }
    }
    
    var weaponContentView : NSView {
        get {
            if (self.weaponDetailViewController == nil) {
                self.weaponDetailViewController = WeaponDetailViewController()
                self.weaponDetailViewController?.delegate = self
            }
            
            return weaponDetailViewController!.view
        }
    }
    
    var classesContentView : NSView {
        get {
            if (self.classesDetailViewController == nil) {
                self.classesDetailViewController = ClassesDetailViewController()
                self.classesDetailViewController?.delegate = self
            }
            
            return self.classesDetailViewController!.view
        }
    }
    
    var currentMode : TopLevelRandomizationOptions?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        masterEnabledSwitch.state = NSOffState
        masterEnabledSwitch.enabled = false
        
        DetailContainer.hidden = true
        
        RandomizationSettings.sharedInstance.game = FE6()
    }
    
    @IBAction func onEnabledSwitchToggled(sender: AnyObject) {
        let isEnabled = (masterEnabledSwitch.state == NSOnState)
        if (currentMode == TopLevelRandomizationOptions.Growths) {
            RandomizationSettings.sharedInstance.randomizeGrowthsEnabled = isEnabled
            DetailContainer.hidden = !isEnabled
            self.tableView.reloadDataForRowIndexes(NSIndexSet.init(index: TopLevelRandomizationOptions.Growths.rawValue), columnIndexes: NSIndexSet.init(index: 0))
            self.tableView.noteHeightOfRowsWithIndexesChanged(NSIndexSet.init(index: TopLevelRandomizationOptions.Growths.rawValue))
        }
        else if (currentMode == TopLevelRandomizationOptions.Bases) {
            RandomizationSettings.sharedInstance.randomizeBasesEnabled = isEnabled
            DetailContainer.hidden = !isEnabled
            self.tableView.reloadDataForRowIndexes(NSIndexSet.init(index: TopLevelRandomizationOptions.Bases.rawValue), columnIndexes: NSIndexSet.init(index: 0))
            self.tableView.noteHeightOfRowsWithIndexesChanged(NSIndexSet.init(index: TopLevelRandomizationOptions.Bases.rawValue))
        }
        else if (currentMode == TopLevelRandomizationOptions.Constitution) {
            RandomizationSettings.sharedInstance.randomizeConstitutionEnabled = isEnabled
            DetailContainer.hidden = !isEnabled
            self.tableView.reloadDataForRowIndexes(NSIndexSet.init(index: TopLevelRandomizationOptions.Constitution.rawValue), columnIndexes: NSIndexSet.init(index: 0))
            self.tableView.noteHeightOfRowsWithIndexesChanged(NSIndexSet.init(index: TopLevelRandomizationOptions.Constitution.rawValue))
        }
        else if (currentMode == TopLevelRandomizationOptions.Movement) {
            RandomizationSettings.sharedInstance.randomizeMovementEnabled = isEnabled
            DetailContainer.hidden = !isEnabled
            self.tableView.reloadDataForRowIndexes(NSIndexSet.init(index: TopLevelRandomizationOptions.Movement.rawValue), columnIndexes: NSIndexSet.init(index: 0))
            self.tableView.noteHeightOfRowsWithIndexesChanged(NSIndexSet.init(index: TopLevelRandomizationOptions.Movement.rawValue))
        }
        else if (currentMode == TopLevelRandomizationOptions.Affinity) {
            RandomizationSettings.sharedInstance.randomizeAffinityEnabled = isEnabled
            self.tableView.reloadDataForRowIndexes(NSIndexSet.init(index: TopLevelRandomizationOptions.Affinity.rawValue), columnIndexes: NSIndexSet.init(index: 0))
            self.tableView.noteHeightOfRowsWithIndexesChanged(NSIndexSet.init(index: TopLevelRandomizationOptions.Affinity.rawValue))
        }
        else if (currentMode == TopLevelRandomizationOptions.Items) {
            RandomizationSettings.sharedInstance.randomizeItemsEnabled = isEnabled
            DetailContainer.hidden = !isEnabled
            self.tableView.reloadDataForRowIndexes(NSIndexSet.init(index: TopLevelRandomizationOptions.Items.rawValue), columnIndexes: NSIndexSet.init(index: 0))
            self.tableView.noteHeightOfRowsWithIndexesChanged(NSIndexSet.init(index: TopLevelRandomizationOptions.Items.rawValue))
        }
        else if (currentMode == TopLevelRandomizationOptions.Classes) {
            RandomizationSettings.sharedInstance.randomizeClassesEnabled = isEnabled
            DetailContainer.hidden = !isEnabled
            self.tableView.reloadDataForRowIndexes(NSIndexSet.init(index: TopLevelRandomizationOptions.Classes.rawValue), columnIndexes: NSIndexSet.init(index: 0))
            self.tableView.noteHeightOfRowsWithIndexesChanged(NSIndexSet.init(index: TopLevelRandomizationOptions.Classes.rawValue))
        }
    }
}

enum TopLevelRandomizationOptions : Int {
    case Growths
    case Bases
    case Constitution
    case Movement
    case Affinity
    case Items
    case Classes
    case Buff
    case Recruitment
    
    case Count
}

extension MainViewController: NSTableViewDataSource {
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return TopLevelRandomizationOptions.Count.rawValue
    }
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cellView: TitleDetailCellView = tableView.makeViewWithIdentifier(tableColumn!.identifier, owner: self) as! TitleDetailCellView
        
        cellView.expectedWidth = tableView.frame.size.width
        cellView.titleLabel.font = NSFontManager.sharedFontManager().fontWithFamily("Helvetica", traits: NSFontTraitMask.UnitalicFontMask, weight: 0, size: 14)
        cellView.detailLabel.font = NSFontManager.sharedFontManager().fontWithFamily("Helvetica", traits: NSFontTraitMask.ItalicFontMask, weight: 0, size: 12)
        
        cellView.titleLabel.textColor = NSColor.blackColor()
        cellView.detailLabel.textColor = NSColor.grayColor()
        
        if (row == TopLevelRandomizationOptions.Growths.rawValue) {
            cellView.titleLabel.stringValue = "Randomize Growths"
            if (RandomizationSettings.sharedInstance.randomizeGrowthsEnabled) {
                cellView.detailLabel.stringValue = GrowthsDetailViewController.descriptionString()
                cellView.detailLabel.font = NSFontManager.sharedFontManager().fontWithFamily("Helvetica", traits: NSFontTraitMask.UnitalicFontMask, weight: 0, size: 12)
                cellView.detailLabel.textColor = NSColor.blackColor()
            }
            else {
                cellView.detailLabel.stringValue = "\tDisabled"
            }
            cellView.needsLayout = true
        }
        else if (row == TopLevelRandomizationOptions.Bases.rawValue) {
            cellView.titleLabel.stringValue = "Randomize Bases"
            if (RandomizationSettings.sharedInstance.randomizeBasesEnabled) {
                cellView.detailLabel.stringValue = BasesDetailViewController.descriptionString()
                cellView.detailLabel.font = NSFontManager.sharedFontManager().fontWithFamily("Helvetica", traits: NSFontTraitMask.UnitalicFontMask, weight: 0, size: 12)
                cellView.detailLabel.textColor = NSColor.blackColor()
            }
            else {
                cellView.detailLabel.stringValue = "\tDisabled"
            }
            cellView.needsLayout = true
        }
        else if (row == TopLevelRandomizationOptions.Constitution.rawValue) {
            cellView.titleLabel.stringValue = "Randomize CON"
            if (RandomizationSettings.sharedInstance.randomizeConstitutionEnabled) {
                cellView.detailLabel.stringValue = ConstitutionDetailViewController.descriptionString()
                cellView.detailLabel.font = NSFontManager.sharedFontManager().fontWithFamily("Helvetica", traits: NSFontTraitMask.UnitalicFontMask, weight: 0, size: 12)
                cellView.detailLabel.textColor = NSColor.blackColor()
            }
            else {
                cellView.detailLabel.stringValue = "\tDisabled"
            }
            cellView.needsLayout = true
        }
        else if (row == TopLevelRandomizationOptions.Movement.rawValue) {
            cellView.titleLabel.stringValue = "Randomize MOV"
            if (RandomizationSettings.sharedInstance.randomizeMovementEnabled) {
                cellView.detailLabel.stringValue = MovementDetailViewController.descriptionString()
                cellView.detailLabel.font = NSFontManager.sharedFontManager().fontWithFamily("Helvetica", traits: NSFontTraitMask.UnitalicFontMask, weight: 0, size: 12)
                cellView.detailLabel.textColor = NSColor.blackColor()
            }
            else {
                cellView.detailLabel.stringValue = "\tDisabled"
            }
            cellView.needsLayout = true
        }
        else if (row == TopLevelRandomizationOptions.Affinity.rawValue) {
            cellView.titleLabel.stringValue = "Randomize Affinity"
            if (RandomizationSettings.sharedInstance.randomizeAffinityEnabled) {
                cellView.detailLabel.stringValue = "\tEnabled"
                cellView.detailLabel.font = NSFontManager.sharedFontManager().fontWithFamily("Helvetica", traits: NSFontTraitMask.UnitalicFontMask, weight: 0, size: 12)
                cellView.detailLabel.textColor = NSColor.blackColor()
            }
            else {
                cellView.detailLabel.stringValue = "\tDisabled"
            }
            cellView.needsLayout = true
        }
        else if (row == TopLevelRandomizationOptions.Items.rawValue) {
            cellView.titleLabel.stringValue = "Randomize Items"
            if (RandomizationSettings.sharedInstance.randomizeItemsEnabled) {
                cellView.detailLabel.stringValue = WeaponDetailViewController.descriptionString()
                cellView.detailLabel.font = NSFontManager.sharedFontManager().fontWithFamily("Helvetica", traits: NSFontTraitMask.UnitalicFontMask, weight: 0, size: 12)
                cellView.detailLabel.textColor = NSColor.blackColor()
            }
            else {
                cellView.detailLabel.stringValue = "\tDisabled"
            }
            cellView.needsLayout = true
        }
        else if (row == TopLevelRandomizationOptions.Classes.rawValue) {
            cellView.titleLabel.stringValue = "Randomize Classes"
            if (RandomizationSettings.sharedInstance.randomizeClassesEnabled) {
                cellView.detailLabel.stringValue = ClassesDetailViewController.descriptionString()
                cellView.detailLabel.font = NSFontManager.sharedFontManager().fontWithFamily("Helvetica", traits: NSFontTraitMask.UnitalicFontMask, weight: 0, size: 12)
                cellView.detailLabel.textColor = NSColor.blackColor()
            }
            else {
                cellView.detailLabel.stringValue = "\tDisabled"
            }
            cellView.needsLayout = true
        }
        else if (row == TopLevelRandomizationOptions.Buff.rawValue) {
            cellView.titleLabel.stringValue = "Buff Enemies"
            cellView.detailLabel.stringValue = "\tDisabled"
            cellView.needsLayout = true
        }
        else if (row == TopLevelRandomizationOptions.Recruitment.rawValue) {
            cellView.titleLabel.stringValue = "Recruitment Type"
            cellView.detailLabel.stringValue = "\tNormal"
            cellView.needsLayout = true
            cellView.detailLabel.font = NSFontManager.sharedFontManager().fontWithFamily("Helvetica", traits: NSFontTraitMask.UnitalicFontMask, weight: 0, size: 12)
            cellView.detailLabel.textColor = NSColor.blackColor()
        }
        
        return cellView
    }
    
    func tableView(tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return TitleDetailCellView.heightForRowWithConfiguredCell { (cellView) -> Void in
            cellView.expectedWidth = tableView.frame.size.width
            cellView.titleLabel.font = NSFontManager.sharedFontManager().fontWithFamily("Helvetica", traits: NSFontTraitMask.UnitalicFontMask, weight: 0, size: 14)
            cellView.detailLabel.font = NSFontManager.sharedFontManager().fontWithFamily("Helvetica", traits: NSFontTraitMask.ItalicFontMask, weight: 0, size: 12)
            
            if (row == TopLevelRandomizationOptions.Growths.rawValue) {
                cellView.titleLabel.stringValue = "Randomize Growths"
                if (RandomizationSettings.sharedInstance.randomizeGrowthsEnabled) {
                    cellView.detailLabel.stringValue = GrowthsDetailViewController.descriptionString()
                    cellView.detailLabel.font = NSFontManager.sharedFontManager().fontWithFamily("Helvetica", traits: NSFontTraitMask.UnitalicFontMask, weight: 0, size: 12)
                    cellView.detailLabel.textColor = NSColor.blackColor()
                }
                else {
                    cellView.detailLabel.stringValue = "\tDisabled"
                }
            }
            else if (row == TopLevelRandomizationOptions.Bases.rawValue) {
                cellView.titleLabel.stringValue = "Randomize Bases"
                if (RandomizationSettings.sharedInstance.randomizeBasesEnabled) {
                    cellView.detailLabel.stringValue = BasesDetailViewController.descriptionString()
                    cellView.detailLabel.font = NSFontManager.sharedFontManager().fontWithFamily("Helvetica", traits: NSFontTraitMask.UnitalicFontMask, weight: 0, size: 12)
                    cellView.detailLabel.textColor = NSColor.blackColor()
                }
                else {
                    cellView.detailLabel.stringValue = "\tDisabled"
                }
            }
            else if (row == TopLevelRandomizationOptions.Constitution.rawValue) {
                cellView.titleLabel.stringValue = "Randomize CON"
                if (RandomizationSettings.sharedInstance.randomizeConstitutionEnabled) {
                    cellView.detailLabel.stringValue = ConstitutionDetailViewController.descriptionString()
                    cellView.detailLabel.font = NSFontManager.sharedFontManager().fontWithFamily("Helvetica", traits: NSFontTraitMask.UnitalicFontMask, weight: 0, size: 12)
                    cellView.detailLabel.textColor = NSColor.blackColor()
                }
                else {
                    cellView.detailLabel.stringValue = "\tDisabled"
                }
            }
            else if (row == TopLevelRandomizationOptions.Movement.rawValue) {
                cellView.titleLabel.stringValue = "Randomize MOV"
                if (RandomizationSettings.sharedInstance.randomizeMovementEnabled) {
                    cellView.detailLabel.stringValue = MovementDetailViewController.descriptionString()
                    cellView.detailLabel.font = NSFontManager.sharedFontManager().fontWithFamily("Helvetica", traits: NSFontTraitMask.UnitalicFontMask, weight: 0, size: 12)
                    cellView.detailLabel.textColor = NSColor.blackColor()
                }
                else {
                    cellView.detailLabel.stringValue = "\tDisabled"
                }
            }
            else if (row == TopLevelRandomizationOptions.Affinity.rawValue) {
                cellView.titleLabel.stringValue = "Randomize Affinity"
                if (RandomizationSettings.sharedInstance.randomizeAffinityEnabled) {
                    cellView.detailLabel.stringValue = "\tEnabled"
                    cellView.detailLabel.font = NSFontManager.sharedFontManager().fontWithFamily("Helvetica", traits: NSFontTraitMask.UnitalicFontMask, weight: 0, size: 12)
                    cellView.detailLabel.textColor = NSColor.blackColor()
                }
                else {
                    cellView.detailLabel.stringValue = "\tDisabled"
                }
            }
            else if (row == TopLevelRandomizationOptions.Items.rawValue) {
                cellView.titleLabel.stringValue = "Randomize Items"
                if (RandomizationSettings.sharedInstance.randomizeItemsEnabled) {
                    cellView.detailLabel.stringValue = WeaponDetailViewController.descriptionString()
                    cellView.detailLabel.font = NSFontManager.sharedFontManager().fontWithFamily("Helvetica", traits: NSFontTraitMask.UnitalicFontMask, weight: 0, size: 12)
                    cellView.detailLabel.textColor = NSColor.blackColor()
                }
                else {
                    cellView.detailLabel.stringValue = "\tDisabled"
                }
            }
            else if (row == TopLevelRandomizationOptions.Classes.rawValue) {
                cellView.titleLabel.stringValue = "Randomize Classes"
                if (RandomizationSettings.sharedInstance.randomizeClassesEnabled) {
                    cellView.detailLabel.stringValue = ClassesDetailViewController.descriptionString()
                    cellView.detailLabel.font = NSFontManager.sharedFontManager().fontWithFamily("Helvetica", traits: NSFontTraitMask.UnitalicFontMask, weight: 0, size: 12)
                    cellView.detailLabel.textColor = NSColor.blackColor()
                }
                else {
                    cellView.detailLabel.stringValue = "\tDisabled"
                }
            }
        }
    }
}

extension MainViewController: NSTableViewDelegate {
    func tableViewSelectionDidChange(notification: NSNotification) {
        print("Selected row ", NSNumber.init(integer: self.tableView.selectedRow))

        for subview in self.DetailContainer.contentView!.subviews {
            subview.removeFromSuperview()
            
            self.currentMode = nil
            self.masterEnabledSwitch.state = NSOffState
            self.masterEnabledSwitch.enabled = false
            self.DetailContainer.hidden = true
        }
        
        var contentView : NSView?
        
        if (self.tableView.selectedRow == TopLevelRandomizationOptions.Growths.rawValue) {
            self.currentMode = TopLevelRandomizationOptions.Growths
            self.masterEnabledSwitch.state = RandomizationSettings.sharedInstance.randomizeGrowthsEnabled ? NSOnState : NSOffState
            self.masterEnabledSwitch.enabled = true
            self.DetailContainer.hidden = !RandomizationSettings.sharedInstance.randomizeGrowthsEnabled
            
            contentView = self.growthContentView
        }
        else if (self.tableView.selectedRow == TopLevelRandomizationOptions.Bases.rawValue) {
            self.currentMode = TopLevelRandomizationOptions.Bases
            self.masterEnabledSwitch.state = RandomizationSettings.sharedInstance.randomizeBasesEnabled ? NSOnState : NSOffState
            self.masterEnabledSwitch.enabled = true
            self.DetailContainer.hidden = !RandomizationSettings.sharedInstance.randomizeBasesEnabled
            
            contentView = self.basesContentView
        }
        else if (self.tableView.selectedRow == TopLevelRandomizationOptions.Constitution.rawValue) {
            self.currentMode = TopLevelRandomizationOptions.Constitution
            self.masterEnabledSwitch.state = RandomizationSettings.sharedInstance.randomizeConstitutionEnabled ? NSOnState : NSOffState
            self.masterEnabledSwitch.enabled = true
            self.DetailContainer.hidden = !RandomizationSettings.sharedInstance.randomizeConstitutionEnabled
            
            contentView = self.constitutionContentView
        }
        
        else if (self.tableView.selectedRow == TopLevelRandomizationOptions.Movement.rawValue) {
            self.currentMode = TopLevelRandomizationOptions.Movement
            self.masterEnabledSwitch.state = RandomizationSettings.sharedInstance.randomizeMovementEnabled ? NSOnState : NSOffState
            self.masterEnabledSwitch.enabled = true
            self.DetailContainer.hidden = !RandomizationSettings.sharedInstance.randomizeMovementEnabled
            
            contentView = self.movementContentView
        }
        else if (self.tableView.selectedRow == TopLevelRandomizationOptions.Affinity.rawValue) {
            self.currentMode = TopLevelRandomizationOptions.Affinity
            self.masterEnabledSwitch.state = RandomizationSettings.sharedInstance.randomizeAffinityEnabled ? NSOnState : NSOffState
            self.masterEnabledSwitch.enabled = true
            
            self.DetailContainer.hidden = true
        }
        else if (self.tableView.selectedRow == TopLevelRandomizationOptions.Items.rawValue) {
            self.currentMode = TopLevelRandomizationOptions.Items
            self.masterEnabledSwitch.state = RandomizationSettings.sharedInstance.randomizeItemsEnabled ? NSOnState : NSOffState
            self.masterEnabledSwitch.enabled = true
            
            self.DetailContainer.hidden = !RandomizationSettings.sharedInstance.randomizeItemsEnabled
            
            contentView = self.weaponContentView
        }
        else if (self.tableView.selectedRow == TopLevelRandomizationOptions.Classes.rawValue) {
            self.currentMode = TopLevelRandomizationOptions.Classes
            self.masterEnabledSwitch.state = RandomizationSettings.sharedInstance.randomizeClassesEnabled ? NSOnState : NSOffState
            self.masterEnabledSwitch.enabled = true
            
            self.DetailContainer.hidden = !RandomizationSettings.sharedInstance.randomizeClassesEnabled
            
            contentView = self.classesContentView
        }
        
        if (contentView != nil) {
            self.DetailContainer.contentView?.addSubview(contentView!)
            
            NSLayoutConstraint.init(item: contentView!, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.DetailContainer.contentView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 10.0).active = true
            NSLayoutConstraint.init(item: contentView!, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self.DetailContainer.contentView, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 10.0).active = true
            NSLayoutConstraint.init(item: contentView!, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self.DetailContainer.contentView, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: -10.0).active = true
            let bottomConstraint : NSLayoutConstraint = NSLayoutConstraint.init(item: contentView!, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.DetailContainer.contentView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -10.0)
            
            bottomConstraint.priority = NSLayoutPriorityDefaultLow
            
            bottomConstraint.active = true
            
        }
    }
}

extension MainViewController : DetailContentViewDelegate {
    func detailContentViewDelegateDidChangeContent(view: DetailContentViewProtocol) {
        if (view === self.growthsDetailViewController) {
            self.tableView.reloadDataForRowIndexes(NSIndexSet.init(index: TopLevelRandomizationOptions.Growths.rawValue), columnIndexes: NSIndexSet.init(index: 0))
            self.tableView.noteHeightOfRowsWithIndexesChanged(NSIndexSet.init(index: TopLevelRandomizationOptions.Growths.rawValue))
        }
        else if (view === self.basesDetailViewController) {
            self.tableView.reloadDataForRowIndexes(NSIndexSet.init(index: TopLevelRandomizationOptions.Bases.rawValue), columnIndexes: NSIndexSet.init(index: 0))
            self.tableView.noteHeightOfRowsWithIndexesChanged(NSIndexSet.init(index: TopLevelRandomizationOptions.Bases.rawValue))
        }
        else if (view === self.constitutionDetailViewController) {
            self.tableView.reloadDataForRowIndexes(NSIndexSet.init(index: TopLevelRandomizationOptions.Constitution.rawValue), columnIndexes: NSIndexSet.init(index: 0))
            self.tableView.noteHeightOfRowsWithIndexesChanged(NSIndexSet.init(index: TopLevelRandomizationOptions.Constitution.rawValue))
        }
        else if (view === self.movementDetailViewController) {
            self.tableView.reloadDataForRowIndexes(NSIndexSet.init(index: TopLevelRandomizationOptions.Movement.rawValue), columnIndexes: NSIndexSet.init(index: 0))
            self.tableView.noteHeightOfRowsWithIndexesChanged(NSIndexSet.init(index: TopLevelRandomizationOptions.Movement.rawValue))
        }
        else if (view === self.weaponDetailViewController) {
            self.tableView.reloadDataForRowIndexes(NSIndexSet.init(index: TopLevelRandomizationOptions.Items.rawValue), columnIndexes: NSIndexSet.init(index: 0))
            self.tableView.noteHeightOfRowsWithIndexesChanged(NSIndexSet.init(index: TopLevelRandomizationOptions.Items.rawValue))
        }
        else if (view === self.classesDetailViewController) {
            self.tableView.reloadDataForRowIndexes(NSIndexSet.init(index: TopLevelRandomizationOptions.Classes.rawValue), columnIndexes: NSIndexSet.init(index: 0))
            self.tableView.noteHeightOfRowsWithIndexesChanged(NSIndexSet.init(index: TopLevelRandomizationOptions.Classes.rawValue))
        }
    }
}