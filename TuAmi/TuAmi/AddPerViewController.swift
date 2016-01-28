

import UIKit

class AddPerViewController: UIViewController {
    @IBOutlet weak var tastTitle: UITextField! = UITextField()
    
    @IBOutlet weak var taskDetails: UITextView! = UITextView()
    
    @IBOutlet weak var button: UIBarButtonItem!
 
    var nombrearray2 = String()

    override func viewDidLoad() {
        //self.navigationItem.rightBarButtonItem = nil
        super.viewDidLoad()
        
        if((tastTitle.text) != nil) {
          self.navigationItem.rightBarButtonItem?.accessibilityActivate()
        }
       
        // Do any additional setup after loading the view.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
    }
    
    
    func keyboardWillShow(sender: NSNotification) {
        //self.view.frame.origin.y -= 190
    }
    
    func keyboardWillHide(sender: NSNotification) {
        //self.view.frame.origin.y = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func saveButtonClick(sender: AnyObject) {
    
        
        let userdefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults();
        
        var itemList:NSMutableArray? = userdefaults.objectForKey(nombrearray2) as?NSMutableArray
        
        if (tastTitle.text == ""){
            let alertController = UIAlertController(title: "¡Aviso!", message:
                "Introduce el nombre del participante", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Vale", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        } else {
        
        let dataSet:NSMutableDictionary = NSMutableDictionary()
        dataSet.setObject(tastTitle.text!, forKey: "nombre")
        dataSet.setObject(taskDetails.text!, forKey: "preferencias")
        
        if((itemList) != nil){
            
            let newMutableList: NSMutableArray = NSMutableArray()
            
            for dict:AnyObject in itemList!{
                newMutableList.addObject(dict as! NSDictionary)
            }
            
            userdefaults.removeObjectForKey(nombrearray2)
            newMutableList.addObject(dataSet)
            userdefaults.setObject(newMutableList, forKey: nombrearray2)
            
        }else{
           
            itemList=NSMutableArray()
            itemList!.addObject(dataSet)
            userdefaults.setObject(itemList, forKey: nombrearray2)
            
        }
        
        userdefaults.synchronize()
        self.navigationController?.popViewControllerAnimated(true)
    }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        tastTitle.resignFirstResponder()
        taskDetails.resignFirstResponder()
    }
    
    

    
}
