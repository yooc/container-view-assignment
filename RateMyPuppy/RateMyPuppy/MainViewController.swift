import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var puppyDetails: UIView!
    
    let model: RateMyPuppyModel = RateMyPuppyModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let puppyView as PuppyViewController:
            puppyView.delegate = self
        case let favoritePuppy as FavoriteViewController:
            favoritePuppy.delegate = self
        default:
            break
        }
    }
    
}

// MARK: - Puppy Data Delegate
extension MainViewController: PuppyDataDelegate {
    func getCurrentPuppy() -> PuppyObject {
        return model.currentPuppy
    }
}
