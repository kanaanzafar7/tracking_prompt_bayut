import UIKit
import AppTrackingTransparency
class TrackingPromptViewController: UIViewController {
    
    @IBOutlet weak var permissionDescriptionLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let screenRect = UIScreen.main.bounds
        let screenWidth = screenRect.size.width


        let contentRect: CGRect = scrollView.subviews.reduce(into: .zero) { rect, view in
            rect = rect.union(view.frame)
        }
        let size = CGSize(width: screenWidth, height: contentRect.height)
                scrollView.contentSize = size
    }
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
   
    }
    
    @IBAction func onPressedContinue(_ sender: UIButton) {
        requestPermission()
    }
    func requestPermission() {
        ATTrackingManager.requestTrackingAuthorization { authorizationStatus in
            self.dismiss(animated: true, completion: nil)
        }
    }
}
