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
    private lazy var hzLbl: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private var tapViewCallback: (() -> Void)?
    private let stdAnchorConstant: CGFloat = 20
    
    //MARK: - Init
    init(tapViewCallback: @escaping () -> Void) {
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
    func showContent(content: IndefiniteModel) {
        hzLbl.text = content.text
    }
    
    //MARK: - Private metods
    private func setupUI() {
        self.backgroundColor = .systemGray4
        addTapListener()
        setupLabel()
    }
    
    private func setupLabel() {
        self.addSubview(hzLbl)
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
    
    private func addTapListener() {
        let selector = #selector(self.viewlDidTapped)
        self.addGTapRecognizer(selector: selector)
    }
    
    @objc private func viewlDidTapped() {
        tapViewCallback?()
    }
    
}
