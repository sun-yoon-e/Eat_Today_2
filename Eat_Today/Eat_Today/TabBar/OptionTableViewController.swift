//
//  OptionTableViewController.swift
//  Eat_Today
//
//  Created by KPUGAME on 2021/06/05.
//

import UIKit

class OptionTableViewController: UITableViewController {
    @IBOutlet var soundSwitch : UISwitch!
    
    var audioController: AudioController
    required init?(coder aDecoder: NSCoder) {
        audioController = AudioController()
        audioController.preloadAudioBg(audioFileNames: AudioFiles)
        
        super.init(coder: aDecoder)
    }
    
    var bg:Color = color
    var c = HeartTableViewController()
    static var sound: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(colorStruct: bg)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor(colorStruct: bg)
    }
    
    @IBAction func pressedTrash(_ sender: Any) {
        let alert = UIAlertController(title: title, message: "찜 목록을 초기화하시겠습니까?", preferredStyle: .alert)
        let action2 = UIAlertAction(title: "취소", style: .destructive)
        let action = UIAlertAction(title: "확인", style: .default, handler: { action in
            self.c.hearts.removeAll()
            self.c.tableView.reloadData()
        })
        alert.addAction(action)
        alert.addAction(action2)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func switchDidChange(_ sender: UISwitch){
        if sender.isOn{
            OptionTableViewController.sound = true
        }
        else{
            OptionTableViewController.sound = false
        }
        audioController.playerBg(name: BgSound)
    }
}
