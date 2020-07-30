//
//  SelectorView.swift
//  PryanikyTest
//
//  Created by Anastasia Reyngardt on 29.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit


class SelectorView: UIView {
    
    private var segmentControl: UISegmentedControl?
    
    private lazy var descriptionLbl: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private var content: SelestorModel?
    private var tapViewCallback: ((_ index: Int) -> Void)?
    private let stdAnchorConstant: CGFloat = 20
    
    //MARK: - Init
    init(tapViewCallback: @escaping (_ index: Int) -> Void) {
        super.init(frame: .zero)
        self.tapViewCallback = tapViewCallback
        
        setupUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    //MARK: - Open metods
    func showContent(_ content: SelestorModel) {
        self.content = content
        createSegmentControl(content: content)
        setupSegmentControl()
        setupDescriptionLbl()
        
        descriptionLbl.text = content.variants[content.selectedId].text
    }
    
    //MARK: - Private metods
    private func setupUI() {
        self.backgroundColor = .systemGray6
    }
    
    private func createSegmentControl(content: SelestorModel)  {
        var segmentItems = [String]()
        content.variants.forEach {
            segmentItems.append(String($0.id))
        }
        let segmentControl = UISegmentedControl(items: segmentItems)
        segmentControl.selectedSegmentIndex = content.selectedId
        segmentControl.addTarget(self, action: #selector(indexChanged), for: .valueChanged)
        self.segmentControl = segmentControl
    }
    
    
    private func setupSegmentControl() {
        guard let segmentControl = segmentControl else { return }
        
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
            .constraint(equalTo: segmentControl!.bottomAnchor, constant: 8).isActive = true
        descriptionLbl.leadingAnchor
            .constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: stdAnchorConstant).isActive = true
        descriptionLbl.trailingAnchor
            .constraint(greaterThanOrEqualTo: self.trailingAnchor, constant: -stdAnchorConstant).isActive = true
        descriptionLbl.bottomAnchor
            .constraint(equalTo: self.bottomAnchor, constant: -stdAnchorConstant).isActive = true
        descriptionLbl.centerXAnchor
            .constraint(equalTo: self.centerXAnchor).isActive = true
        
    }
    
    @objc private func indexChanged() {
        guard let segmentControl = segmentControl,
            let content = content
            else { return }
        
        let ind = segmentControl.selectedSegmentIndex
        descriptionLbl.text = content.variants[ind].text
        
        tapViewCallback?(ind)
    }
    
}
