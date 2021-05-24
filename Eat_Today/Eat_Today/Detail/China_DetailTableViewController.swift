import UIKit

class China_DetailTableViewController: UITableViewController, XMLParserDelegate {
    @IBOutlet var detailTableView: UITableView!

    var url : String?
    var posts = NSMutableArray()
    
    var parser = XMLParser()
    let postname : [String] = ["식당 이름", "지번 주소", "도로명 주소", "우편번호"]
    var category : [String] = ["", "", "", ""]
    var element = NSString()
    var restNm = NSMutableString()
    var roadAddr = NSMutableString()
    var lotAddr = NSMutableString()
    var zipCd = NSMutableString()
    
    func Fill(){
        category = ["", "", "", ""]
        
        category[0] = restNm as String
        category[1] = lotAddr as String
        category[2] = roadAddr as String
        category[3] = zipCd as String
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToMapView" {
            if let mapViewController = segue.destination as? China_MapViewController {
                mapViewController.posts = posts
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodDetail", for: indexPath)
        cell.textLabel?.text = postname[indexPath.row]
        cell.detailTextLabel?.text = category[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Fill()
        detailTableView!.reloadData()
    }
}