import UIKit

class PartSortViewController: UIViewController {
    
    
    @IBOutlet weak var titleTextField: UITextField!
    
    var nombrearray3 = String()
    
    @IBOutlet weak var descriptionTextField: UITextView!
    var todoData:NSDictionary = NSDictionary()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.userInteractionEnabled=false
        descriptionTextField.userInteractionEnabled=false
        
        titleTextField.text=todoData.objectForKey("nombre") as? String
        
        
        descriptionTextField.text=todoData.objectForKey("preferencias") as? String
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

