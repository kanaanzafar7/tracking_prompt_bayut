import UIKit
import AppTrackingTransparency
class TrackingPromptViewController: UIViewController {
    
    @IBOutlet weak var permissionDescriptionLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bayutLogo: UIImageView!
    @IBOutlet weak var building: UIImageView!
    @IBOutlet weak var helpUsDescription: UILabel!
    @IBOutlet weak var footerDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continueButton.layer.cornerRadius = 4
        let permissionDescription = "We need your permission to ensure the content we share is relevant and personalized to you.\n\nTap \"Allow\" on the next screen to help us personalize your experience."
        let attributedString = NSMutableAttributedString.init(string: permissionDescription)
        let range = NSString(string: permissionDescription).range(of: "\"Allow\"", options: String.CompareOptions.caseInsensitive)
        attributedString.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.black,
                                        NSAttributedString.Key.font : UIFont(name: "Lato-Bold", size: 16)!
        ], range: range)
        permissionDescriptionLabel.attributedText = attributedString
        addConstraints()
        
    }
    
    @IBAction func onPressedContinue(_ sender: UIButton) {
        requestPermission()
    }
    func requestPermission() {
        ATTrackingManager.requestTrackingAuthorization { authorizationStatus in
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func addConstraints(){
        let screenSize =    UIScreen.main.bounds.size
        print("-----screenSize: \(screenSize.height) and \(screenSize.width)")
    }
}
