

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
        
        
        
        let alert=UIAlertController(title: "¡Aviso!", message: "¿Borrar este participante?", preferredStyle: UIAlertControllerStyle.Alert);
        
        
        alert.addAction(UIAlertAction(title: "Sí", style: UIAlertActionStyle.Default, handler: {(action:UIAlertAction) in
            
            let userDefault:NSUserDefaults = NSUserDefaults.standardUserDefaults()
            let itemListArray:NSMutableArray = userDefault.objectForKey(self.nombrearray3) as! NSMutableArray
            
            let mutableItemList: NSMutableArray = NSMutableArray()
            
            for dict:AnyObject in itemListArray{
                mutableItemList.addObject(dict as! NSDictionary)
            }
            
            mutableItemList.removeObject(self.todoData)
            userDefault.removeObjectForKey(self.nombrearray3)
            userDefault.setObject(mutableItemList, forKey: self.nombrearray3)
            userDefault.synchronize()
            
            self.navigationController?.popViewControllerAnimated(true)
            
        }));
        //no event handler (just close dialog box)
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.Cancel, handler: nil));
        //event handler with closure
        
        presentViewController(alert, animated: true, completion: nil);
        
        
        

    }
    
  
    
}
