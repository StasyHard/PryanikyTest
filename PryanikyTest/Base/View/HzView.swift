//
//  SuccessView.swift
//  PryanikyTest
//
//  Created by Anastasia Reyngardt on 28.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit


class HzView: UIView {
    
    //MARK: - Private properties
    lazy var hzLbl: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGreen
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - Private properties
    private let stdAnchorConstant: CGFloat = 20
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLabel()
    }
    
    //MARK: - Private metods
    
    fileprivate func addTarget() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelDidTapped))
        hzLbl.isUserInteractionEnabled = true
        hzLbl.addGestureRecognizer(tapGesture)
    }
    
    private func setupLabel() {
        self.addSubview(hzLbl)
        addTarget()
        hzLbl.translatesAutoresizingMaskIntoConstraints = false
        hzLbl.leadingAnchor
            .constraint(equalTo: self.leadingAnchor, constant: stdAnchorConstant).isActive = true
        hzLbl.trailingAnchor
            .constraint(equalTo: self.trailingAnchor, constant: -stdAnchorConstant).isActive = true
        hzLbl.topAnchor
            .constraint(equalTo: self.topAnchor, constant: stdAnchorConstant).isActive = true
        hzLbl.bottomAnchor
            .constraint(equalTo: self.bottomAnchor, constant: -stdAnchorConstant).isActive = true
    }
    
    @objc func labelDidTapped() {
        print("labelDidTapped")
    }
    
}
