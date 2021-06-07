import UIKit

class Search_TableViewController: UITableViewController, XMLParserDelegate {
    @IBOutlet var tbData: UITableView!
    //@IBOutlet var searchFooter: SearchFooter!
    
    var bg:Color = color
    var famous_api: String = "https://openapi.gg.go.kr/PlaceThatDoATasteyFoodSt?KEY=6d16cb57bdba4dadb6aa6394acf4116a&pSize=1000&SIGUN_CD="
    
    var sgguCd: [String] = ["41820", "41280", "41290", "41210", "41610", "41310", "41410", "41570", "41360", "41250", "41190", "41130", "41110", "41390", "41270","41550", "41170", "41630", "41830", "41670", "41800", "41370", "41460", "41430", "41150", "41500", "41480", "41220", "41650", "41450", "41590"]

    var parser = XMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    
    // 공통
    var SIGUN_NM = NSMutableString()            // 시군명
    var SIGUN_CD = NSMutableString()            // 시군코드
    var REFINE_LOTNO_ADDR = NSMutableString()   // 지번주소
    var REFINE_ROADNM_ADDR = NSMutableString()  // 도로명주소
    var REFINE_ZIP_CD = NSMutableString()       // 우편번호
    var REFINE_WGS84_LOGT = NSMutableString()   // 경도
    var REFINE_WGS84_LAT = NSMutableString()    // 위도
    
    // Tasty 전용
    var RESTRT_NM = NSMutableString()           // 업소명
    var REPRSNT_FOOD_NM = NSMutableString()     // 대표음식
    var TASTFDPLC_TELNO = NSMutableString()     // 대표전화
    
    var filtered = [Famous]()
    var famouses = [Famous]()
    let searchController = UISearchController(searchResultsController: nil)
    
    func searchBarIsEmpty() -> Bool{
          return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String){
        filtered = famouses.filter({(famous: Famous) -> Bool in

            return famous.RESTRT_NM.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    func isFiltering() -> Bool{
        //return searchController.isActive && !searchBarIsEmpty()
        let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
        return searchController.isActive && (!searchBarIsEmpty() || searchBarScopeIsFiltering)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor(colorStruct: bg)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beginParsing()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "식당 검색"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        //searchController.searchBar.scopeButtonTitles = ["All", "Chocolate", "Hard", "Other"]
        searchController.searchBar.delegate = self
        //tableView.tableFooterView = searchFooter
        
        self.view.backgroundColor = UIColor(colorStruct:bg)
    }
    
    override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
    }
    
    var url: String?
    func beginParsing() {
        posts = []
        for i in 0..<sgguCd.count{
            url = famous_api + sgguCd[i]
            parser = XMLParser(contentsOf: (URL(string: url!))!)!
            parser.delegate = self
            parser.parse()
            tbData!.reloadData()
        }
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        element = elementName as NSString
        if (elementName as NSString).isEqual(to: "row"){
            elements = NSMutableDictionary()
            elements = [:]
            SIGUN_NM = NSMutableString()
            SIGUN_NM = ""
            SIGUN_CD = NSMutableString()
            SIGUN_CD = ""
            RESTRT_NM = NSMutableString()
            RESTRT_NM = ""
            REPRSNT_FOOD_NM = NSMutableString()
            REPRSNT_FOOD_NM = ""
            TASTFDPLC_TELNO = NSMutableString()
            TASTFDPLC_TELNO = ""
            REFINE_LOTNO_ADDR = NSMutableString()
            REFINE_LOTNO_ADDR = ""
            REFINE_ROADNM_ADDR = NSMutableString()
            REFINE_ROADNM_ADDR = ""
            REFINE_ZIP_CD = NSMutableString()
            REFINE_ZIP_CD = ""
            REFINE_WGS84_LOGT = NSMutableString()
            REFINE_WGS84_LOGT = ""
            REFINE_WGS84_LAT = NSMutableString()
            REFINE_WGS84_LAT = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if element.isEqual(to: "SIGUN_NM") {
            SIGUN_NM.append(string)
        } else if element.isEqual(to: "SIGUN_CD") {
            SIGUN_CD.append(string)
        } else if element.isEqual(to: "RESTRT_NM") {
            RESTRT_NM.append(string)
        } else if element.isEqual(to: "REPRSNT_FOOD_NM"){
            REPRSNT_FOOD_NM.append(string)
        } else if element.isEqual(to: "TASTFDPLC_TELNO"){
            TASTFDPLC_TELNO.append(string)
        } else if element.isEqual(to: "REFINE_LOTNO_ADDR"){
            REFINE_LOTNO_ADDR.append(string)
        } else if element.isEqual(to: "REFINE_ROADNM_ADDR"){
            REFINE_ROADNM_ADDR.append(string)
        } else if element.isEqual(to: "REFINE_ZIP_CD") {
            REFINE_ZIP_CD.append(string)
        } else if element.isEqual(to: "REFINE_WGS84_LOGT"){
            REFINE_WGS84_LOGT.append(string)
        } else if element.isEqual(to: "REFINE_WGS84_LAT"){
            REFINE_WGS84_LAT.append(string)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if (elementName as NSString).isEqual(to: "row") {
            if !SIGUN_NM.isEqual(nil) {
                elements.setObject(SIGUN_NM, forKey: "SIGUN_NM" as NSCopying)
            }
            if !SIGUN_CD.isEqual(nil) {
                elements.setObject(SIGUN_CD, forKey: "SIGUN_CD" as NSCopying)
            }
            if !RESTRT_NM.isEqual(nil) {
                elements.setObject(RESTRT_NM, forKey: "RESTRT_NM" as NSCopying)
            }
            if !REPRSNT_FOOD_NM.isEqual(nil) {
                elements.setObject(REPRSNT_FOOD_NM, forKey: "REPRSNT_FOOD_NM" as NSCopying)
            }
            if !TASTFDPLC_TELNO.isEqual(nil) {
                elements.setObject(TASTFDPLC_TELNO, forKey: "TASTFDPLC_TELNO" as NSCopying)
            }
            if !REFINE_LOTNO_ADDR.isEqual(nil) {
                elements.setObject(REFINE_LOTNO_ADDR, forKey: "REFINE_LOTNO_ADDR" as NSCopying)
            }
            if !REFINE_ROADNM_ADDR.isEqual(nil) {
                elements.setObject(REFINE_ROADNM_ADDR, forKey: "REFINE_ROADNM_ADDR" as NSCopying)
            }
            if !REFINE_ZIP_CD.isEqual(nil) {
                elements.setObject(REFINE_ZIP_CD, forKey: "REFINE_ZIP_CD" as NSCopying)
            }
            if !REFINE_WGS84_LOGT.isEqual(nil) {
                elements.setObject(REFINE_WGS84_LOGT, forKey: "REFINE_WGS84_LOGT" as NSCopying)
            }
            if !REFINE_WGS84_LAT.isEqual(nil) {
                elements.setObject(REFINE_WGS84_LAT, forKey: "REFINE_WGS84_LAT" as NSCopying)
            }
            posts.add(elements)
            
            let famous = Famous(SIGUN_NM: SIGUN_NM as String, SIGUN_CD: SIGUN_CD as String, RESTRT_NM: RESTRT_NM as String, REFINE_LOTNO_ADDR: REFINE_LOTNO_ADDR as String, REFINE_ROADNM_ADDR: REFINE_ROADNM_ADDR as String, REFINE_ZIP_CD: REFINE_ZIP_CD as String, REFINE_WGS84_LOGT: REFINE_WGS84_LOGT as String, REFINE_WGS84_LAT: REFINE_WGS84_LAT as String, REPRSNT_FOOD_NM: REPRSNT_FOOD_NM as String, TASTFDPLC_TELNO: TASTFDPLC_TELNO as String)

            famouses.append(famous)
        }
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToDetail"{
            if let cell = sender as? UITableViewCell{
                let indexPath = tableView.indexPath(for: cell)
                RESTRT_NM = (posts.object(at: (indexPath?.row)!) as AnyObject).value(forKey: "RESTRT_NM") as! NSMutableString
                REPRSNT_FOOD_NM = (posts.object(at: (indexPath?.row)!) as AnyObject).value(forKey: "REPRSNT_FOOD_NM") as! NSMutableString
                TASTFDPLC_TELNO = (posts.object(at: (indexPath?.row)!) as AnyObject).value(forKey: "TASTFDPLC_TELNO") as! NSMutableString
                REFINE_ROADNM_ADDR = (posts.object(at: (indexPath?.row)!) as AnyObject).value(forKey: "REFINE_ROADNM_ADDR") as! NSMutableString
                REFINE_LOTNO_ADDR = (posts.object(at: (indexPath?.row)!) as AnyObject).value(forKey: "REFINE_LOTNO_ADDR") as! NSMutableString
                REFINE_ZIP_CD = (posts.object(at: (indexPath?.row)!) as AnyObject).value(forKey: "REFINE_ZIP_CD") as! NSMutableString
                
                if let famousDetailViewController = segue.destination as? Famous_DetailTableViewController{
                    famousDetailViewController.restNm = RESTRT_NM
                }
                if let famousDetailViewController = segue.destination as? Famous_DetailTableViewController{
                    famousDetailViewController.bestMn = REPRSNT_FOOD_NM
                }
                if let famousDetailViewController = segue.destination as? Famous_DetailTableViewController{
                    famousDetailViewController.calling = TASTFDPLC_TELNO
                }
                if let famousDetailViewController = segue.destination as? Famous_DetailTableViewController{
                    famousDetailViewController.lotAddr = REFINE_LOTNO_ADDR
                }
                if let famousDetailViewController = segue.destination as? Famous_DetailTableViewController{
                    famousDetailViewController.roadAddr = REFINE_ROADNM_ADDR
                }
                if let famousDetailViewController = segue.destination as? Famous_DetailTableViewController{
                    famousDetailViewController.zipCd = REFINE_ZIP_CD
                }
                if let famousDetailViewController = segue.destination as? Famous_DetailTableViewController{
                    famousDetailViewController.REFINE_WGS84_LOGT = REFINE_WGS84_LOGT
                }
                if let famousDetailViewController = segue.destination as? Famous_DetailTableViewController{
                    famousDetailViewController.REFINE_WGS84_LAT = REFINE_WGS84_LAT
                }
                
                if let famousDetailViewController = segue.destination as? Famous_DetailTableViewController{
                    famousDetailViewController.posts = posts
                }
            }
        }
    }
 */
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering(){
            //searchFooter.setIsFilteringToShow(filteredItemCount: filtered.count, of: famouses.count)
            return filtered.count
        }
        //searchFooter.setNotFiltering()
        return famouses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
      
        let famous: Famous
        if isFiltering(){
            famous = filtered[indexPath.row]
        }
        else{
            famous = famouses[indexPath.row]
        }
        cell.textLabel!.text = famous.RESTRT_NM
        cell.detailTextLabel!.text = famous.REFINE_ROADNM_ADDR
        cell.backgroundColor = UIColor(colorStruct:bg)
        return cell
        }
}

extension Search_TableViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController){
        //let searchBar = searchController.searchBar
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

extension Search_TableViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int){
        filterContentForSearchText(searchBar.text!)
    }
}
