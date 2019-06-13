//
//  ViewController.swift
//  urlLoading
//
//  Created by mac on 13/06/19.
//  Copyright © 2019 gammastack. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ImageDownloaderDelegate {
    
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loadingLabel: UILabel!
    
    var imageDownloader: ImageDownloader!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.alpha = 0.0
        loginView.alpha = 0.0
        let imageURl: String = "https://i.ytimg.com/vi/c-QZdUSV4QU/maxresdefault.jpg"
        imageDownloader = ImageDownloader(urlVarialbe: imageURl)
        imageDownloader.imageDelegate = self
        imageDownloader.downloadImage()
        if imageDownloader.imageDelegate == nil {
            loginView.alpha = 1.0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didFinishDownloading(_sender: ImageDownloader) {
        imageView.image = imageDownloader.imageVariable
        UIView.animate(withDuration: 2.0, delay: 0.5, options: UIViewAnimationOptions.curveEaseIn, animations:  {
            self.loadingLabel.alpha = 0.0
            self.imageView.alpha = 1.0
        }) { (completed:Bool) in
            if (completed) {
                UIView.animate(withDuration: 2.0) {
                    self.loginView.alpha = 1.0
                }
            }
        }
    }
    
}

