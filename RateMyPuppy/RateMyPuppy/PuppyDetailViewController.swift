import UIKit

class PuppyDetailViewController: UIViewController {
    
    weak var delegate: PuppyDataDelegate?
    private var currentPuppy: PuppyObject?
    let model: RateMyPuppyModel = RateMyPuppyModel()
    
    @IBOutlet weak var workingView: UIImageView!
    @IBOutlet weak var puppyNameLabel: UILabel!
    @IBOutlet weak var puppyDescriptionTextField: UITextField!
    @IBOutlet weak var removeFromReviewButton: UIButton!
    
    @IBAction func removeFromReviewList(_ sender: UIButton) {
        model.toggleShowInReport()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let currentPuppy = delegate?.getCurrentPuppy() else {
            print("Unable to get current puppy")
            return
        }
        
        workingView.image = UIImage.init(named: currentPuppy.image)
    }
    
    func getPuppyDetails(with puppy: PuppyObject) {
        self.currentPuppy = puppy
        workingView.image = UIImage.init(named: currentPuppy!.image)
        puppyNameLabel.text = puppy.name
        puppyDescriptionTextField.text = puppy.description
    }
}
