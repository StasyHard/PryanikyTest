//
//  SuccessView.swift
//  PryanikyTest
//
//  Created by Anastasia Reyngardt on 29.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

class SuccessView: UIView {
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.axis = .vertical
        return stack
    }()
    
    private lazy var hzView: HzView = {
        let hz = HzView()
        return hz
    }()
    
    private lazy var pictureView: PictureView = {
        let view = PictureView()
        return view
    }()
    
    private lazy var selectorView: SelectorView = {
        let view = SelectorView()
        return view
    }()
    
    func showTitle(title: String) {
        
    }
    
    func showSuccessViews(forData viewsDataModel: ResponseDataModel) {
        
        let viewsNameArray = viewsDataModel.views
        let viewsData = viewsDataModel.data
        
        viewsNameArray.forEach { name in
            
            let model: ContentDataModel? = viewsData.first { model -> Bool in
                model.title == name
            }
            
            switch name {
            case "hz":
                let hz: IndefiniteModel? = model?.body?.getContent()
                break
            case "picture":
                let picture: PictureModel? = model?.body?.getContent()
                break
            case "selector":
                 let selector: SelestorModel? = model?.body?.getContent()
                break
            default:
                break
            }
            
            
        }
    
        
        self.addSubview(stack)
        stack.addArrangedSubview(hzView)
        hzView.hzLbl.text = "hzView"
        
        stack.addArrangedSubview(pictureView)
        pictureView.imageView.load(url: URL(string: "https://pryaniky.com/static/img/logo-a-512.png")!)
        pictureView.titleLbl.text = "picture viev"
        
        stack.addArrangedSubview(selectorView)
        selectorView.descriptionLbl.text = "selector view"
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
    }
    
    
}
