import UIKit

class HomeViewController: UIViewController {
    
    var bg:Color = color
    var sgguCd: String = "41820"
    var sgguNm: String = "가평군"
    
    // ~&psize=1000&SIGUN_NM(CD)="~"
    var korea_api: String = "https://openapi.gg.go.kr/Genrestrtsoup?KEY=edba1fe215b8421f964a4c3d2b6606f7&psize=1000&SIGUN_CD="
    var cafe_api: String = "https://openapi.gg.go.kr/Genrestrtcate?KEY=bfd03ce340c740e09b599ad146790ee2&psize=1000&SIGUN_CD="
    var italy_api: String = "https://openapi.gg.go.kr/Genrestrtfastfood?KEY=c65c95bb072f483da7d397123ffa187b&pSize=1000&SIGUN_CD="
    var china_api: String = "https://openapi.gg.go.kr/Genrestrtchifood?KEY=cf374f022f87475d99fed3f72d463ed6&pSize=1000&SIGUN_CD="
    var japan_api: String = "https://openapi.gg.go.kr/Genrestrtjpnfood?KEY=4248c63bb9484a22a5a07c9e89d93ab1&pSize=1000&SIGUN_CD="
    var famous_api: String = "https://openapi.gg.go.kr/PlaceThatDoATasteyFoodSt?KEY=6d16cb57bdba4dadb6aa6394acf4116a&pSize=1000&SIGUN_CD="
    
    @IBOutlet weak var CityLabel: UILabel!
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToKorea" {
            if let navController = segue.destination as? UINavigationController {
                if let korea = navController.topViewController as? Korea_TableViewController {
                    korea.url = korea_api + sgguCd
                }
            }
        }
        if segue.identifier == "segueToCafe" {
            if let navController = segue.destination as? UINavigationController {
                if let cafe = navController.topViewController as? Cafe_TableViewController {
                    cafe.url = cafe_api + sgguCd
                }
            }
        }
        if segue.identifier == "segueToItaly" {
            if let navController = segue.destination as? UINavigationController {
                if let italy = navController.topViewController as? Italy_TableViewController {
                    italy.url = italy_api + sgguCd
                }
            }
        }
        if segue.identifier == "segueToChina" {
            if let navController = segue.destination as? UINavigationController {
                if let china = navController.topViewController as? China_TableViewController {
                    china.url = china_api + sgguCd
                }
            }
        }
        if segue.identifier == "segueToJapan" {
            if let navController = segue.destination as? UINavigationController {
                if let japan = navController.topViewController as? Japan_TableViewController {
                    japan.url = japan_api + sgguCd
                }
            }
        }
        if segue.identifier == "segueToFamous" {
            if let navController = segue.destination as? UINavigationController {
                if let famous = navController.topViewController as? Famous_TableViewController {
                    famous.url = famous_api + sgguCd
                }
            }
        }
        if segue.identifier == "segueToMapView" {

        }
    }
    
    @IBAction func saveFromPickerToHome(segue: UIStoryboardSegue) {
        if let cityPickerViewController = segue.source as? CityPickerViewController {
            let selectedCd = cityPickerViewController.sgguCd
            let selectedNm = cityPickerViewController.sgguNm
            sgguCd = selectedCd
            sgguNm = selectedNm
            CityLabel.text = sgguNm
        }
    }
    @IBAction func cancelFromPickerToHome(segue: UIStoryboardSegue){
    }
    @IBAction func doneFromKoreaToHome(segue: UIStoryboardSegue) {
    }
    @IBAction func doneFromCafeToHome(segue: UIStoryboardSegue) {
    }
    @IBAction func doneFromItalyToHome(segue: UIStoryboardSegue) {
    }
    @IBAction func doneFromChinaToHome(segue: UIStoryboardSegue) {
    }
    @IBAction func doneFromJapanToHome(segue: UIStoryboardSegue) {
    }
    @IBAction func doneFromFamousToHome(segue: UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(colorStruct: bg)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor(colorStruct: bg)
    }
}
