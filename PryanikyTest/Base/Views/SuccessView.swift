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
    private var presenter: MainViewActions?
    
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
        
        viewsNameArray.forEach {
            let name = $0
            
            let model: ContentDataModel? = viewsData.first { model -> Bool in
                model.title == name
            }
            guard let contentModel = model?.body else { return }
            
            switch name {
            case "hz":
                if let hz: IndefiniteModel = contentModel.getContent() {
                    let view = HzView() { [weak self] in
                        self?.presenter?.didTappedView(title: model?.title)
                    }
                    view.showContent(content: hz)
                    stack.addArrangedSubview(view)
                }
            case "picture":
                if let picture: PictureModel = contentModel.getContent() {
                    let view = PictureView() { [weak self] in
                        self?.presenter?.didTappedView(title: model?.title)
                    }
                    view.showContent(content: picture)
                    stack.addArrangedSubview(view)
                }
            case "selector":
                if let select: SelestorModel = contentModel.getContent() {
                    let view = SelectorView() { [weak self] ind in
                        self?.presenter?.didTappedView(id: ind, title: model?.title)
                    }
                    view.showContent(select)
                    stack.addArrangedSubview(view)
                }
            default:
                break
            }
        }
    }
    
    func setPresenter(_ presenter: MainViewActions) {
        self.presenter = presenter
    }
    
    //MARK: - Private metods
    private func setupUI() {
        setupStackView()
    }
    
    fileprivate func setupStackView() {
        self.addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.leadingAnchor
            .constraint(equalTo: self.leadingAnchor).isActive = true
        stack.trailingAnchor
            .constraint(equalTo: self.trailingAnchor).isActive = true
        stack.topAnchor
            .constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
    }
    
}
