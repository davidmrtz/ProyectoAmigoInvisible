

import UIKit

class DetailsPerViewController: UIViewController {
    
    
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
    
    @IBAction func deleteButtonClicked(sender: AnyObject) {
        
        
        
        let userDefault:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let itemListArray:NSMutableArray = userDefault.objectForKey(nombrearray3) as! NSMutableArray
        
        let mutableItemList: NSMutableArray = NSMutableArray()
        
        for dict:AnyObject in itemListArray{
            mutableItemList.addObject(dict as! NSDictionary)
        }
        
        mutableItemList.removeObject(todoData)
        userDefault.removeObjectForKey(nombrearray3)
        userDefault.setObject(mutableItemList, forKey: nombrearray3)
        userDefault.synchronize()
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
  
    
}
