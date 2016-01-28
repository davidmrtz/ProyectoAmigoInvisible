

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
    var toDoItems:NSMutableArray = NSMutableArray()
    var numbers:[Int] = []
    var array:[Int] = []
    var n :Int = 0
    var todoData:NSDictionary = NSDictionary()
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        titleTextField.userInteractionEnabled=false
        descriptionTextField.userInteractionEnabled=false
        
        titleTextField.text=todoData.objectForKey("nombre") as? String
        
        
        descriptionTextField.text=todoData.objectForKey("importemaximo") as? String
        
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteButtonClicked(sender: AnyObject) {
        
        
        
        let userDefault:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let itemListArray:NSMutableArray = userDefault.objectForKey("ListaGrupos") as! NSMutableArray
        
        let mutableItemList: NSMutableArray = NSMutableArray()
        
        for dict:AnyObject in itemListArray{
            mutableItemList.addObject(dict as! NSDictionary)
        }
        
        mutableItemList.removeObject(todoData)
        userDefault.removeObjectForKey("ListaGrupos")
        userDefault.setObject(mutableItemList, forKey:"ListaGrupos")
        userDefault.synchronize()
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidAppear(animated: Bool) {
        let userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let toDoItemList:NSMutableArray? = userDefaults.objectForKey(nombreArray) as? NSMutableArray
        
        if (toDoItemList != nil) {
            toDoItems=toDoItemList!
        }
    }
    
    @IBAction func bottonSorteo(sender: AnyObject) {
        
        for i in 0...toDoItems.count - 1
        {
            array.append(i)
            
        }
        for i in 0...toDoItems.count - 1 {
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
            
        }while(numbers[n-1] == array[n-1])
        
        print(array)
        print(numbers)
        
    }
}

