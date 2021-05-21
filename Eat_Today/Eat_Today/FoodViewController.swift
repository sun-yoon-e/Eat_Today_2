//
//  FoodViewController.swift
//  Eat_Today
//
//  Created by KPUGAME on 2021/05/22.
//

import UIKit

class FoodViewController: UIViewController, XMLParserDelegate {

    var parser1 = XMLParser()
    var parser2 = XMLParser()
    var parser3 = XMLParser()
    var parser4 = XMLParser()
    var parser5 = XMLParser()
    
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    
    var SIGUN_NM = NSMutableString()    // 시군명
    var BIZPLC_NM = NSMutableString()   // 업소명
    var BIZCOND_NM = NSMutableString()  // 카테고리명
    var LOTNO_ADDR = NSMutableString()  // 지번주소
    var ROADNM_ADDR = NSMutableString() // 도로명주소
    var LOGT = NSMutableString()        // 경도
    var LAT = NSMutableString()         // 위도
    
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
        parser3 = XMLParser(contentsOf: (URL(string: "openapi.gg.go.kr/GenrestrtjpnFood?KEY=4248c63bb9484a22a5a07c9e89d93ab1"))!)!
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
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        element = elementName as NSString
        if (elementName as NSString).isEqual(to: "row"){
            elements = NSMutableDictionary()
            elements = [:]
            SIGUN_NM = NSMutableString()
            SIGUN_NM = ""
            BIZPLC_NM = NSMutableString()
            BIZPLC_NM = ""
            BIZCOND_NM = NSMutableString()
            BIZCOND_NM = ""
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
        } else if element.isEqual(to: "BIZPLC_NM"){
            BIZPLC_NM.append(string)
        } else if element.isEqual(to: "SANITTN_BIZCOND_NM"){
            BIZCOND_NM.append(string)
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
            if !BIZPLC_NM.isEqual(nil) {
                elements.setObject(BIZPLC_NM, forKey: "BIZPLC_NM" as NSCopying)
            }
            if !BIZCOND_NM.isEqual(nil) {
                elements.setObject(BIZCOND_NM, forKey: "SANITTN_BIZCOND_NM" as NSCopying)
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

