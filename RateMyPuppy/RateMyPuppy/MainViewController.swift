import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var puppyDetails: ContainerView!
    @IBOutlet weak var toggleFavorite: UIButton!
    
    let model: RateMyPuppyModel = RateMyPuppyModel()
    var puppyViewController: PuppyViewController!
    var puppyDetailViewController: PuppyDetailViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        puppyDetails.delegate = self
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        puppyViewController = (storyboard.instantiateViewController(withIdentifier: "puppyView") as? PuppyViewController)!
        
        puppyViewController.delegate = self
        puppyDetails.activeViewController = puppyViewController
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewCountReport = segue.destination as? ViewCountReportViewController {
            viewCountReport.puppyData = model.puppyData
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

    @IBAction func displayNextPuppy(_ sender: Any) {
        guard let puppyView = self.childViewControllers.last as? PuppyViewController else {
            print("unable to display next puppy")
            return
        }
        
        puppyView.updatePuppy(with: model.nextPuppy)
        model.incrementViewCount()
    }
    
    @IBAction func displayPuppyDetails(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        switch self.childViewControllers.last {
            
        case _ as PuppyViewController:
            guard let puppyDetailViewController = storyboard.instantiateViewController(withIdentifier: "puppyDetailView") as? PuppyDetailViewController else {
                print("Unable to instantiate PuppyDetailViewController")
                return
            }
            
            puppyDetailViewController.delegate = self
            puppyDetails.activeViewController = puppyDetailViewController
            
        case _ as PuppyDetailViewController:
            puppyViewController.delegate = self
            puppyDetails.activeViewController = puppyViewController
            
        default:
            print("current view is unknown; unable to toggle")
            return
        }
    }
    
    @IBAction func toggleFavorite(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        switch self.childViewControllers.last {
            
        case _ as PuppyViewController:
            guard let favoriteViewController = storyboard.instantiateViewController(withIdentifier: "favView") as? FavoriteViewController else {
                print("Unable to instantiate FavoriteViewController")
                return
            }
            
            favoriteViewController.delegate = self
            puppyDetails.activeViewController = favoriteViewController
            
        case _ as FavoriteViewController:
            puppyViewController.delegate = self
            puppyDetails.activeViewController = puppyViewController
            
        default:
            print("current view is unknown; unable to toggle")
            return
        }
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

// MARK: - Container View Delegate
extension MainViewController: ContainerViewDelegate {
    func addChildToParent(with child: UIViewController) {
        addChildViewController(child)
    }
    
    func notifyDidMoveToParent(with child: UIViewController) {
        child.didMove(toParentViewController: self)
    }
    
}
