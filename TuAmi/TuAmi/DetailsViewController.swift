

import UIKit

extension CollectionType {
    /// Return a copy of `self` with its elements shuffled
    func shuffle() -> [Generator.Element] {
        var list = Array(self)
        list.shuffleInPlace()
        return list
    }
}

extension MutableCollectionType where Index == Int {
    /// Shuffle the elements of `self` in-place.
    
    mutating func shuffleInPlace() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}


class DetailsViewController: UIViewController {
    
    var nombreArray = String()
    
    
    var n :Int = 0
    var todoData:NSDictionary = NSDictionary()
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        titleTextField.userInteractionEnabled=false
        descriptionTextField.userInteractionEnabled=true
        
        
        titleTextField.text=todoData.objectForKey("nombre") as? String

        descriptionTextField.text=todoData.objectForKey("importemaximo") as? String
       
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let DestViewController : PersonaTableViewController = segue.destinationViewController as! PersonaTableViewController
        DestViewController.nombreArray = titleTextField.text!
        }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteButtonClicked(sender: AnyObject) {
        
        
        let alert=UIAlertController(title: "¡Aviso!", message: "¿De verdad quieres borrar el grupo?", preferredStyle: UIAlertControllerStyle.Alert);
        //default input textField (no configuration...)
        
        alert.addAction(UIAlertAction(title: "Sí", style: UIAlertActionStyle.Default, handler: {(action:UIAlertAction) in
            
            let userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
            var toDoItemList:NSMutableArray? = userDefaults.objectForKey(self.titleTextField.text!) as? NSMutableArray
            toDoItemList=NSMutableArray()
            toDoItemList?.removeAllObjects()
            userDefaults.setObject(toDoItemList, forKey:self.titleTextField.text!)
            userDefaults.synchronize()
            
            let userDefault:NSUserDefaults = NSUserDefaults.standardUserDefaults()
            let itemListArray:NSMutableArray = userDefault.objectForKey("ListaGrupos") as! NSMutableArray
            
            let mutableItemList: NSMutableArray = NSMutableArray()
            
            for dict:AnyObject in itemListArray{
                mutableItemList.addObject(dict as! NSDictionary)
            }
            
            mutableItemList.removeObject(self.todoData)
            userDefault.removeObjectForKey("ListaGrupos")
            userDefault.setObject(mutableItemList, forKey:"ListaGrupos")
            userDefault.synchronize()
            
            self.navigationController?.popViewControllerAnimated(true)
            
        }));
        //no event handler (just close dialog box)
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.Cancel, handler: nil));
        //event handler with closure
        
        presentViewController(alert, animated: true, completion: nil);

        
        
    }

   

    @IBAction func bottonSorteo(sender: AnyObject) {
        
        var numbers:[Int] = []
        var array:[Int] = []
        
        let userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let toDoItemList:NSMutableArray? = userDefaults.objectForKey(titleTextField.text!) as? NSMutableArray

        
        let userDefaultsSorteo: NSUserDefaults = NSUserDefaults.standardUserDefaults()
      
        if (toDoItemList?.count < 3){
            let alertController = UIAlertController(title: "¡Aviso!", message:
                "Introduce como mínimo 3 participantes", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Vale", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else{
        
       for i in 0...toDoItemList!.count - 1
       {
            array.append(i)
          
        }
        for i in 0...toDoItemList!.count - 1 {
            numbers.append(i)
            
        }
        
        numbers.shuffleInPlace()
        repeat{
            while (n <= array.count - 1){
                
                if (numbers[n] == array[n]){
                    numbers.shuffleInPlace()
                    n = 0
                }else{ n = n + 1
                }
            }
            if (n == 0){
            n = 1
            }
        }while(numbers[n-1] == array[n-1])
        
        print(array)
        print(numbers)
        
        
        let newMutableList: NSMutableArray = NSMutableArray()
        
        for i in 0...numbers.count - 1 {
            newMutableList.addObject(toDoItemList![numbers[i]])
            userDefaultsSorteo.setObject(newMutableList, forKey: "Sorteo")
      
            }
            
        }
        
    }
    
    
    
    
    
}
