import UIKit

class Famous_TableViewController: UITableViewController, XMLParserDelegate {

    @IBOutlet var tbData: UITableView!
    
    var bg:Color = color
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

    override func viewDidLoad() {
        super.viewDidLoad()
        beginParsing()
        
        self.view.backgroundColor = UIColor(colorStruct: bg)
    }
    
    var url: String?
    func beginParsing() {
        posts = []
        parser = XMLParser(contentsOf: (URL(string: url!))!)!
        parser.delegate = self
        parser.parse()
        tbData!.reloadData()
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
        }
    }
    
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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        cell.textLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "RESTRT_NM") as! NSString as String
        cell.detailTextLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "REFINE_ROADNM_ADDR") as! NSString as String
        cell.backgroundColor = UIColor(colorStruct:bg)
        return cell
    }
}
