//
//  TastyViewController.swift
//  Eat_Today
//

import UIKit

class TastyViewController: UITableViewController, XMLParserDelegate {

    var parser6 = XMLParser()
    
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    
    var SIGUN_NM = NSMutableString()        // 시군명
    var RESTRT_NM = NSMutableString()       // 업소명
    var REPRSNT_FOOD_NM = NSMutableString() // 대표음식
    var TASTFDPLC_TELNO = NSMutableString() // 대표전화
    var LOTNO_ADDR = NSMutableString()      // 지번주소
    var ROADNM_ADDR = NSMutableString()     // 도로명주소
    var LOGT = NSMutableString()            // 경도
    var LAT = NSMutableString()             // 위도
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beginParsing()
    }
    
    func beginParsing() {
        posts = []
        
        // 6. 맛집
        parser6 = XMLParser(contentsOf: (URL(string: "openapi.gg.go.kr/PlaceThatDoATasteyFoodSt?KEY=6d16cb57bdba4dadb6aa6394acf4116a"))!)!
        parser6.delegate = self
        parser6.parse()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        element = elementName as NSString
        if (elementName as NSString).isEqual(to: "row"){
            elements = NSMutableDictionary()
            elements = [:]
            SIGUN_NM = NSMutableString()
            SIGUN_NM = ""
            RESTRT_NM = NSMutableString()
            RESTRT_NM = ""
            REPRSNT_FOOD_NM = NSMutableString()
            REPRSNT_FOOD_NM = ""
            TASTFDPLC_TELNO = NSMutableString()
            TASTFDPLC_TELNO = ""
            LOTNO_ADDR = NSMutableString()
            LOTNO_ADDR = ""
            ROADNM_ADDR = NSMutableString()
            ROADNM_ADDR = ""
            LOGT = NSMutableString()
            LOGT = ""
            LAT = NSMutableString()
            LAT = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if element.isEqual(to: "SIGUN_NM") {
            SIGUN_NM.append(string)
        } else if element.isEqual(to: "RESTRT_NM"){
            RESTRT_NM.append(string)
        } else if element.isEqual(to: "REPRSNT_FOOD_NM"){
            REPRSNT_FOOD_NM.append(string)
        } else if element.isEqual(to: "TASTFDPLC_TELNO"){
            TASTFDPLC_TELNO.append(string)
        } else if element.isEqual(to: "REFINE_LOTNO_ADDR"){
            LOTNO_ADDR.append(string)
        } else if element.isEqual(to: "REFINE_ROADNM_ADDR"){
            ROADNM_ADDR.append(string)
        } else if element.isEqual(to: "REFINE_WGS84_LOGT"){
            LOGT.append(string)
        } else if element.isEqual(to: "REFINE_WGS84_LAT"){
            LAT.append(string)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if (elementName as NSString).isEqual(to: "row") {
            if !SIGUN_NM.isEqual(nil) {
                elements.setObject(SIGUN_NM, forKey: "SIGUN_NM" as NSCopying)
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
            if !LOTNO_ADDR.isEqual(nil) {
                elements.setObject(LOTNO_ADDR, forKey: "REFINE_LOTNO_ADDR" as NSCopying)
            }
            if !ROADNM_ADDR.isEqual(nil) {
                elements.setObject(ROADNM_ADDR, forKey: "REFINE_ROADNM_ADDR" as NSCopying)
            }
            if !LOGT.isEqual(nil) {
                elements.setObject(LOGT, forKey: "REFINE_WGS84_LOGT" as NSCopying)
            }
            if !LAT.isEqual(nil) {
                elements.setObject(LAT, forKey: "REFINE_WGS84_LAT" as NSCopying)
            }
            
            posts.add(elements)
        }
    }

}
