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
    
    @IBAction func updateRating(_ sender: UIButton) {
        guard let labelText = sender.titleLabel?.text,
            let rating = Int(labelText) else {
            print("unable to update rating")
            return
        }
        
        model.rateCurrentPuppy(as: rating)
        
        
        
    }

    @IBAction func displayNextPuppy(_ sender: UIButton) {
        guard let puppyView = self.childViewControllers.last as? PuppyViewProtocol else {
            print("unable to display next puppy")
            return
        }
        
        puppyView.updatePuppy(with: model.nextPuppy)
    }
}

// MARK: - Puppy Data Delegate
extension MainViewController: PuppyDataDelegate {
    func getCurrentPuppy() -> PuppyObject {
        return model.currentPuppy
    }
}

protocol PuppyViewProtocol: class {
    func updatePuppy(with puppy: PuppyObject)
}
