//
//  CameraViewController.swift
//  ParseInstagram
//
//  Created by Cory Thompson on 3/2/16.
//  Copyright © 2016 Cory Thompson. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var captionTextField: UITextField!
    @IBOutlet weak var pickAgainButton: UIButton!
    @IBOutlet weak var posterImageView: UIImageView!
    var hasLibraryBeenViewed: Bool!
    override func viewDidLoad() {
        super.viewDidLoad()
        hasLibraryBeenViewed = false
        print(tabBarController?.selectedIndex)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        if !hasLibraryBeenViewed {
            hasLibraryBeenViewed = true
            let vc = UIImagePickerController()
            vc.delegate = self
            vc.allowsEditing = true
            vc.sourceType = .PhotoLibrary
            self.presentViewController(vc, animated: true, completion: nil)
        }
        
        if let _ = posterImageView.image {
            pickAgainButton.enabled = true
            pickAgainButton.hidden = false
            submitButton.enabled = true
            submitButton.hidden = false
            captionTextField.hidden = false
        } else {
            pickAgainButton.enabled = false
            pickAgainButton.hidden = true
            submitButton.enabled = false
            submitButton.hidden = true
            captionTextField.hidden = true
        }
        
    }
    
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            // Get the image captured by the UIImagePickerController
            let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage

            // Do something with the images (based on your use case)
            posterImageView.image = editedImage
            // Dismiss UIImagePickerController to go back to your original view controller
            dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onPickAgainButton(sender: AnyObject) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = .PhotoLibrary
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    @IBAction func onSubmitButton(sender: AnyObject) {
        Picture.postUserImage(posterImageView.image, withCaption: captionTextField.text) { (success: Bool, error: NSError?) -> Void in
            if success {
                print("posted!")
                self.captionTextField.text = ""
                self.tabBarController?.selectedIndex = 0
            } else {
                print(error?.localizedDescription)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
