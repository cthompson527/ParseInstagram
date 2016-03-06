//
//  LogoffViewController.swift
//  ParseInstagram
//
//  Created by Cory Thompson on 3/4/16.
//  Copyright © 2016 Cory Thompson. All rights reserved.
//

import UIKit
import Parse

class LogoffViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogoffButton(sender: AnyObject) {
        PFUser.logOutInBackgroundWithBlock { (error: NSError?) -> Void in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("logged out")
                self.performSegueWithIdentifier("logoffSegue", sender: nil)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
