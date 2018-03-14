import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var puppyDetails: UIView!
    @IBOutlet weak var toggleFavorite: UIButton!
    
    let model: RateMyPuppyModel = RateMyPuppyModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super .prepare(for: segue, sender: sender)
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
    
    @IBAction func toggleFavorite(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        var currentView: UIViewController
        var nextView: UIViewController?
        
        switch self.childViewControllers.last {
        case let puppyView as PuppyViewController:
            currentView = puppyView
            nextView = storyboard.instantiateViewController(withIdentifier: "favoritePuppy") as? FavoriteViewController
        case let favoritePuppy as FavoriteViewController:
            currentView = favoritePuppy
            nextView = storyboard.instantiateViewController(withIdentifier: "puppyView") as? PuppyViewController
        default:
            print("current view is unknown; unable to toggle")
            return
        }
        
        guard let instantiatedView = nextView else {
            print("Unable to instantiate next view controller")
            return
        }
        
        currentView.willMove(toParentViewController: nil)
        currentView.view.removeFromSuperview()
        currentView.removeFromParentViewController()
        
        instantiatedView.willMove(toParentViewController: self)
        addChildViewController(instantiatedView)
        puppyDetails.addSubview(instantiatedView.view)
        instantiatedView.didMove(toParentViewController: self)
        
        let segue = UIStoryboardSegue.init(identifier: "puppyDetails", source: self, destination: instantiatedView)
        prepare(for: segue, sender: nil)
        
        toggleFavorite.titleLabel?.text =
            toggleFavorite.titleLabel?.text ==
            "Show My Favorite Puppy"
            ? "Continue Rating Puppies"
            : "Show My Favorite Puppy"
    }

}

// MARK: - Puppy Data Delegate
extension MainViewController: PuppyDataDelegate {
    func getCurrentPuppy() -> PuppyObject {
        return model.currentPuppy
    }
    
    func getFavoritePuppy() -> PuppyObject? {
        return model.favoritePuppy
    }
}

protocol PuppyViewProtocol: class {
    func updatePuppy(with puppy: PuppyObject)
}
