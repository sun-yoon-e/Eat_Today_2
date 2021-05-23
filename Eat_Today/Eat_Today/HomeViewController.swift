//
//  HomeViewController.swift
//  Eat_Today
//

import UIKit

class HomeViewController: UIViewController {
    
    var sgguCd : String = "41820"
    // ~&psize=1000&SIGUN_NM(CD)="~"
    
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
    }
}
