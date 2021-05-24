import UIKit

class China_HeartTableViewController: UITableViewController {
    
    var heart: Heart?
    
    var rating: Int = 1 {
        didSet {
            ratingImageView.image? = imageForRating(rating: rating)!
        }
    }
    
    @IBOutlet weak var restNm: UILabel!
    @IBOutlet weak var reviewTextField: UITextField!
    @IBOutlet weak var ratingImageView: UIImageView!
    
    func imageForRating(rating: Int) -> UIImage? {
        let imageName = "\(rating)Stars"
        return UIImage(named: imageName)
    }
    
    @IBAction func unwindWithSelectedStar(segue: UIStoryboardSegue) {
        if let starPickerViewController = segue.source as? StarPickerViewController {
            rating = starPickerViewController.rating
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PickStar" {
            if let starPickerViewController = segue.destination as? StarPickerViewController {
                starPickerViewController.rating = rating
            }
        }
        if segue.identifier == "SavePlayerDetail" {
            heart = Heart(review: reviewTextField.text!, rating: rating)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        print("init China_HeartTableViewController")
        super.init(coder: aDecoder)
    }
    deinit {
        print("deinit China_HeartTableViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ratingImageView.image = imageForRating(rating: rating)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            reviewTextField.becomeFirstResponder()
        }
    }
}
