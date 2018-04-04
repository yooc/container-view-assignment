import UIKit

class ViewCountReportViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let puppyData = PuppyData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewCountReportViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return puppyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "viewReportCell") else { return UITableViewCell() }
        cell.textLabel?.numberOfLines = 3
        
        cell.textLabel?.text = "Puppy: \(puppyData.allPuppies.element(at: indexPath.row)!.name ) \n Views: \(String(describing: puppyData.allPuppies.element(at: indexPath.row)!.viewCount ))"
        
        return cell
    }
}

extension ViewCountReportViewController: UITableViewDelegate {
    
}
