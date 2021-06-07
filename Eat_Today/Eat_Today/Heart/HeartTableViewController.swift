import UIKit

class HeartTableViewController: UITableViewController {
    
    var bg:Color = color
    var hearts: [Heart] = []
    
    @IBAction func saveFromStarToHeart(segue: UIStoryboardSegue) {
        if let korea_HeartTableViewController = segue.source as? Korea_HeartTableViewController {
            if let heart = korea_HeartTableViewController.heart {
                hearts.append(heart)
                
                let indexPath = IndexPath(row: hearts.count-1, section: 0)
                tableView.insertRows(at: [indexPath], with: .automatic)
                
                categoryCount[0] += 1
            }
        }
        if let cafe_HeartTableViewController = segue.source as? Cafe_HeartTableViewController {
            if let heart = cafe_HeartTableViewController.heart {
                hearts.append(heart)
                
                let indexPath = IndexPath(row: hearts.count-1, section: 0)
                tableView.insertRows(at: [indexPath], with: .automatic)
                
                categoryCount[1] += 1
            }
        }
        if let italy_HeartTableViewController = segue.source as? Italy_HeartTableViewController {
            if let heart = italy_HeartTableViewController.heart {
                hearts.append(heart)
                
                let indexPath = IndexPath(row: hearts.count-1, section: 0)
                tableView.insertRows(at: [indexPath], with: .automatic)

                categoryCount[2] += 1
            }
        }
        if let china_HeartTableViewController = segue.source as? China_HeartTableViewController {
            if let heart = china_HeartTableViewController.heart {
                hearts.append(heart)
                
                let indexPath = IndexPath(row: hearts.count-1, section: 0)
                tableView.insertRows(at: [indexPath], with: .automatic)
                
                categoryCount[3] += 1
            }
        }
        if let japan_HeartTableViewController = segue.source as? Japan_HeartTableViewController {
            if let heart = japan_HeartTableViewController.heart {
                hearts.append(heart)
                
                let indexPath = IndexPath(row: hearts.count-1, section: 0)
                tableView.insertRows(at: [indexPath], with: .automatic)
                
                categoryCount[4] += 1
            }
        }
        if let famous_HeartTableViewController = segue.source as? Famous_HeartTableViewController {
            if let heart = famous_HeartTableViewController.heart {
                hearts.append(heart)
                
                let indexPath = IndexPath(row: hearts.count-1, section: 0)
                tableView.insertRows(at: [indexPath], with: .automatic)
                
                categoryCount[5] += 1
            }
        }
    }

    func imageForRating(rating: Int) -> UIImage? {
        let imageName = "\(rating)Stars"
        return UIImage(named: imageName)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(colorStruct: bg)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor(colorStruct: bg)
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hearts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Heart", for: indexPath)
        cell.backgroundColor = UIColor(colorStruct: bg)
        let heart = hearts[indexPath.row] as Heart
        
        if let nameLabel = cell.viewWithTag(100) as? UILabel {
            nameLabel.text = heart.name
        }
        if let reviewLabel = cell.viewWithTag(101) as? UILabel {
            reviewLabel.text = heart.review
        }
        if let imageView = cell.viewWithTag(102) as? UIImageView {
            imageView.image = self.imageForRating(rating: heart.rating)
        }
        
        return cell
    }
    
    @IBAction func pressedTrash(_ sender: Any) {
        clearView()
    }
    
    func clearView() {
        let alert = UIAlertController(title: title, message: "찜 목록을 초기화 하시겠어요?", preferredStyle: .alert)
        let action2 = UIAlertAction(title: "No!", style: .destructive)
        let action = UIAlertAction(title: "Yes!", style: .default, handler: { action in
            self.hearts.removeAll()
            self.tableView.reloadData()
        })
        alert.addAction(action)
        alert.addAction(action2)
        present(alert, animated: true, completion: nil)
    }
}
