

import UIKit

class ChangeColorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var setColorButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? ViewController else {return}
        let color = view.backgroundColor
        viewController.startColor = color
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        guard let viewController = unwindSegue.source
                as? ViewController else {return}
        view.backgroundColor = viewController.viewColor.backgroundColor
    }

}
