
import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var viewColor: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    @IBAction func changeRedColor() {
        redSlider.maximumValue = 1.0
        redSlider.minimumValue = 0.0
        redSlider.minimumTrackTintColor = .red
        let redColor = CGFloat(redSlider.value)
        let greenColor = CGFloat(greenSlider.value)
        let blueColor = CGFloat(blueSlider.value)
        viewColor.backgroundColor = UIColor.init(red: redColor,
                                                 green: greenColor,
                                                 blue: blueColor,
                                                 alpha: 1.0)
        
    }
    @IBAction func changeGreenColor() {
        greenSlider.minimumValue = 0.0
        greenSlider.maximumValue = 1.0
        greenSlider.minimumTrackTintColor = .green
        let greenColor = CGFloat(greenSlider.value)
        let redColor = CGFloat(redSlider.value)
        let blueColor = CGFloat(blueSlider.value)
        viewColor.backgroundColor = UIColor.init(red: redColor,
                                                 green: greenColor,
                                                 blue: blueColor,
                                                 alpha: 1.0)
        
        
    }
    @IBAction func changeBlueColor() {
        blueSlider.minimumValue = 0.0
        blueSlider.maximumValue = 1.0
        blueSlider.minimumTrackTintColor = .blue
        let blueColor = CGFloat(blueSlider.value)
        let redColor = CGFloat(redSlider.value)
        let greenColor = CGFloat(greenSlider.value)
        viewColor.backgroundColor = UIColor.init(red: redColor,
                                                 green: greenColor,
                                                 blue: blueColor,
                                                 alpha: 1.0)
    }
    
}
