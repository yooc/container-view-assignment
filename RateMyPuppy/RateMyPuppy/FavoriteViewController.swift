import UIKit

class FavoriteViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var favoriteText: UILabel!
    
    weak var delegate: PuppyDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
