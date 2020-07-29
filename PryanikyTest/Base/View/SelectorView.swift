//
//  SelectorView.swift
//  PryanikyTest
//
//  Created by Anastasia Reyngardt on 29.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit


class SelectorView: UIView {
    
    lazy var segmentControl: UISegmentedControl = {
        let segmentItems = ["First", "Second"]
        let control = UISegmentedControl(items: segmentItems)
        return control
    }()
    
    lazy var descriptionLbl: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private let stdAnchorConstant: CGFloat = 20
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    //MARK: - Private metods
    private func setupUI() {
        self.backgroundColor = .systemGray
        setupSegmentControl()
        setupDescriptionLbl()
    }
    
    private func setupSegmentControl() {
        self.addSubview(segmentControl)
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.topAnchor
            .constraint(equalTo: self.topAnchor, constant: stdAnchorConstant).isActive = true
        segmentControl.leadingAnchor
            .constraint(equalTo: self.leadingAnchor, constant: stdAnchorConstant).isActive = true
        segmentControl.trailingAnchor
            .constraint(equalTo: self.trailingAnchor, constant: -stdAnchorConstant).isActive = true
        
    }
    
    private func setupDescriptionLbl() {
        self.addSubview(descriptionLbl)
        descriptionLbl.translatesAutoresizingMaskIntoConstraints = false
        descriptionLbl.topAnchor
            .constraint(equalTo: segmentControl.bottomAnchor, constant: 8).isActive = true
        descriptionLbl.leadingAnchor
            .constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: stdAnchorConstant).isActive = true
        descriptionLbl.trailingAnchor
            .constraint(greaterThanOrEqualTo: self.trailingAnchor, constant: -stdAnchorConstant).isActive = true
        descriptionLbl.bottomAnchor
            .constraint(equalTo: self.bottomAnchor, constant: -stdAnchorConstant).isActive = true
        descriptionLbl.centerXAnchor
            .constraint(equalTo: self.centerXAnchor).isActive = true
        
    }
    
}
