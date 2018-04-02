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
        let filteredPuppies = puppyData.allPuppies.filter{ $0.showInReport == true }
        return filteredPuppies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "viewReportCell") else { return UITableViewCell() }
        cell.textLabel?.numberOfLines = 3
        
        let filteredPuppies = puppyData.allPuppies.filter{ $0.showInReport == true }
        
        cell.textLabel?.text = "Puppy: \(filteredPuppies.element(at: indexPath.row)!.name ) \n Rating: \(filteredPuppies.element(at: indexPath.row)!.rating ) \n Views: \(String(describing: filteredPuppies.element(at: indexPath.row)!.viewCount ))"
        
        return cell
    }
}

extension ViewCountReportViewController: UITableViewDelegate {
    
}
