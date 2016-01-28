

import UIKit


class PersonaTableViewController:
    
UITableViewController {
    
    var nombreArray = String()
    var toDoItems:NSMutableArray = NSMutableArray()
    
    
    override func viewDidAppear(animated: Bool) {
        let userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let toDoItemList:NSMutableArray? = userDefaults.objectForKey(nombreArray) as? NSMutableArray
        
        if (toDoItemList != nil) {
            toDoItems=toDoItemList!
        }
        self.tableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return toDoItems.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CellidPer", forIndexPath: indexPath) as UITableViewCell
        
        
        let todoItem :NSDictionary = toDoItems.objectAtIndex(indexPath.row) as! NSDictionary
        
        
        
        cell.textLabel?.text = todoItem.objectForKey("nombre") as? String
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if(segue.identifier == "showDetails"){
            let indexPath:NSIndexPath = self.tableView.indexPathForSelectedRow!
            let detailPerViewController:DetailsPerViewController = segue.destinationViewController as! DetailsPerViewController
            
            detailPerViewController.todoData = toDoItems.objectAtIndex(indexPath.row) as! NSDictionary
            
            let DestViewControllertres: DetailsPerViewController = segue.destinationViewController as!
            DetailsPerViewController
            DestViewControllertres.nombrearray3 = nombreArray
            
        }
            
            
            
        else if(segue.identifier == "SorteoDetails"){
            
            
            
            let indexPath:NSIndexPath = self.tableView.indexPathForSelectedRow!
            let detailPerViewController:PartSortViewController = segue.destinationViewController as! PartSortViewController
            
            detailPerViewController.todoData = toDoItems.objectAtIndex(indexPath.row) as! NSDictionary
            
            
        }
            
        else if(segue.identifier == "addTasKDetails"){
            let DestViewControllerdos: AddPerViewController = segue.destinationViewController as!
            AddPerViewController
            DestViewControllerdos.nombrearray2 = nombreArray
            
        }
    }
}
