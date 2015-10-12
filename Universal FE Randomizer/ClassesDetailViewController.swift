//
//  ClasssDetailViewController.swift
//  Universal FE Randomizer
//
//  Created by Shen Lu on 10/11/15.
//  Copyright © 2015 Shen Lu. All rights reserved.
//

import Cocoa

enum ClassMethod {
    case Simple
    case Advanced
}

class ClassesDetailViewController: NSViewController, DetailContentViewProtocol {

    @IBOutlet weak var simpleButton: NSButton!
    @IBOutlet weak var simpleView: NSView!
    @IBOutlet weak var lordsCheckbox: NSButton!
    @IBOutlet weak var thievesCheckbox: NSButton!
    @IBOutlet weak var bossesCheckbox: NSButton!
    @IBOutlet weak var enemiesCheckbox: NSButton!
    @IBOutlet weak var crossGenderCheckbox: NSButton!
    @IBOutlet weak var uniqueClassesCheckbox: NSButton!
    
    @IBOutlet weak var advancedButton: NSButton!
    @IBOutlet weak var advancedView: NSView!
    @IBOutlet weak var characterView: NSView!
    @IBOutlet weak var classView: NSView!
    @IBOutlet weak var classPoolTableView: NSTableView!
    @IBOutlet weak var bossTableView: NSTableView!
    @IBOutlet weak var playableCharacterTableView: NSTableView!
    @IBOutlet weak var randomEnemyCheckbox: NSButton!
    
    weak var delegate : DetailContentViewDelegate?
    
    var bossList : [FECharacter]?
    var pcList : [FECharacter]?
    var classList : [FEClass]?
    
    var setupComplete : Bool = false
    
    var game : BaseGame? = nil {
        didSet {
            
            bossList = game?.bossCharacterList()
            pcList = game?.playableCharacterList()
            classList = game?.eligibleClasses()
            
            bossTableView.reloadData()
            playableCharacterTableView.reloadData()
            classPoolTableView.reloadData()
            
            updateAdvancedViewSelectionsWithCurentSettings()
            
            setupComplete = true
        }
    }
    
    override func loadView() {
        let nib : NSNib? = NSNib.init(nibNamed: "ClassesDetailViewController", bundle: nil)
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
        
        advancedView.hidden = true
        simpleButton.state = NSOnState
        
        lordsCheckbox.state = RandomizationSettings.sharedInstance.simpleClassIncludeLords ? NSOnState : NSOffState
        thievesCheckbox.state = RandomizationSettings.sharedInstance.simpleClassIncludeThieves ? NSOnState : NSOffState
        bossesCheckbox.state = RandomizationSettings.sharedInstance.simpleClassIncludeBosses ? NSOnState : NSOffState
        enemiesCheckbox.state = RandomizationSettings.sharedInstance.simpleClassIncludeRegularEnemies ? NSOnState : NSOffState
        uniqueClassesCheckbox.state = RandomizationSettings.sharedInstance.simpleClassAllowUniqueClasses ? NSOnState : NSOffState
        crossGenderCheckbox.state = RandomizationSettings.sharedInstance.simpleClassAllowCrossgender ? NSOnState : NSOffState
        
        randomEnemyCheckbox.state = RandomizationSettings.sharedInstance.advancedRandomizeRegularEnemies ? NSOnState : NSOffState
        
        bossTableView.setDelegate(self)
        bossTableView.setDataSource(self)
        
        playableCharacterTableView.setDelegate(self)
        playableCharacterTableView.setDataSource(self)
        
        classPoolTableView.setDelegate(self)
        classPoolTableView.setDataSource(self)
        
        game = RandomizationSettings.sharedInstance.game
    }
    
    @IBAction func onMethodChanged(sender: AnyObject) {
        if (sender === self.simpleButton) {
            simpleView.hidden = false
            advancedView.hidden = true
            
            RandomizationSettings.sharedInstance.classMethod = ClassMethod.Simple
        }
        else if (sender === self.advancedButton) {
            simpleView.hidden = true
            advancedView.hidden = false
            
            RandomizationSettings.sharedInstance.classMethod = ClassMethod.Advanced
        }
        
        self.delegate?.detailContentViewDelegateDidChangeContent(self)
    }
    
    // Simple Actions
    @IBAction func onLordsCheckbox(sender: AnyObject) {
        RandomizationSettings.sharedInstance.simpleClassIncludeLords = (self.lordsCheckbox.state == NSOnState)
        
        self.delegate?.detailContentViewDelegateDidChangeContent(self)
    }
    @IBAction func onThievesCheckbox(sender: AnyObject) {
        RandomizationSettings.sharedInstance.simpleClassIncludeThieves = (self.thievesCheckbox.state == NSOnState)
        
        self.delegate?.detailContentViewDelegateDidChangeContent(self)
    }
    @IBAction func onBossesCheckbox(sender: AnyObject) {
        RandomizationSettings.sharedInstance.simpleClassIncludeBosses = (self.bossesCheckbox.state == NSOnState)
        
        self.delegate?.detailContentViewDelegateDidChangeContent(self)
    }
    @IBAction func onEnemiesCheckbox(sender: AnyObject) {
        RandomizationSettings.sharedInstance.simpleClassIncludeRegularEnemies = (self.enemiesCheckbox.state == NSOnState)
        
        self.delegate?.detailContentViewDelegateDidChangeContent(self)
    }
    @IBAction func onCrossGenderCheckbox(sender: AnyObject) {
        RandomizationSettings.sharedInstance.simpleClassAllowCrossgender = (self.crossGenderCheckbox.state == NSOnState)
        
        self.delegate?.detailContentViewDelegateDidChangeContent(self)
    }
    @IBAction func onUniqueClassesCheckbox(sender: AnyObject) {
        RandomizationSettings.sharedInstance.simpleClassAllowUniqueClasses = (self.uniqueClassesCheckbox.state == NSOnState)
        
        self.delegate?.detailContentViewDelegateDidChangeContent(self)
    }
    
    // Advanced Actions
    @IBAction func onRegularEnemiesCheckbox(sender: AnyObject) {
        RandomizationSettings.sharedInstance.advancedRandomizeRegularEnemies = (self.randomEnemyCheckbox.state == NSOnState)
    }
    
    static func descriptionString() -> String {
        if (RandomizationSettings.sharedInstance.classMethod == ClassMethod.Simple) {
            return "\tClass Method: Simple" + (RandomizationSettings.sharedInstance.simpleClassIncludeLords ? "\n\t\tInclude Lords" : "") + (RandomizationSettings.sharedInstance.simpleClassIncludeThieves ? "\n\t\tInclude Thieves" : "") + (RandomizationSettings.sharedInstance.simpleClassIncludeBosses ? "\n\t\tInclude Bosses" : "") + (RandomizationSettings.sharedInstance.simpleClassIncludeRegularEnemies ? "\n\t\tInclude Minions" : "") + (RandomizationSettings.sharedInstance.simpleClassAllowUniqueClasses ? "\n\t\tAllow Unique Classes" : "") + (RandomizationSettings.sharedInstance.simpleClassAllowCrossgender ? "\n\t\tAllow Crossgender" : "")
        }
        else if (RandomizationSettings.sharedInstance.classMethod == ClassMethod.Advanced) {
            return "\tClass Method: Advanced..."
        }
        
        return "Unknown Class Method"
    }
    
    func updateAdvancedViewSelectionsWithCurentSettings() {
        let indexSet : NSMutableIndexSet = NSMutableIndexSet()
        
        for bossCharacter in RandomizationSettings.sharedInstance.bossCharactersToRandomize {
            let index : Int? = bossList?.indexOf( {return $0.characterID == bossCharacter.characterID} )
            if (index != nil) {
                indexSet.addIndex(index!)
            }
        }
        
        bossTableView.selectRowIndexes(indexSet, byExtendingSelection: false)
        
        indexSet.removeAllIndexes()
        
        for pc in RandomizationSettings.sharedInstance.playableCharactersToRandomize {
            let index : Int? = pcList?.indexOf( {return $0.characterID == pc.characterID} )
            if (index != nil) {
                indexSet.addIndex(index!)
            }
        }
        
        playableCharacterTableView.selectRowIndexes(indexSet, byExtendingSelection: false)
        
        indexSet.removeAllIndexes()
        
        for charClass in RandomizationSettings.sharedInstance.allowedClasses {
            let index : Int? = classList?.indexOf( {return $0.classID == charClass.classID} )
            if (index != nil) {
                indexSet.addIndex(index!)
            }
        }
        
        classPoolTableView.selectRowIndexes(indexSet, byExtendingSelection: false)
    }
}

extension ClassesDetailViewController : NSTableViewDelegate {
    func tableViewSelectionDidChange(notification: NSNotification) {
        if (setupComplete) {
            if (notification.object === self.playableCharacterTableView) {
                let selectedIndexSet : NSIndexSet = self.playableCharacterTableView.selectedRowIndexes
                if (pcList != nil) {
                    for index in 0...pcList!.count - 1 {
                        RandomizationSettings.sharedInstance.setRandomizationForPlayableCharacter(pcList![index], enabled: selectedIndexSet.containsIndex(index))
                    }
                }
            }
            else if (notification.object === self.bossTableView) {
                let selectedIndexSet : NSIndexSet = self.bossTableView.selectedRowIndexes
                if (bossList != nil) {
                    for index in 0...bossList!.count - 1 {
                        RandomizationSettings.sharedInstance.setRandomizationForBossCharacter(bossList![index], enabled: selectedIndexSet.containsIndex(index))
                    }
                }
            }
            else if (notification.object === self.classPoolTableView) {
                let selectedIndexSet : NSIndexSet = self.classPoolTableView.selectedRowIndexes
                if (classList != nil) {
                    for index in 0...classList!.count - 1 {
                        RandomizationSettings.sharedInstance.setClassForRandomization(classList![index], enabled: selectedIndexSet.containsIndex(index))
                    }
                }
            }
        }
    }
}

extension ClassesDetailViewController : NSTableViewDataSource {
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        if (self.game == nil) {
            return 0
        }
        if (tableView == self.bossTableView) {
            return (bossList != nil ? bossList!.count : 0)
        }
        if (tableView == self.playableCharacterTableView) {
            return (pcList != nil ? pcList!.count : 0)
        }
        if (tableView == self.classPoolTableView) {
            return (classList != nil ? classList!.count : 0)
        }
        
        return 0
    }
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cellView: NSTableCellView = tableView.makeViewWithIdentifier(tableColumn!.identifier, owner: self) as! NSTableCellView
        
        if (self.game != nil) {
            var titleString : String = ""
            if (tableView == self.bossTableView) {
                titleString = bossList![row].displayName
            }
            if (tableView == self.playableCharacterTableView) {
                titleString = pcList![row].displayName
            }
            if (tableView == self.classPoolTableView) {
                titleString = classList![row].displayName
            }
            
            cellView.textField?.stringValue = titleString
        }
        
        return cellView
    }
}
