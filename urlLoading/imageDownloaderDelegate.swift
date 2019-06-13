//
//  imageDownloaderDelegate.swift
//  urlLoading
//
//  Created by mac on 13/06/19.
//  Copyright © 2019 gammastack. All rights reserved.
//

import Foundation
import UIKit

protocol ImageDownloaderDelegate {
    func didFinishDownloading(_sender: ImageDownloader)
}
