//
//  FlickerPhoto.swift
//  VirtualTourist
//
//  Created by Alhanouf AlOthman on 08/12/2019.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit
class FlickrPhoto: Equatable {
  var photoImage: UIImage?
  let photoID: String
  let farm: Int
  let server: String
  let secret: String

  init (photoID: String, farm: Int, server: String, secret: String, photoImage: UIImage? = nil) {
    self.photoID = photoID
    self.farm = farm
    self.server = server
    self.secret = secret

    if let photo = photoImage {
      self.photoImage = photo
    }
  }

  func flickrImageURL(_ size: String = "q") -> URL? {
    if let url =  URL(string: "https://farm\(farm).staticflickr.com/\(server)/\(photoID)_\(secret)_\(size).jpg") {
      return url
    }
    return nil
  }

  static func ==(lhs: FlickrPhoto, rhs: FlickrPhoto) -> Bool {
    return lhs.photoID == rhs.photoID
  }

  enum Error: Swift.Error {
    case invalidURL
    case noData
  }
}
