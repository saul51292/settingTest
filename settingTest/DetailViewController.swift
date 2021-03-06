//
//  DetailViewController.swift
//  settingTest
//
//  Created by Saul on 12/11/14.
//  Copyright (c) 2014 Saul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet var backImage: UIImageView!


    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: AnyObject = self.detailItem {
            if let label = self.detailDescriptionLabel {
                if detail.description == "Jolly Rancher"
                {
                    self.title = detail.description
                    NSBundle.mainBundle().loadNibNamed("InformationVC", owner: self, options: nil)
                }
                else if detail.description == "Snickers"
                {
                    self.title = detail.description
                   // self.navigationController?.setNavigationBarHidden(true, animated: true)
                    NSBundle.mainBundle().loadNibNamed("TermsVC", owner: self, options: nil)
                }
  
                
                else
                    
                {
                    self.title = detail.description
                    label.text = detail.description
                }
                
            }
           
        }
    }
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

