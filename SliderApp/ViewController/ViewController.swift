
import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var viewColor: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redValueTextField: UITextField!
    @IBOutlet weak var greenValueTextField: UITextField!
    @IBOutlet weak var blueValueTextField: UITextField!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    
    var startColor: UIColor!
    var textFieldValue: String!
    var newColorValue: Float!


    override func viewDidLoad() {
        super.viewDidLoad()
        redSlider.minimumTrackTintColor = .systemRed
        greenSlider.minimumTrackTintColor = .systemGreen
        blueSlider.minimumTrackTintColor = .systemBlue
        getFirstScreenColor()
        
    }
   
    @IBAction func changeRedColor() {
        redValueTextField.text = String(round(redSlider.value*100)/100)
        redValueLabel.text = String(round(redSlider.value*100)/100)
        changeColorView()
    }
    
    @IBAction func changeGreenColor() {
        greenValueTextField.text = String(round(greenSlider.value*100)/100)
        greenValueLabel.text = String(round(greenSlider.value*100)/100)
        changeColorView()
    }
    
    @IBAction func changeBlueColor() {
        blueValueTextField.text = String(round(blueSlider.value*100)/100)
        blueValueLabel.text = String(round(blueSlider.value*100)/100)
        changeColorView()
    }
    
    @IBAction func changeRedSliderValue() {
        textFieldDidEndEditing(redValueTextField)
        changeColorView()
    }
    
    @IBAction func changeGreenSliderValue() {
        textFieldDidEndEditing(greenValueTextField)
        changeColorView()
    }
    
    @IBAction func changeBlueSliderValue() {
        textFieldDidEndEditing(blueValueTextField)
        changeColorView()
    }

    private func changeColorView() {
        let blueColor = CGFloat(blueSlider.value)
        let redColor = CGFloat(redSlider.value)
        let greenColor = CGFloat(greenSlider.value)
        viewColor.backgroundColor = UIColor.init(red: redColor,
                                                 green: greenColor,
                                                 blue: blueColor,
                                                 alpha: 1.0)
    }
    
    private func getFirstScreenColor() {
        var red: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var green: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        
        viewColor.backgroundColor = startColor
        
        _ = startColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
        
        redValueLabel.text = String(round(redSlider.value*100)/100)
        redValueTextField.text = String(round(redSlider.value*100)/100)
        greenValueLabel.text = String(round(greenSlider.value*100)/100)
        greenValueTextField.text = String(round(greenSlider.value*100)/100)
        blueValueLabel.text = String(round(blueSlider.value*100)/100)
        blueValueTextField.text = String(round(blueSlider.value*100)/100)
    }
    
    private func alertMessage() {
        let alertMessage = UIAlertController.init(title: "Oops!",
                                                  message: "Provide some value in range from 0.0 to 1.0",
                                                  preferredStyle: .alert)
        let cancelAlert = UIAlertAction(title: "Ok", style: .cancel)
        alertMessage.addAction(cancelAlert)
        self.present(alertMessage, animated: true)
    }
    
}



extension ViewController: UITextFieldDelegate {
    
    internal func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let colorNewValue = Float(textField.text ?? "0.0") else {alertMessage(); return}
        
        if colorNewValue < 0.0 || colorNewValue > 1.0 {
            alertMessage()
        }
        
        if textField == redValueTextField {
            redSlider.value = colorNewValue
            redValueLabel.text = textField.text
            greenValueTextField.becomeFirstResponder()
        } else if  textField == greenValueTextField {
            greenSlider.value = colorNewValue
            greenValueLabel.text = textField.text
            blueValueTextField.becomeFirstResponder()
        } else if textField == blueValueTextField {
            blueSlider.value = colorNewValue
            blueValueLabel.text = textField.text
            blueValueTextField.resignFirstResponder()
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         super .touchesBegan(touches, with: event)
         view.endEditing(true)
     }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == redValueTextField {
            textFieldDidEndEditing(redValueTextField)
            greenValueTextField.returnKeyType = .done
            greenValueTextField.becomeFirstResponder()
        } else if  textField == greenValueTextField {
            textFieldDidEndEditing(greenValueTextField)
            blueValueTextField.returnKeyType = .done
            blueValueTextField.becomeFirstResponder()
        } else if textField == blueValueTextField {
            blueValueTextField.resignFirstResponder()
            textFieldDidEndEditing(blueValueTextField)
        }
        return true
    }
}
