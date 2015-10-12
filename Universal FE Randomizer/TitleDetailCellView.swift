//
//  TitleDetailCellView.swift
//  Universal FE Randomizer
//
//  Created by Shen Lu on 10/8/15.
//  Copyright © 2015 Shen Lu. All rights reserved.
//

import Cocoa

let kTitleDetailCellViewMargin : CGFloat = 5

class TitleDetailCellView : NSTableCellView {
    override var intrinsicContentSize : NSSize {
        get {
            return NSMakeSize(expectedWidth, kTitleDetailCellViewMargin * 3 + titleLabel.intrinsicContentSize.height + detailLabel.intrinsicContentSize.height)
        }
    }
    
    var titleLabel : NSTextField
    var detailLabel : NSTextField
    
    var expectedWidth : CGFloat = 0 {
        didSet {
            titleLabel.preferredMaxLayoutWidth = expectedWidth - 2 * kTitleDetailCellViewMargin
            detailLabel.preferredMaxLayoutWidth = expectedWidth - 2 * kTitleDetailCellViewMargin
            
            invalidateIntrinsicContentSize()
            self.needsLayout = true
        }
    }
    
    init() {
        titleLabel = NSTextField.init()
        detailLabel = NSTextField.init()
        
        super.init(frame: NSZeroRect)
        
        setupView()

    }

    required init?(coder: NSCoder) {
        titleLabel = NSTextField.init()
        detailLabel = NSTextField.init()
        
        super.init(coder: coder)
        
        setupView()
    }
    
    func setupView() {
        titleLabel.backgroundColor = NSColor.clearColor()
        detailLabel.backgroundColor = NSColor.clearColor()
        
        titleLabel.bordered = false
        detailLabel.bordered = false
        
        titleLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        detailLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(titleLabel)
        self.addSubview(detailLabel)
        
        NSLayoutConstraint.init(item: titleLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: kTitleDetailCellViewMargin).active = true
        NSLayoutConstraint.init(item: titleLabel, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: kTitleDetailCellViewMargin).active = true
        NSLayoutConstraint.init(item: titleLabel, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: -1 * kTitleDetailCellViewMargin).active = true
        
        NSLayoutConstraint.init(item: detailLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: titleLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: kTitleDetailCellViewMargin).active = true
        NSLayoutConstraint.init(item: detailLabel, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: kTitleDetailCellViewMargin).active = true
        NSLayoutConstraint.init(item: detailLabel, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: -1 * kTitleDetailCellViewMargin).active = true
        NSLayoutConstraint.init(item: detailLabel, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -1 * kTitleDetailCellViewMargin).active = true

        titleLabel.setContentHuggingPriority(NSLayoutPriorityDefaultHigh + 1, forOrientation: NSLayoutConstraintOrientation.Vertical)
        titleLabel.setContentCompressionResistancePriority(NSLayoutPriorityRequired, forOrientation: NSLayoutConstraintOrientation.Vertical)
        detailLabel.setContentCompressionResistancePriority(NSLayoutPriorityRequired, forOrientation: NSLayoutConstraintOrientation.Vertical)
    }
    
    static var measuringCell : TitleDetailCellView = TitleDetailCellView.init()
    
    static func heightForRowWithConfiguredCell(configureBlock: TitleDetailCellView -> Void) -> CGFloat {
        configureBlock(measuringCell)
        
        measuringCell.invalidateIntrinsicContentSize()
        measuringCell.needsLayout = true
        measuringCell.layoutSubtreeIfNeeded()
        
        return measuringCell.intrinsicContentSize.height
    }
}
