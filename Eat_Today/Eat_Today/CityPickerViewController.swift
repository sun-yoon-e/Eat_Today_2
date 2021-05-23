import UIKit

class CityPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    var sgguCd: String = "41820"
    var sgguNm: String = "가평군"
    var pickerDataSource = ["가평군", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "양평군", "여주시", "연천군", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시"]
    
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
            sgguNm = "가평군"
        }
        else if row == 1 {
            sgguCd = "41280"    //고양시
            sgguNm = "고양시"
        }
        else if row == 2 {
            sgguCd = "41290"    //과천시
            sgguNm = "과천시"
        }
        else if row == 3 {
            sgguCd = "41210"    //광명시
            sgguNm = "광명시"
        }
        else if row == 4 {
            sgguCd = "41610"    //광주시
            sgguNm = "광주시"
        }
        else if row == 5 {
            sgguCd = "41310"    //구리시
            sgguNm = "구리시"
        }
        else if row == 6 {
            sgguCd = "41410"    //군포시
            sgguNm = "군포시"
        }
        else if row == 7 {
            sgguCd = "41570"    //김포시
            sgguNm = "김포시"
        }
        else if row == 8 {
            sgguCd = "41360"    //남양주시
            sgguNm = "남양주시"
        }
        else if row == 9 {
            sgguCd = "41250"    //동두천시
            sgguNm = "동두천시"
        }
        else if row == 10 {
            sgguCd = "41190"    //부천시
            sgguNm = "부천시"
        }
        else if row == 11 {
            sgguCd = "41130"    //성남시
            sgguNm = "성남시"
        }
        else if row == 12 {
            sgguCd = "41110"    //수원시
            sgguNm = "수원시"
        }
        else if row == 13 {
            sgguCd = "41390"    //시흥시
            sgguNm = "시흥시"
        }
        else if row == 14 {
            sgguCd = "41270"    //안산시
            sgguNm = "안산시"
        }
        else if row == 15 {
            sgguCd = "41550"    //안성시
            sgguNm = "안성시"
        }
        else if row == 16 {
            sgguCd = "41170"    //안양시
            sgguNm = "안양시"
        }
        else if row == 17 {
            sgguCd = "41630"    //양주시
            sgguNm = "양주시"
        }
        else if row == 18 {
            sgguCd = "41830"    //양평군
            sgguNm = "양평군"
        }
        else if row == 19 {
            sgguCd = "41670"    //여주시
            sgguNm = "여주시"
        }
        else if row == 20 {
            sgguCd = "41800"    //연천군
            sgguNm = "연천군"
        }
        else if row == 21 {
            sgguCd = "41370"    //오산시
            sgguNm = "오산시"
        }
        else if row == 22 {
            sgguCd = "41460"    //용인시
            sgguNm = "용인시"
        }
        else if row == 23 {
            sgguCd = "41430"    //의왕시
            sgguNm = "의왕시"
        }
        else if row == 24 {
            sgguCd = "41150"    //의정부시
            sgguNm = "의정부시"
        }
        else if row == 25 {
            sgguCd = "41500"    //이천시
            sgguNm = "이천시"
        }
        else if row == 26 {
            sgguCd = "41480"    //파주시
            sgguNm = "파주시"
        }
        else if row == 27 {
            sgguCd = "41220"    //평택시
            sgguNm = "평택시"
        }
        else if row == 28 {
            sgguCd = "41650"    //포천시
            sgguNm = "포천시"
        }
        else if row == 29 {
            sgguCd = "41450"    //하남시
            sgguNm = "하남시"
        }
        else {
            sgguCd = "41590"    //화성시
            sgguNm = "화성시"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickerView?.delegate = self;
        self.pickerView?.dataSource = self;
    }
}
