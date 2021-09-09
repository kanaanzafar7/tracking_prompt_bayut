//
//  TrackingPromptViewController.swift
//  tracking_prompt_bayut
//
//  Created by Kanaan Zafar on 09/09/2021.
//

import UIKit

class TrackingPromptViewController: UIViewController {
    
    @IBOutlet weak var permissionDescriptionLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        permissionDescriptionLabel.text = "We need your permission to ensure the content we share is relevant and personalized to you.\n\nTap Allow on the next screen to help us personalize your experience."
        continueButton.layer.cornerRadius = 4
  }
    
    @IBAction func onPressedContinue(_ sender: UIButton) {
    }
    
}
