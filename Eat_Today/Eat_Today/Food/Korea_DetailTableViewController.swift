import UIKit

class Korea_DetailTableViewController: UITableViewController, XMLParserDelegate {
    @IBOutlet var detailTableView: UITableView!

    var bg:Color = color
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
    var REFINE_WGS84_LOGT = NSMutableString()
    var REFINE_WGS84_LAT = NSMutableString()
 
    func Fill(){
        category = ["", "", "", ""]
        
        category[0] = restNm as String
        category[1] = roadAddr as String
        category[2] = lotAddr as String
        category[3] = zipCd as String
    }
    
    @IBOutlet weak var heartButton: UIBarButtonItem!        //UIImage(systemName: "heart.fill")
    
    @IBAction func cancelFromHeartToDetail(segue: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToMapView" {
            if let mapViewController = segue.destination as? Korea_MapViewController {
                mapViewController.posts = posts
            }
            if let mapViewController = segue.destination as? Korea_MapViewController {
                mapViewController.restNm = restNm
            }
        }
        if segue.identifier == "segueToHeartView" {
            if let heartViewController = segue.destination as? Korea_HeartTableViewController {
                heartViewController.restName = restNm
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
        cell.backgroundColor = UIColor(colorStruct:bg)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Fill()
        detailTableView!.reloadData()
        
        self.view.backgroundColor = UIColor(colorStruct: bg)
    }
}
