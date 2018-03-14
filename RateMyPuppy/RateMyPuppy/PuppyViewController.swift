import UIKit

class PuppyViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    weak var delegate: PuppyDataDelegate?
    private var currentPuppy: PuppyObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
