import UIKit

class HeartTableViewController: UITableViewController {
    
    var hearts: [Heart] = []
    
    @IBAction func saveFromStarToHeart(segue: UIStoryboardSegue) {
        if let korea_HeartTableViewController = segue.source as? Korea_HeartTableViewController {
            if let heart = korea_HeartTableViewController.heart {
                hearts.append(heart)
                
                let indexPath = IndexPath(row: hearts.count-1, section: 0)
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
        }
        if let cafe_HeartTableViewController = segue.source as? Cafe_HeartTableViewController {
            if let heart = cafe_HeartTableViewController.heart {
                hearts.append(heart)
                
                let indexPath = IndexPath(row: hearts.count-1, section: 0)
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
        }
        if let italy_HeartTableViewController = segue.source as? Italy_HeartTableViewController {
            if let heart = italy_HeartTableViewController.heart {
                hearts.append(heart)
                
                let indexPath = IndexPath(row: hearts.count-1, section: 0)
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
        }
        if let china_HeartTableViewController = segue.source as? China_HeartTableViewController {
            if let heart = china_HeartTableViewController.heart {
                hearts.append(heart)
                
                let indexPath = IndexPath(row: hearts.count-1, section: 0)
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
        }
        if let japan_HeartTableViewController = segue.source as? Japan_HeartTableViewController {
            if let heart = japan_HeartTableViewController.heart {
                hearts.append(heart)
                
                let indexPath = IndexPath(row: hearts.count-1, section: 0)
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
        }
        if let famous_HeartTableViewController = segue.source as? Famous_HeartTableViewController {
            if let heart = famous_HeartTableViewController.heart {
                hearts.append(heart)
                
                let indexPath = IndexPath(row: hearts.count-1, section: 0)
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
        }
    }

    func imageForRating(rating: Int) -> UIImage? {
        let imageName = "\(rating)Stars"
        return UIImage(named: imageName)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hearts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Heart", for: indexPath)
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
}
