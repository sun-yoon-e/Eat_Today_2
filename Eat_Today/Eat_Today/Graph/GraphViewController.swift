import UIKit

var categoryCount = [0, 0, 0, 0, 0, 0]

class GraphViewController: UIViewController {

    @IBOutlet weak var allView: UIView!
    @IBOutlet weak var countText: UILabel!
    @IBOutlet weak var countHeart: UILabel!
    @IBOutlet weak var Graph: TutorialChartView!
    @IBOutlet weak var Heart: UIView!
    @IBOutlet weak var Category: UIView!
    
    var bg:Color = color
    var isShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(colorStruct:bg)

        var sum = 0
        for i in categoryCount {
           sum += i
        }
        countText.text = "총 \(sum)개의 음식점을"
        countHeart.text = "\(sum)"
        
        Graph.setData(categoryCount)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor(colorStruct:bg)
        
        var sum = 0
        for i in categoryCount {
           sum += i
        }
        countText.text = "총 \(sum)개의 음식점을"
        countHeart.text = "\(sum)"
        
        Graph.setData(categoryCount)
    }
    
    @IBAction func GraphViewTap(_ gesture: UITapGestureRecognizer?) {
        if (isShowing) {    //hide
            UIView.transition(from: Category, to: Heart, duration: 1.0,
                          options: [.transitionFlipFromLeft, .showHideTransitionViews], completion:nil)
        } else {    //show
            UIView.transition(from: Heart, to: Category, duration: 1.0,
                          options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
      }
      isShowing = !isShowing
    }
}


