//
//  ViewController.swift
//  AutismOnboarding
//
//  Created by Jamario Davis on 3/7/19.
//  Copyright © 2019 KAYCAM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var skipButton: UIButton!

    fileprivate let items = [
        OnboardingItemInfo(informationImage: Asset.jigsaw.image,
                           title: "Support",
                           description: "Check out links in information section",
                           pageIcon: Asset.autism.image,
                           color: UIColor(red: 20/255, green: 72/255, blue: 28/255, alpha: 1.00),
                           titleColor: UIColor(red: 250/255, green: 196/255, blue: 59/255, alpha: 1.00), descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont),
        
        OnboardingItemInfo(informationImage: Asset.learn.image,
                           title: "Educate",
                           description: "Test your knowledge about autism",
                           pageIcon: Asset.speak.image,
                           color: UIColor(red: 20/255, green: 72/255, blue: 28/255, alpha: 1.00),
                           titleColor: UIColor(red: 250/255, green: 196/255, blue: 59/255, alpha: 1.00), descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont),
        
        OnboardingItemInfo(informationImage: Asset.share.image,
                           title: "Share",
                           description: "Spread the word about this app and autism resources available",
                           pageIcon: Asset.word.image,
                           color: UIColor(red: 20/255, green: 72/255, blue: 28/255, alpha: 1.00),
                           titleColor: UIColor(red: 250/255, green: 196/255, blue: 59/255, alpha: 1.00), descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont),
        
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        skipButton.isHidden = true
        
        setupPaperOnboardingView()
        
        view.bringSubviewToFront(skipButton)
    }
    
    private func setupPaperOnboardingView() {
        let onboarding = PaperOnboarding()
        onboarding.delegate = self
        onboarding.dataSource = self
        onboarding.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(onboarding)
        
        // Add constraints
        for attribute: NSLayoutConstraint.Attribute in [.left, .right, .top, .bottom] {
            let constraint = NSLayoutConstraint(item: onboarding,
                                                attribute: attribute,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: attribute,
                                                multiplier: 1,
                                                constant: 0)
            view.addConstraint(constraint)
        }
    }
}

extension ViewController {
    
    @IBAction func skipButtonTapped(_: UIButton) {
        
    }
    
}
    
extension ViewController: PaperOnboardingDelegate {
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        skipButton.isHidden = index == 2 ? false : true
    }
    
    func onboardingDidTransitonToIndex(_: Int) {
    }
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
      
    }
}

// MARK: PaperOnboardingDataSource

extension ViewController: PaperOnboardingDataSource {
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        return items[index]
    }
    
    func onboardingItemsCount() -> Int {
        return 3
    }
    
}


//MARK: Constants
extension ViewController {
    
    private static let titleFont = UIFont(name: "Nunito-Bold", size: 36.0) ?? UIFont.boldSystemFont(ofSize: 36.0)
    private static let descriptionFont = UIFont(name: "OpenSans-Regular", size: 20.0) ?? UIFont.systemFont(ofSize: 20.0)
}


    

