//
//  MasterViewController.swift
//  settingTest
//
//  Created by Saul on 12/11/14.
//  Copyright (c) 2014 Saul. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var settingsData = [settingsDataArray]()
    var sectionsData = [settingsSections]()
    var numberData = [numberOfRows]()
    let imageName = "blurred.png"

    @IBOutlet var tableView1: UITableView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
               
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)

        self.tableView1.backgroundView = imageView
        self.tableView1.separatorInset = UIEdgeInsetsZero

        
        // Do any additional setup after loading the view, typically from a nib.
        //self.navigationItem.leftBarButtonItem = self.editButtonItem()
        self.settingsData = [settingsDataArray(name: "Jolly Rancher"), settingsDataArray(name: "Snickers"),settingsDataArray(name: "Twix"),settingsDataArray(name: "Milky Way")]
        
        self.sectionsData = [settingsSections(name: "PROFILE"),settingsSections(name: "USER INFO"),settingsSections(name: "ABOUT") ]
        self.numberData = [numberOfRows(number: 2), numberOfRows(number: 2), numberOfRows(number:3)]
        
        //let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        //self.navigationItem.rightBarButtonItem = addButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        self.tableView1.reloadData()
    }
  

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let settings = settingsData[indexPath.row]
            (segue.destinationViewController as DetailViewController).detailItem = settings.name
            }
        }
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        

        
        if (tableView.respondsToSelector(Selector("setSeparatorInset:"))) {
            tableView.separatorInset = UIEdgeInsetsZero
        }
    
        if (tableView.respondsToSelector(Selector("setLayoutMargins:"))) {
            tableView.layoutMargins = UIEdgeInsetsZero
        }
        
        if (cell.respondsToSelector(Selector("setLayoutMargins:"))) {
            cell.layoutMargins=UIEdgeInsetsZero
        }
    }
    
    // MARK: - Table View
 
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView = UIView (frame: CGRectMake(0, 0, self.tableView.bounds.size.width, 0.01))
        var headerLabel = UIBorderLabel (frame: CGRectMake(6, 0, 100, 50))
        headerView.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.50)
        headerLabel.topInset = 0
        headerLabel.leftInset = 10
        headerLabel.textColor = UIColor.blackColor()
        headerLabel.font = UIFont(name: "Montserrat", size: 13)
        headerLabel.text = sectionsData[section].name
        headerView.addSubview(headerLabel)
        
        return headerView
    }

    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 55
    }
    
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return sectionsData[section].name
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.sectionsData.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.numberData[section].number
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        var settings : settingsDataArray

        settings = settingsData[indexPath.row]
        cell.separatorInset = UIEdgeInsetsZero
        cell.textLabel!.text = settings.name
        cell.textLabel!.textColor = UIColor.whiteColor()
        cell.backgroundColor = UIColor.darkGrayColor().colorWithAlphaComponent(0.70)
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }


}

