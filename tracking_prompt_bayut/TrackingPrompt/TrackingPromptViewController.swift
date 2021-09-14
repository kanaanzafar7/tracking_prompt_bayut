import UIKit
import AppTrackingTransparency
class TrackingPromptViewController: UIViewController {
    //MARK: - Properties
    var screenSize: CGSize!
    
    //MARK: - IBOutlets for UI
    @IBOutlet weak var permissionDescriptionLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
   
    //MARK: - IBOutlets for constraints
    @IBOutlet weak var logoConstraintForTop: NSLayoutConstraint!
    @IBOutlet weak var buildingConstraintForTop: NSLayoutConstraint!
    @IBOutlet weak var helpUsLabelConstraintForTop: NSLayoutConstraint!
    @IBOutlet weak var permissionDescriptionConstraintForTop: NSLayoutConstraint!
    @IBOutlet weak var footerDescriptionConstraintForBottom: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenSize = UIScreen.main.bounds.size
        continueButton.layer.cornerRadius = 4
        var fontSize : CGFloat = 16
        
        if screenSize.height < 700 || screenSize.width < 400 {
            fontSize = 14
        }
        
        let permissionDescription = "We need your permission to ensure the content we share is relevant and personalized to you.\n\nTap \"Allow\" on the next screen to help us personalize your experience."
        let attributedString = NSMutableAttributedString.init(string: permissionDescription)
        let range = NSString(string: permissionDescription).range(of: "\"Allow\"", options: String.CompareOptions.caseInsensitive)
        attributedString.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.black,
                                        NSAttributedString.Key.font : UIFont(name: "Lato-Bold", size: fontSize)!
        ], range: range)
        permissionDescriptionLabel.attributedText = attributedString
        updateConstraints()
        
    }
    
    @IBAction func onPressedContinue(_ sender: UIButton) {
        requestPermission()
    }
    func requestPermission() {
        ATTrackingManager.requestTrackingAuthorization { authorizationStatus in
            self.dismiss(animated: true, completion: nil)
        }
    }
    func updateConstraints(){
        logoConstraintForTop.constant = screenSize.height * 0.03
        buildingConstraintForTop.constant  = screenSize.height * 0.05
        helpUsLabelConstraintForTop.constant = screenSize.height * 0.05
        permissionDescriptionConstraintForTop.constant = screenSize.height * 0.03
        footerDescriptionConstraintForBottom.constant = screenSize.height * 0.03
    }

}
