//
//  Picture.swift
//  ParseInstagram
//
//  Created by Cory Thompson on 3/4/16.
//  Copyright © 2016 Cory Thompson. All rights reserved.
//

import UIKit
import Parse

class Picture: NSObject {
    /**
     Method to upload photo to Parse server
     
     - parameter image: The image to be uploaded
     - parameter caption: The caption to accompany the image
     - parameter completion: The block to execute on completion of attempting to submit the photo
     */
    class func postUserImage(image: UIImage?, withCaption caption: NSString?, withCompletion completion: PFBooleanResultBlock?) {
        
        let post = PFObject(className: "Post")
        post["media"] = getPFFileFromImage(image)
        post["author"] = PFUser.currentUser()
        post["caption"] =  caption
        
        post.saveInBackgroundWithBlock(completion)
    }
    
    private class func getPFFileFromImage(image: UIImage?) -> PFFile? {
        if let image = image {
            if let imageData = UIImagePNGRepresentation(resize(image, newSize: CGSize(width: 640, height: 640))) {
                return PFFile(name: "image.png", data: imageData)
            }
        }
        
        return nil
    }
    
    private class func resize(image: UIImage, newSize: CGSize) -> UIImage {
        let resizeImageView = UIImageView(frame: CGRectMake(0, 0, newSize.width, newSize.height))
        resizeImageView.contentMode = UIViewContentMode.ScaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}