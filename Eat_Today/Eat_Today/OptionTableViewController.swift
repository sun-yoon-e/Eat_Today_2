//
//  OptionTableViewController.swift
//  Eat_Today
//
//  Created by KPUGAME on 2021/06/05.
//

import UIKit

class OptionTableViewController: UITableViewController {

    var bg:Color = color
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor(colorStruct: bg)
    }
}
