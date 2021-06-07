import UIKit
import Charts

var categoryCount = [0, 0, 0, 0, 0, 0]

class GraphViewController: UIViewController {

    @IBOutlet weak var allView: UIView!
    @IBOutlet weak var countText: UILabel!
    @IBOutlet weak var countHeart: UILabel!
    @IBOutlet weak var Heart: UIView!
    @IBOutlet weak var Category: UIView!
    @IBOutlet var barChartView: BarChartView!
    
    var bg:Color = color
    var isShowing = false
    
    var numbers = ["0","1","2","3","4","5"]
    var graph: [Int]!
    var category = ["한식", "카페", "중식", "일식", "양식", "맛집"]

    func setChart(dataPoints: [String], values: [Int]) {
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(values[i]))
            dataEntries.append(dataEntry)
        }

        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "찜 개수")
        chartDataSet.colors = [.systemPink]
        
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartView.data = chartData
        
        chartDataSet.highlightEnabled = false
        barChartView.doubleTapToZoomEnabled = false
        barChartView.xAxis.labelPosition = .bottom
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: category)
        barChartView.xAxis.setLabelCount(dataPoints.count, force: false)
        barChartView.leftAxis.valueFormatter = IndexAxisValueFormatter(values: numbers)
        barChartView.leftAxis.setLabelCount(numbers.count, force: false)
        barChartView.rightAxis.enabled = false
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        barChartView.leftAxis.axisMaximum = 6
        barChartView.leftAxis.axisMinimum = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(colorStruct:bg)

        var sum = 0
        for i in categoryCount {
           sum += i
        }
        countText.text = "총 \(sum)개의 음식점을"
        countHeart.text = "\(sum)"
        
        graph = categoryCount
        setChart(dataPoints: category, values: categoryCount)
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
        
        graph = categoryCount
        setChart(dataPoints: category, values: categoryCount)
    }
    
    @IBAction func GraphViewTap(_ gesture: UITapGestureRecognizer?) {
        if (!isShowing) {    //hide
            UIView.transition(from: Category, to: Heart, duration: 1.0,
                          options: [.transitionFlipFromLeft, .showHideTransitionViews], completion:nil)
        } else {            //show
            UIView.transition(from: Heart, to: Category, duration: 1.0,
                          options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
      }
      isShowing = !isShowing
    }
}


