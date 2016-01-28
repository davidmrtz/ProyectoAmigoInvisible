

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var tastTitle: UITextField! = UITextField()
    
    
    @IBOutlet weak var taskDetails: UITextView! = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonClick(sender: AnyObject) {
       
        
        let userdefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults();
        
        var itemList:NSMutableArray? = userdefaults.objectForKey("ListaGrupos") as?NSMutableArray
        
            
            if(tastTitle.text == "" && taskDetails.text==""){
                let alertController = UIAlertController(title: "¡Aviso!", message:
                    "Introduce los datos", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Vale", style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
            } else if(tastTitle.text==""){
                let alertController = UIAlertController(title: "¡Aviso!", message:
                    "Introduce el nombre del grupo", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Vale", style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
            } else if(taskDetails.text == "0" || taskDetails.text == ""){
                if(taskDetails.text == "0"){
                let alertController = UIAlertController(title: "¡Aviso!", message:
                    "Debe ser un valor mayor que 0", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Vale", style: UIAlertActionStyle.Default,handler: nil))
                
                    self.presentViewController(alertController, animated: true, completion: nil)
                } else if (taskDetails.text == ""){
                        let alertController = UIAlertController(title: "¡Aviso!", message:
                            "Introduce el gasto máximo", preferredStyle: UIAlertControllerStyle.Alert)
                        alertController.addAction(UIAlertAction(title: "Vale", style: UIAlertActionStyle.Default,handler: nil))
                        
                        self.presentViewController(alertController, animated: true, completion: nil)
            }
            }else{
                let dataSet:NSMutableDictionary = NSMutableDictionary()
                dataSet.setObject(tastTitle.text!, forKey: "nombre")
                dataSet.setObject(taskDetails.text!, forKey: "importemaximo")
                
                if((itemList) != nil){
                    
                    let newMutableList: NSMutableArray = NSMutableArray()
                    
                    for dict:AnyObject in itemList!{
                        newMutableList.addObject(dict as! NSDictionary)
                    }
                    
                    userdefaults.removeObjectForKey("ListaGrupos")
                    newMutableList.addObject(dataSet)
                    userdefaults.setObject(newMutableList, forKey: "ListaGrupos")
                    
                }else{
                    
                    itemList=NSMutableArray()
                    itemList!.addObject(dataSet)
                    userdefaults.setObject(itemList, forKey: "ListaGrupos")
                    
                }
                
                userdefaults.synchronize()
                self.navigationController?.popViewControllerAnimated(true)
            }

    
    
    }
    
}
