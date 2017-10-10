//
//  MealsManager.swift
//  W6D1-Assignment
//
//  Created by Jason Liang on 10/10/17.
//  Copyright © 2017 Jason Liang. All rights reserved.
//

import UIKit

class Meal : NSObject {

}

typealias QueryResult = (Meal?, String?) -> ()

typealias ProcessLink = (URL, String?) -> ()



class MealsManager: NSObject {

  
  let defaultSession = URLSession(configuration: .default)
  var dataTask: URLSessionDataTask?
  var errorMessage = ""
  var meal : Meal?
  
  //1. signin or signup, save the token
  
  func getSearchResults(completion: @escaping QueryResult) {
    dataTask?.cancel()
    let urlString = "https://cloud-tracker.herokuapp.com/users/me/meals?title=apricot&description=golden%20yellow&calories=50"
    
    if let url = URL(string: urlString) {
      
      let session = self.defaultSession
      
      
      var request = URLRequest(url:url)
      request.addValue("pTPTojE9vbGVAhC8jaTCCNFz", forHTTPHeaderField: "token")
      
      let task = session.dataTask(with: request) {
        (data, response, error) in
        
        if let error = error {
          self.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
        } else if let data = data {
          self.updateSearchResults(data)
          DispatchQueue.main.async {
            
            // if meal image url is nil then
            
            completion(self.meal, self.errorMessage)
            
            self.uploadImage(postLinkHandler: { (url, error) in
              if !(error != nil) {
                self.updateImageURLToAPI(url: url, postAPILinkHandler: { (url, error) in
                  //get the final result and do something about it.
                  
                })
              }
            })
            
          }
        }
      }
      
      self.dataTask = task
      dataTask?.resume()
    }
  }
  
  fileprivate func uploadMealImage(meal: Meal, url: URL, token: String) {
    //upload meal image
    
    //once uploaded, in the completion handler
  }
  
  fileprivate func updateSearchResults(_ data: Data) {
    //var response: JSONDictionary<<#Key: Hashable#>, Any>?
    
    do {
      let obj = try JSONSerialization.jsonObject(with: data, options: [])
      print("obj")
    } catch let parseError as NSError {
      errorMessage += "JSONSerialization error: \(parseError.localizedDescription)\n"
      return
    }
  }
  
  func updateImageURLToAPI(url : URL, postAPILinkHandler:@escaping ProcessLink) {
    // another url session upload blah...
  
    let imageData = UIImageJPEGRepresentation(UIImage(), 1)
    if(imageData == nil ) { return }
    
    
    guard let uploadScriptUrl = URL(string:"http://www.swiftdeveloperblog.com/http-post-example-script/") else { return }
    
    var request = URLRequest(url: uploadScriptUrl)
    request.httpMethod = "POST"
    request.setValue("Keep-Alive", forHTTPHeaderField: "Connection")
    
    let task = defaultSession.uploadTask(with: request, from: imageData) { (data, response, error) in
    
    
    // do something after image got uploaded
    
    // 2. if upload is success ->
    
    let url : URL = URL(string: "")! // this is the uploaded image URL returned from the API
    //if successful
    postAPILinkHandler(url, nil)
    //else display error
    }
    
    task.resume()
  }
  
  func uploadImage(postLinkHandler:@escaping ProcessLink) {
    
    let imageData = UIImageJPEGRepresentation(UIImage(), 1)
    if(imageData == nil ) { return }
    
    
    guard let uploadScriptUrl = URL(string:"http://www.swiftdeveloperblog.com/http-post-example-script/") else { return }
    
    var request = URLRequest(url: uploadScriptUrl)
    request.httpMethod = "POST"
    request.setValue("Keep-Alive", forHTTPHeaderField: "Connection")
    
    let task = defaultSession.uploadTask(with: request, from: imageData) { (data, response, error) in
      
      
      // do something after image got uploaded
      
      // 2. if upload is success ->
      
      let url : URL = URL(string: "")! // this is the uploaded image URL returned from the API
      //if successful
      postLinkHandler(url, nil)
      //else display error
    }
    
    task.resume()
  }
  
}
