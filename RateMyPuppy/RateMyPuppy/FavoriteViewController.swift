import UIKit

class FavoriteViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var favoriteText: UILabel!
    
    weak var delegate: PuppyDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let favorite = delegate?.getFavoritePuppy() else {
            print("unable to display favorite puppy")
            return
        }
        
        imageView.image = UIImage.init(named: favorite.image)
        favoriteText.text = favorite.description
    }
}
