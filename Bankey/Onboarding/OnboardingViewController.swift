//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by Vishwas Sharma on 15/06/24.
//

import UIKit

class OnboardingViewController: UIViewController {
    let image: String
    let text: String
    let stackView = UIStackView()
    let label = UILabel()
    let imageView = UIImageView()
    
    init(image: String, text: String) {
        self.image = image
        self.text = text
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension OnboardingViewController {
     func style(){
         stackView.translatesAutoresizingMaskIntoConstraints = false
         stackView.axis = .vertical
         stackView.spacing = 20
         //Image
         
         imageView.translatesAutoresizingMaskIntoConstraints = false
         imageView.contentMode = .scaleAspectFit
         imageView.image = UIImage(named: image)
         
         label.translatesAutoresizingMaskIntoConstraints = false
         label.textAlignment = .center
         label.font = UIFont.preferredFont(forTextStyle: .title3)
         label.adjustsFontForContentSizeCategory = true
         label.numberOfLines = 0
         label.text = text
    }
     func layout(){
         stackView.addArrangedSubview(imageView)
         stackView.addArrangedSubview(label)
         
         view.addSubview(stackView)
         NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
         ])
    }
}
