//
//  ViewController.swift
//  tracking_prompt_bayut
//
//  Created by Kanaan Zafar on 09/09/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func askPermission(_ sender: UIButton) {
        /* let sb = UIStoryboard(name: "MainStoryboard", bundle: nil)
         let vc = sb.instantiateViewController(withIdentifier: "vc-identifier") */
        let sb = UIStoryboard(name: "TrackingPrompt", bundle: nil)
        let trackingPromptVC = sb.instantiateViewController(withIdentifier: "TrackingPrompt")
        present(trackingPromptVC, animated: true) {
            
        }
    }
    
}

