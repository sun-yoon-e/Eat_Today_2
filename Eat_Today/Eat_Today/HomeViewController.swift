//
//  HomeViewController.swift
//  Eat_Today
//

import UIKit

class HomeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBAction func pressedKorea(_ sender: Any) {
    }
    @IBAction func pressedCafe(_ sender: Any) {
    }
    @IBAction func pressedItaly(_ sender: Any) {
    }
    @IBAction func pressedChina(_ sender: Any) {
    }
    @IBAction func pressedJapan(_ sender: Any) {
    }
    @IBAction func pressedFamous(_ sender: Any) {
    }
    
    var pickerDataSource = ["가평군", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "양평군", "여주시", "연천군", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시"]
    var sgguCd : String = "41820"
    // ~&psize=1000&SIGUN_NM(CD)="~"
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    //pickerView의 row 선택 시 sgguCd를 변경
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 0 {
            sgguCd = "41820"    //가평군
        }
        else if row == 1 {
            sgguCd = "41280"    //고양시
        }
        else if row == 2 {
            sgguCd = "41290"    //과천시
        }
        else if row == 3 {
            sgguCd = ""         //광명시
        }
        else if row == 4 {
            sgguCd = "41610"    //광주시
        }
        else if row == 5 {
            sgguCd = ""         //구리시
        }
        else if row == 6 {
            sgguCd = "41410"    //군포시
        }
        else if row == 7 {
            sgguCd = "41570"    //김포시
        }
        else if row == 8 {
            sgguCd = "41360"    //남양주시
        }
        else if row == 9 {
            sgguCd = ""         //동두천시
        }
        else if row == 10 {
            sgguCd = "41190"    //부천시
        }
        else if row == 11 {
            sgguCd = ""         //성남시
        }
        else if row == 12 {
            sgguCd = ""         //수원시
        }
        else if row == 13 {
            sgguCd = "41390"    //시흥시
        }
        else if row == 14 {
            sgguCd = ""         //안산시
        }
        else if row == 15 {
            sgguCd = ""         //안성시
        }
        else if row == 16 {
            sgguCd = "41170"    //안양시
        }
        else if row == 17 {
            sgguCd = ""         //양주시
        }
        else if row == 18 {
            sgguCd = ""         //양평군
        }
        else if row == 19 {
            sgguCd = ""         //여주시
        }
        else if row == 20 {
            sgguCd = "41800"    //연천군
        }
        else if row == 21 {
            sgguCd = ""         //오산시
        }
        else if row == 22 {
            sgguCd = "41460"    //용인시
        }
        else if row == 23 {
            sgguCd = ""         //의왕시
        }
        else if row == 24 {
            sgguCd = "41460"    //의정부시
        }
        else if row == 25 {
            sgguCd = "41500"    //이천시
        }
        else if row == 26 {
            sgguCd = "41480"    //파주시
        }
        else if row == 27 {
            sgguCd = "41220"    //평택시
        }
        else if row == 28 {
            sgguCd = ""         //포천시
        }
        else if row == 29 {
            sgguCd = "41450"    //하남시
        }
        else {
            sgguCd = "41590"    //화성시
        }
    }
    
    @IBAction func cancelToHome(segue: UIStoryboardSegue){
        
    }
    @IBAction func saveToCity(segue: UIStoryboardSegue){
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToPickerView" {
            if let navController = segue.destination as? UINavigationController {
                if let korea = navController.topViewController as? Korea_TableViewController {
                    korea.url = korea.url + sgguCd
                }
                if let cafe = navController.topViewController as? Cafe_TableViewController {
                    cafe.url = cafe.url + sgguCd
                }
                if let italy = navController.topViewController as? Italy_TableViewController {
                    italy.url = italy.url + sgguCd
                }
                if let china = navController.topViewController as? China_TableViewController {
                    china.url = china.url + sgguCd
                }
                if let japan = navController.topViewController as? Japan_TableViewController {
                    japan.url = japan.url + sgguCd
                }
                if let famous = navController.topViewController as? Famous_TableViewController {
                    famous.url = famous.url + sgguCd
                }
            }
        }
        if segue.identifier == "segueToMapView" {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView?.delegate = self;
        self.pickerView?.dataSource = self;
    }
}
