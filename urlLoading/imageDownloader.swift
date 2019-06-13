//
//  imageDownloader.swift
//  urlLoading
//
//  Created by mac on 13/06/19.
//  Copyright © 2019 gammastack. All rights reserved.
//

import Foundation
import UIKit

class ImageDownloader {
    
    var logoURL: String
    var imageVariable: UIImage?

    var imageDelegate: ImageDownloaderDelegate?

    init(urlVarialbe: String) {
        self.logoURL = urlVarialbe
    }
    func downloadImage() {
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            let imageURL = URL(string: self.logoURL)
            let imageData = NSData(contentsOf: imageURL!)
            self.imageVariable = UIImage(data: imageData! as Data )
            print("Image Downloaded")
            
            DispatchQueue.main.async {
                self.didDownloadImage()
            }
        }
    }
    func didDownloadImage() {
        imageDelegate?.didFinishDownloading(_sender: self)
    }
}










