import UIKit

class ViewCountReportViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var puppyData: PuppyData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewCountReportViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return puppyData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "viewReportCell") else { return UITableViewCell() }
        cell.textLabel?.numberOfLines = 2
        
        let puppyName = puppyData?.allPuppies.element(at: indexPath.row)?.name ?? "Unable to get puppyName"
        let puppyViewCount = puppyData?.allPuppies.element(at: indexPath.row)?.viewCount ?? 0
        
        cell.textLabel?.text = "Puppy: \(puppyName ) \n Views: \(puppyViewCount)"
        
        return cell
    }
}

extension ViewCountReportViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        puppyData?.setShowFlashcardFalse(of: indexPath.row)
    }
}
