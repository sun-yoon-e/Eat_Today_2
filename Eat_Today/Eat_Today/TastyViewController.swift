//
//  TastyViewController.swift
//  Eat_Today
//

import UIKit

class TastyViewController: UIViewController, XMLParserDelegate {

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

}
