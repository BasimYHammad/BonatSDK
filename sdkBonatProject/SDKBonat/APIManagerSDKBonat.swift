//
//  APIManager.swift
//  sdkBonatProject
//
//  Created by Basim on 9/9/21.
//

import Foundation
open class APIManagerSDKBonat {
    
    static let shared = APIManagerSDKBonat()
        
    let URL_sdkAuthApi = "sdk/auth"
    let URL_sdkAuthCustomer = "sdk/auth/customer"
    
    let URL_loyalMerchant = "loyalMerchant/"
    let URL_coupons = "coupons"
    let URL_inbox = "inbox"
    let URL_pointRedemption = "pointRedemption"
    
    enum serverApi {
        case test
        case stage
        case live
    }
    
    func getServerApiStatus(environment: serverApi) -> String {
        switch environment {
        case .test:
            return "http://52.15.230.101:3000/customer/v2/" // test SDK secret  for idMerchant = 1000 is 2f4992dc88f66336
        case .stage:
            return "https://stg-api.bonat.io/customer/v2/" // stage SDK secret on stag for idMerchant = 1000 is 7102273b683c8e7d
        case .live:
            return "https://api.bonat.io/customer/v2/"    // live
        }
    }
    
    func getServerApiStatus2(environment: serverApi ) -> String {
        switch environment {
        case .test:
            return "http://52.15.230.101:3000/customer/v3/" // test SDK secret  for idMerchant = 1000 is 2f4992dc88f66336
        case .stage:
            return "https://stg-api.bonat.io/customer/v3/" // stage SDK secret on stag for idMerchant = 1000 is 7102273b683c8e7d
        case .live:
            return "https://api.bonat.io/customer/v3/"    // live
        }
    }
    
    
    enum languageSDK {
        case ar
        case en
    }
    
    func getlanguageSDK(language: languageSDK) -> String {
        switch language {
        case .ar:
            return "ar"
        case .en:
            return "en"
            
            
        }
    }
    
    enum FireBaseSDKBonat {
        case dev
        case prod
    }
    
    func getFireBaseSDK(environment: FireBaseSDKBonat) -> String {
        switch environment {
        case .dev:
            return "https://us-central1-bonatdev.cloudfunctions.net/updateOrder?env=dev"
        case .prod:
            return "https://us-central1-bonatdev.cloudfunctions.net/updateOrder?env=prod"
        }
    }
    
    func prepareURL(url : String) -> String {
        return getServerApiStatus(environment: .stage) + getlanguageSDK(language: .en)  + "/\(url)"
    }
    func prepareURL2(url : String) -> String {
        return getServerApiStatus2(environment: .stage)  + "\(url)"
    }
    func prepareURL3() -> String {
        return getFireBaseSDK(environment: .dev)
    }
    
    
//    class func generateURL(url:String)->String{
//        return APIManagerSDKBonat.shared.prepareURL(url: url)
//    }
//
    func post_sdkAuthFirst(idMerchant : String , secret : String  , phoneNumber : String , os : String ,onSuccess: @escaping(SDKBonatAuth, String?) -> Void ,messageReturn: @escaping(String) -> Void,onFailure: @escaping(String) -> Void) {
        
        
        let semaphore = DispatchSemaphore (value: 0)
        let parameters = "{\n    \"idMerchant\": \(idMerchant),\n    \"secret\": \"\(secret)\"\n    \n}"
        let postData = parameters.data(using: .utf8)
        var request = URLRequest(url: URL(string: APIManagerSDKBonat.shared.prepareURL2(url: URL_sdkAuthApi))!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                semaphore.signal()
                return
            }
            //  print(String(data: data, encoding: .utf8)!)
            
            do {
                let blogPost: SDKBonatAuth = try JSONDecoder().decode(SDKBonatAuth.self, from: data)
                DispatchQueue.main.async {
                    onSuccess(blogPost  , "done")
                }
            } catch {
                onFailure("erroee let blogPost: SDKBonatAuth = try JSONDecoder().decode(SDKBonatAuth.self, from: data)")
                
            }
            semaphore.signal()
        }
        
        task.resume()
        semaphore.signal()
        
    }
    
    func post_userCustomerAuth(phoneNumber : String , os : String  , sdK_Token : String  ,onSuccess: @escaping(CustomerAuthSDKBonat, String?) -> Void ,messageReturn: @escaping(String) -> Void,onFailure: @escaping(String) -> Void) {
        
        let semaphore = DispatchSemaphore (value: 0)
        let parameters = "{\n     \"os\": \"\(os)\",\n    \"phoneNumber\": \"\(phoneNumber)\" \n\n}"
        let postData = parameters.data(using: .utf8)
        var request = URLRequest(url: URL(string: APIManagerSDKBonat.shared.prepareURL2(url: URL_sdkAuthCustomer))!,timeoutInterval: Double.infinity)
        request.addValue("Bearer \(sdK_Token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                semaphore.signal()
                return
            }
            do {
                let customerAuth: CustomerAuthSDKBonat = try JSONDecoder().decode(CustomerAuthSDKBonat.self, from: data)
                DispatchQueue.main.async {
                    onSuccess(customerAuth  , "done")
                }
            } catch {
                onFailure("customerAuth: CustomerAuthSDKBonat = try JSONDecoder().decode(CustomerAuthSDKBonat.self, from: data)")
            }
            
            semaphore.signal()
            
        }
        
        task.resume()
        semaphore.signal()
        
    }
    
    func get_loyalMerchant(idMerchant : String , sdKTokenNew : String  ,onSuccess: @escaping(LoyalMerchantSDKBonat, String?) -> Void ,messageReturn: @escaping(String) -> Void,onFailure: @escaping(String) -> Void) {
        
        let semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: APIManagerSDKBonat.shared.prepareURL(url: URL_loyalMerchant) + "\(idMerchant)")!,timeoutInterval: Double.infinity)
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(sdKTokenNew)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                semaphore.signal()
                return
            }
            do {
                
                let blogPost: LoyalMerchantSDKBonat = try JSONDecoder().decode(LoyalMerchantSDKBonat.self, from: data)
                DispatchQueue.main.async {
                    onSuccess(blogPost  , "done")
                }
                
            } catch {
                onFailure (" erorrrrrrrrrrr let blogPost: LoyalMerchant = try JSONDecoder().decode(LoyalMerchant.self, from: data)")
            }
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        
    }
    
    
    func get_couponsList( sdKTokenNew : String  ,onSuccess: @escaping(CouponSDKBonat, String?) -> Void ,messageReturn: @escaping(String) -> Void,onFailure: @escaping(String) -> Void) {
        
        let semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: APIManagerSDKBonat.shared.prepareURL(url: URL_coupons) + "?historyLimit=0&giftLimit=0")!,timeoutInterval: Double.infinity)
        
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(sdKTokenNew)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                semaphore.signal()
                return
            }
            //  print(String(data: data, encoding: .utf8)!)
            do {
                let blogPost: CouponSDKBonat = try JSONDecoder().decode(CouponSDKBonat.self, from: data)
                DispatchQueue.main.async {
                    onSuccess(blogPost  , "done")
                }
            } catch {
                onFailure (" erorrrrrrrrrrr let blogPost: CouponSDKBonat = try JSONDecoder().decode(CouponSDKBonat.self, from: data)")
                
            }
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        
    }
    
    
    
    func  post_messageFeedback(idMerchant : String ,message : String , rate : String ,sdKTokenNew : String  ,onSuccess: @escaping(FeedBackSDKBonat, String?) -> Void ,messageReturn: @escaping(String) -> Void,onFailure: @escaping(String) -> Void) {
        
        let semaphore = DispatchSemaphore (value: 0)
        
        let parameters = "idMerchant=\(idMerchant)&message=\(message)&rate=\(rate)"
        let postData =  parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: APIManagerSDKBonat.shared.prepareURL(url: URL_inbox) )!,timeoutInterval: Double.infinity)
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(sdKTokenNew)", forHTTPHeaderField: "Authorization")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                semaphore.signal()
                return
            }
            print(String(data: data, encoding: .utf8)!)
            
            do {
                let blogPost: FeedBackSDKBonat = try JSONDecoder().decode(FeedBackSDKBonat.self, from: data)
                
                DispatchQueue.main.async {
                    onSuccess(blogPost  , "done")
                }
                
                
            } catch {
                onFailure (" erorrrrrrrrrrr let blogPost: FeedBackSDKBonat = try JSONDecoder().decode(CouponSDKBonat.self, from: data)")
                
            }
            
            
            semaphore.signal()
        }
        
        task.resume()
        semaphore.signal()
        
    }
    
    
    func  post_pointRedemption(idCampaign : String , sdKTokenNew : String  ,onSuccess: @escaping(PointRedemptionSDKBonat, String?) -> Void ,messageReturn: @escaping(String) -> Void,onFailure: @escaping(String) -> Void) {
        
        let semaphore = DispatchSemaphore (value: 0)
        
        let parameters = "idCampaign=\(idCampaign)"
        let postData =  parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: APIManagerSDKBonat.shared.prepareURL(url: URL_pointRedemption) )!,timeoutInterval: Double.infinity)
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(sdKTokenNew)", forHTTPHeaderField: "Authorization")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                semaphore.signal()
                return
            }
           print(String(data: data, encoding: .utf8)!)
            do {
                let blogPost: PointRedemptionSDKBonat = try JSONDecoder().decode(PointRedemptionSDKBonat.self, from: data)
                // print(blogPost)
                
                DispatchQueue.main.async {
                    onSuccess(blogPost  , "done")
                }
              
            } catch {
                onFailure (" erorrrrrrrrrrr let blogPost: PointRedemptionSDKBonat = try JSONDecoder().decode(PointRedemptionSDKBonat.self, from: data)")
            }
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        
    }
    
    
    
    func updateOrder( idCustomer : String , data : String , sdKTokenNew : String  ,onSuccess: @escaping(String?) -> Void ,messageReturn: @escaping(String) -> Void,onFailure: @escaping(String) -> Void) {
        
        let semaphore = DispatchSemaphore (value: 0)

        let parameters = "data=\(data)&idCustomer=\(idCustomer)&sdk=true"
        let postData =  parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: APIManagerSDKBonat.shared.prepareURL3())!,timeoutInterval: Double.infinity)
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(sdKTokenNew)", forHTTPHeaderField: "Authorization")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            onFailure("not done")
            semaphore.signal()
            
            return
          }
          print(String(data: data, encoding: .utf8)!)
            DispatchQueue.main.async {
                onSuccess("done")
            }
           
            
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
    }
    
}

public func post_SDKBounatAuthFirst(idMerchant: String, secret: String, phoneNumber: String  , onSuccess: @escaping(CustomerAuthSDKBonat) -> Void )  {
    APIManagerSDKBonat.shared.post_sdkAuthFirst(idMerchant: idMerchant, secret: secret, phoneNumber: phoneNumber , os: "iOS", onSuccess: { (data, msg) in
        if msg == "done" {
            post_SDKBounatuserCustomerAuth(phoneNumber: phoneNumber  , os : "iOS" ,  sdK_Token: data.data?.sdkToken ?? "", onSuccess: { (dataNew , msg)  in
                onSuccess(dataNew)
            })
            
        }else {
            print ( "check api url and response form server")
        }
    }, messageReturn: { (msg) in
        print (msg)
    }, onFailure: { (msg) in
        print (msg)
    })
}
public func post_SDKBounatuserCustomerAuth(phoneNumber: String  , os : String ,  sdK_Token: String  ,onSuccess: @escaping(CustomerAuthSDKBonat , String) -> Void )  {
    APIManagerSDKBonat.shared.post_userCustomerAuth(phoneNumber: phoneNumber, os: os, sdK_Token: sdK_Token, onSuccess: { (data, msg) in
        if msg == "done" {
            
            onSuccess(data , "done")
            
        }else {
            print ( "check api url and response form server")
        }
    }, messageReturn: { (msg) in
        print (msg)
    }, onFailure: { (msg) in
        print (msg)
    })
}




