//
//  PictureView.swift
//  PryanikyTest
//
//  Created by Anastasia Reyngardt on 29.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit


class PictureView: UIView {
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    lazy var titleLbl: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - Private properties
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
        self.backgroundColor = .lightGray
        setupImageView()
        setupTitle()
    }
    
    private func setupImageView() {
        self.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor
            .constraint(equalTo: self.topAnchor, constant: stdAnchorConstant).isActive = true
        imageView.heightAnchor
            .constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor
            .constraint(equalTo: imageView.heightAnchor, multiplier: 1).isActive = true
        imageView.centerXAnchor
            .constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    private func setupTitle() {
        self.addSubview(titleLbl)
        
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.leadingAnchor
            .constraint(equalTo: self.leadingAnchor, constant: stdAnchorConstant).isActive = true
        titleLbl.trailingAnchor
            .constraint(equalTo: self.trailingAnchor, constant: -stdAnchorConstant).isActive = true
        titleLbl.topAnchor
            .constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        titleLbl.bottomAnchor
            .constraint(equalTo: self.bottomAnchor, constant: -stdAnchorConstant).isActive = true
    }
}
