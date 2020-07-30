//
//  SuccessView.swift
//  PryanikyTest
//
//  Created by Anastasia Reyngardt on 29.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

class SuccessView: UIView {
    
    //MARK: - Private properties
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.axis = .vertical
        return stack
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    //MARK: - Open metods
    func showSuccessViews(forData viewsDataModel: ResponseDataModel) {
        
        let viewsNameArray = viewsDataModel.views
        let viewsData = viewsDataModel.data
        
        for index in 0...viewsNameArray.count - 1 {
            let name = viewsNameArray[index]
            
            let model: ContentDataModel? = viewsData.first { model -> Bool in
                model.title == name
            }
            guard let modelContent = model?.body else { return }
            
            switch name {
            case "hz":
                if let hz: IndefiniteModel = modelContent.getContent() {
                    let view = HzView() {
                        print(model?.title)
                    }
                    view.showContent(content: hz)
                    stack.addArrangedSubview(view)
                }
            case "picture":
                if let picture: PictureModel = modelContent.getContent() {
                    let view = PictureView() {
                        print(model?.title)
                    }
                    view.showContent(content: picture)
                    stack.addArrangedSubview(view)
                }
                
            case "selector":
                if let select: SelestorModel = modelContent.getContent() {
                    let view = SelectorView() { ind in
                        print(model?.title)
                        print(ind)
                    }
                    view.showContent(select)
                    stack.addArrangedSubview(view)
                }
            default:
                break
            }
        }
        
    }
    
    //MARK: - Private metods
    private func setupUI() {
        setupStackView()
    }
    
    fileprivate func setupStackView() {
        self.addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
    }
    
    func showTitle(title: String) {
        
    }
    
}
