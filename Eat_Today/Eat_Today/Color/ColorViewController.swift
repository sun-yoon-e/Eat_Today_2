var color = Color()

import UIKit

class ColorViewController: UIViewController {
    @IBOutlet weak var changeLabel: UILabel!
  
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
  
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    var rgb = RGB()
    var bg:Color = color
  
    @IBAction func aSliderMoved(sender: UISlider) {
        switch sender {
        case redSlider:
            rgb.r = Int(sender.value)
            redLabel.text = "R \(rgb.r)"
        case greenSlider:
            rgb.g = Int(sender.value)
            greenLabel.text = "G \(rgb.g)"
        case blueSlider:
            rgb.b = Int(sender.value)
            blueLabel.text = "B \(rgb.b)"
        default: break
        }
        changeLabel.backgroundColor = UIColor(rgbStruct: rgb)
    }
    
    @IBAction func pressedSave(_ sender: Any) {
        let alert = UIAlertController(title: title, message: "배경색이 변경되었습니다.", preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .cancel)
        
        let explore = ExplodeView(frame: CGRect(x: self.view.center.x - 60, y: self.view.center.y + 200, width: 120, height: 60))
        changeLabel.superview?.addSubview(explore)
        changeLabel.superview?.sendSubviewToBack(explore)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)

        self.view.backgroundColor = UIColor(rgbStruct: rgb)
        updateColor()

    }
    func updateColor() {
        color.r = rgb.r
        color.g = rgb.g
        color.b = rgb.b
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeLabel.backgroundColor = UIColor(rgbStruct: RGB(r: 255, g: 255, b: 255))
        
        redLabel.text = "R \(rgb.r)"
        greenLabel.text = "G \(rgb.g)"
        blueLabel.text = "B \(rgb.b)"
    
        redSlider.value = Float(rgb.r)
        greenSlider.value = Float(rgb.g)
        blueSlider.value = Float(rgb.b)
        
        self.view.backgroundColor = UIColor(colorStruct: bg)
    }
}
