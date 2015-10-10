//
//  ExpandableCellView.swift
//  Universal FE Randomizer
//
//  Created by Shen Lu on 10/2/15.
//  Copyright © 2015 Shen Lu. All rights reserved.
//

import Cocoa

enum ExpandableCellState {
    case Initializing
    case Collapsed
    case Expanded
}

protocol ExpandButtonTarget : class {
    func toggleExpandCollapse()
}

protocol ExpandableCellDelegate : class {
    func cellDidChangeToState(cell: ExpandableCellView, state: ExpandableCellState)
}

class ExpandButton: NSButton {
    weak var expandCollapseTarget: ExpandButtonTarget? {
        didSet {
            self.target = expandCollapseTarget
        }
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        self.setButtonType(NSButtonType.OnOffButton)
        self.bezelStyle = NSBezelStyle.DisclosureBezelStyle
        self.title = ""
        
        self.action = Selector.init("toggleExpandCollapse")
    }
    
    init(frame frameRect: NSRect, target: ExpandButtonTarget) {
        super.init(frame: frameRect)
    
        self.setButtonType(NSButtonType.OnOffButton)
        self.bezelStyle = NSBezelStyle.DisclosureBezelStyle
        self.title = ""
        
        self.action = Selector.init("toggleExpandCollapse")
        self.target = target
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ExpandableCellView: NSTableCellView {
    
    weak var delegate: ExpandableCellDelegate?
    
    var disclosureButton: ExpandButton = ExpandButton.init(frame: NSZeroRect)
    
    var currentState: ExpandableCellState = ExpandableCellState.Initializing {
        willSet(newState) {
            if (currentState != newState) {
                if (currentState == ExpandableCellState.Expanded) {
                    // Uninstall expanded view.
                    self.uninstallView(expandedView)
                }
                else if (currentState == ExpandableCellState.Collapsed) {
                    // Uninstall collapsed view.
                    self.uninstallView(collapsedView)
                }
            }
        }
        didSet(oldState) {
            if (currentState != oldState) {
                
                if (oldState != ExpandableCellState.Initializing) {
                    self.delegate?.cellDidChangeToState(self, state: currentState)
                }
                
                if (currentState == ExpandableCellState.Expanded) {
                    // Install Expanded View.
                    self.installView(expandedView)
                }
                else if (currentState == ExpandableCellState.Collapsed) {
                    // Install Collapsed View.
                    self.installView(collapsedView)
                }
            }
        }
    }
    
    var collapsedView: NSView = NSView.init(frame: NSZeroRect) {
        willSet {
            if (self.currentState == ExpandableCellState.Collapsed) {
                self.uninstallView(collapsedView)
            }
        }
        didSet {
            if (self.currentState == ExpandableCellState.Collapsed) {
                self.installView(collapsedView)
            }
        }
    }
    var expandedView: NSView = NSView.init(frame: NSZeroRect) {
        willSet {
            if (self.currentState == ExpandableCellState.Expanded) {
                self.uninstallView(expandedView)
            }
        }
        didSet {
            if (self.currentState == ExpandableCellState.Expanded) {
                self.installView(expandedView)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        disclosureButton.translatesAutoresizingMaskIntoConstraints = false
        
        disclosureButton.expandCollapseTarget = self
        disclosureButton.setContentHuggingPriority(NSLayoutPriorityRequired, forOrientation: NSLayoutConstraintOrientation.Horizontal)
        
        self.addSubview(disclosureButton)
        
        var layoutConstraint = NSLayoutConstraint.init(item: disclosureButton, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 5.0)
        layoutConstraint.active = true
        
        layoutConstraint = NSLayoutConstraint.init(item: disclosureButton, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 10.0)
        layoutConstraint.active = true
        
        self.currentState = ExpandableCellState.Collapsed
    }
    
    static var measuringView : ExpandableCellView? = nil
    
    static func heightForRowWithCollapsedView(collapsedView: NSView, expandedView: NSView, isExpanded: Bool) -> CGFloat {
        var height : CGFloat = 0
        
        if (isExpanded) {
            height = expandedView.intrinsicContentSize.height
        }
        else {
            height = collapsedView.intrinsicContentSize.height
        }
        
        return height
    }

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        // Drawing code here.
    }
    
    override func updateConstraints() {
        
        super.updateConstraints()
    }
    
    func uninstallView(viewToUninstall: NSView!) {
        if (viewToUninstall.superview == self) {
            viewToUninstall.removeFromSuperview()
        }
    }
    
    func installView(viewToInstall: NSView!) {
        self.addSubview(viewToInstall)
        
        viewToInstall.translatesAutoresizingMaskIntoConstraints = false
        
        var layoutConstraint = NSLayoutConstraint.init(item: viewToInstall, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self.disclosureButton, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 5.0)
        layoutConstraint.active = true
        
        layoutConstraint = NSLayoutConstraint.init(item: viewToInstall, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0.0)
        layoutConstraint.active = true
        
        layoutConstraint = NSLayoutConstraint.init(item: viewToInstall, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0)
        layoutConstraint.active = true
        
        layoutConstraint = NSLayoutConstraint.init(item: viewToInstall, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 0.0)
        layoutConstraint.active = true
    }
}

extension ExpandableCellView : ExpandButtonTarget {
    
    func toggleExpandCollapse() {
        Swift.print("Toggle!")
        if (self.currentState == ExpandableCellState.Collapsed || self.currentState == ExpandableCellState.Initializing) {
            self.currentState = ExpandableCellState.Expanded
        }
        else if (self.currentState == ExpandableCellState.Expanded) {
            self.currentState = ExpandableCellState.Collapsed
        }
    }
}

