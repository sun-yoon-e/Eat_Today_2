//
//  FoodViewController.swift
//  Eat_Today
//
//  Created by KPUGAME on 2021/05/22.
//

import UIKit

class FoodViewController: UITableViewController, XMLParserDelegate {
    
    @IBOutlet var tbData: UITableView!

    var parser1 = XMLParser()
    var parser2 = XMLParser()
    var parser3 = XMLParser()
    var parser4 = XMLParser()
    var parser5 = XMLParser()
    
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    
    var SIGUN_NM = NSMutableString()    // 시군명
    var SIGUN_CD = NSMutableString()    // 시군코드
    var BIZPLC_NM = NSMutableString()   // 업소명
    var SANITTN_BIZCOND_NM = NSMutableString()  // 카테고리명
    var REFINE_LOTNO_ADDR = NSMutableString()  // 지번주소
    var REFINE_ROADNM_ADDR = NSMutableString() // 도로명주소
    var REFINE_WGS84_LOGT = NSMutableString()        // 경도
    var REFINE_WGS84_LAT = NSMutableString()         // 위도
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beginParsing()
    }
    
    func beginParsing() {
        posts = []
        
        // 1. 탕류
        parser1 = XMLParser(contentsOf: (URL(string: "openapi.gg.go.kr/Genrestrtsoup?KEY=edba1fe215b8421f964a4c3d2b6606f7"))!)!
        parser1.delegate = self
        parser1.parse()
        
        // 2. 중식
        parser2 = XMLParser(contentsOf: (URL(string: "openapi.gg.go.kr/Genrestrtchifood?KEY=cf374f022f87475d99fed3f72d463ed6"))!)!
        parser2.delegate = self
        parser2.parse()
        
        // 3. 일식
        parser3 = XMLParser(contentsOf: (URL(string: "openapi.gg.go.kr/Genrestrtjpnfood?KEY=4248c63bb9484a22a5a07c9e89d93ab1"))!)!
        parser3.delegate = self
        parser3.parse()
        
        // 4. 패스트푸드
        parser4 = XMLParser(contentsOf: (URL(string: "openapi.gg.go.kr/Genrestrtfastfood?KEY=c65c95bb072f483da7d397123ffa187b"))!)!
        parser4.delegate = self
        parser4.parse()
        
        // 5. 카페
        parser5 = XMLParser(contentsOf: (URL(string: "openapi.gg.go.kr/Genrestrtcate?KEY=bfd03ce340c740e09b599ad146790ee2"))!)!
        parser5.delegate = self
        parser5.parse()
        
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
            BIZPLC_NM = NSMutableString()
            BIZPLC_NM = ""
            SANITTN_BIZCOND_NM = NSMutableString()
            SANITTN_BIZCOND_NM = ""
            REFINE_LOTNO_ADDR = NSMutableString()
            REFINE_LOTNO_ADDR = ""
            REFINE_ROADNM_ADDR = NSMutableString()
            REFINE_ROADNM_ADDR = ""
            REFINE_WGS84_LOGT = NSMutableString()
            REFINE_WGS84_LOGT = ""
            REFINE_WGS84_LAT = NSMutableString()
            REFINE_WGS84_LAT = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if element.isEqual(to: "SIGUN_NM") {
            SIGUN_NM.append(string)
        } else if element.isEqual(to: "SIGUN_CD"){
            SIGUN_CD.append(string)
        } else if element.isEqual(to: "BIZPLC_NM"){
            BIZPLC_NM.append(string)
        } else if element.isEqual(to: "SANITTN_BIZCOND_NM"){
            SANITTN_BIZCOND_NM.append(string)
        } else if element.isEqual(to: "REFINE_LOTNO_ADDR"){
            REFINE_LOTNO_ADDR.append(string)
        } else if element.isEqual(to: "REFINE_ROADNM_ADDR"){
            REFINE_ROADNM_ADDR.append(string)
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
            if !BIZPLC_NM.isEqual(nil) {
                elements.setObject(BIZPLC_NM, forKey: "BIZPLC_NM" as NSCopying)
            }
            if !SANITTN_BIZCOND_NM.isEqual(nil) {
                elements.setObject(SANITTN_BIZCOND_NM, forKey: "SANITTN_BIZCOND_NM" as NSCopying)
            }
            if !REFINE_LOTNO_ADDR.isEqual(nil) {
                elements.setObject(REFINE_LOTNO_ADDR, forKey: "REFINE_LOTNO_ADDR" as NSCopying)
            }
            if !REFINE_ROADNM_ADDR.isEqual(nil) {
                elements.setObject(REFINE_ROADNM_ADDR, forKey: "REFINE_ROADNM_ADDR" as NSCopying)
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
        
        cell.textLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "BIZPLC_NM") as! NSString as String
        //cell.detailTextLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "BIZCOND_NM") as! NSString as String
        return cell
    }
}

