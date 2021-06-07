//
//  OptionTableViewController.swift
//  Eat_Today
//
//  Created by KPUGAME on 2021/06/05.
//

import UIKit

class OptionTableViewController: UITableViewController {

    var bg:Color = color
    var c = HeartTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(colorStruct: bg)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor(colorStruct: bg)
    }
    
    @IBAction func pressedTrash(_ sender: Any) {
        let alert = UIAlertController(title: title, message: "찜 목록을 초기화 하시겠어요?", preferredStyle: .alert)
        let action2 = UIAlertAction(title: "No!", style: .destructive)
        let action = UIAlertAction(title: "Yes!", style: .default, handler: { action in
            self.c.hearts.removeAll()
            self.c.tableView.reloadData()
        })
        alert.addAction(action)
        alert.addAction(action2)
        present(alert, animated: true, completion: nil)
    }
}
