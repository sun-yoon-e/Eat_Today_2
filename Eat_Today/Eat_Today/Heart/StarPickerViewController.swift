import UIKit

class StarPickerViewController: UITableViewController {
    
    var stars: [Int] = [ 1, 2, 3, 4, 5 ]
    var rating: Int = 1
    
    func imageForRating(rating: Int) -> UIImage? {
        let imageName = "\(rating)Stars"
        return UIImage(named: imageName)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "SaveSelectedStar" {
            if let cell = sender as? UITableViewCell {
                let indexPath = tableView.indexPath(for: cell)
                if let index = indexPath?.row {
                    rating = stars[index]
                }
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stars.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StarCell", for: indexPath)
        
        if let ratingImageView = cell.viewWithTag(100) as? UIImageView {
            ratingImageView.image = self.imageForRating(rating: indexPath.row + 1)
        }
        
        if indexPath.row == (rating - 1) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cell = tableView.cellForRow(at: IndexPath(row: rating - 1, section: 0) as IndexPath)
        cell?.accessoryType = .none
        
        rating = stars[indexPath.row]
        
        let cell2 = tableView.cellForRow(at: indexPath)
        cell2?.accessoryType = .checkmark
    }
}
