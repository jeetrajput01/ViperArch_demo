//
//  APIManger.swift
//  URLSessionDemo
//
//  Created by differenz199 on 05/07/22.
//

import Foundation

enum httpMethod: String {
    
    case post = "POST"
    case get = "GET"
    case delete = "DELETE"
    case put = "PUT"
    
    
}

public enum StatusCode: Int {
    case Success = 200
    case Unauthorized = 401
    case Fail = 402
    case InvalidConfiguration = 403
    case ListRefresh = 406
    case UserNotExist = 404
    case relationSuccess = 201
    case widgetRefresh = 408
}


struct YourResponseModel: Codable {
    // Your model properties
}

class APIManager: NSObject {
    

   class func makeRequest<T:Codable>(url: String, method: httpMethod,parameter:[String:Any]?,withSuccess: @escaping (_ response:T) -> Void,failure: @escaping (_ error:String, _ code:Int) -> Void) {
    
       guard let url = URL(string: url) else { return }
       
       var request = URLRequest(url: url)
       request.httpMethod = method.rawValue
       
       // Convert model to JSON data
       // body of request
       if let param = parameter, let data = try? JSONSerialization.data(withJSONObject: param, options: .prettyPrinted) {
           print(String(data: data, encoding: .utf8) ?? "Nil Param")
           request.httpBody = data
       }
       
       // set header
       request.setValue(apiURLs.apiKey, forHTTPHeaderField: "app-id")
       
       URLSession.shared.dataTask(with: request) { data, urlResponse, error in
           
           guard let httpResponse = urlResponse as? HTTPURLResponse else {
               return
           }
           
           guard let responseData = data else {
                return
            }
           print(responseData.prettyPrintedJSONString ?? "")

           if httpResponse.statusCode == StatusCode.Success.rawValue {
               
               guard let responseData = data else {
                   return
               }
               if let data = try? JSONDecoder().decode(T.self, from: responseData) {
                   withSuccess(data)
               } else {
                   failure("something went wrong",httpResponse.statusCode)
               }

               
           } else {

               failure("something went wrong",httpResponse.statusCode)
  
           }
           
           
       }
       .resume()
       
   }
  
    
    
    
}

extension Data {
    var prettyPrintedJSONString: String? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = String(data: data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) else { return nil }
        return prettyPrintedString
    }
}
