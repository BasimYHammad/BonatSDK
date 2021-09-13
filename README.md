# BonatSDK
SDKBonat iOS : 


![Image of Yaktocat](https://octodex.github.com/images/yaktocat.png)


The project is divided into two parts : 

First - loyalty system
Customer Loyalty Info
This shall enable the user to view their own loyalty details.
Rewards & Redemption
This shall enable the user to view available rewards and redeem them.
Review & Feedback
This shall enable the user to provide feedback and rating after each order.

Secondly - Read QRcode
This shall enable the user to scan the QR code to register a visit.


Requirements
 First, you have to change a few things to make them work together :


- idMerchant  Take it from us Required
- Secret KEY Take it from us Required
- Phone Number It is the real phone number of your application user and it is your responsibility to define it in the code Required
- languageSDK (en / ar)  note en is default 

______

--If you want to use QRCode reading feature
You need to add some data in the Info.plist file

 Privacy - Camera Usage Description  
<key>NSCameraUsageDescription</key>
    <string>need use Camera SDKBonat</string>
You can change the value as required for Business









Development info : 
We implement with swift language for all xcode version 

 

--Now for the fun part of the project
All you have to do is download the project and follow these steps:
 
1- ​​drag and drop SDKBonat Folder to your project with all file Inside
 don't forget check i(copy items if needed)









- Now it is possible to build successfully 



--To run the SDK, you need to call the class VCRewardsSDKBonat in the place you want, and you need
Call like this : 

   let vc = VCRewardsSDKBonat()
        vc.idMerchant = "1000" // form bonat team call support to get idMerchant for Merchant
        vc.secret = "7102273b683c8e7d"  // form bonat team call support to get secret key for Merchant
        vc.phoneNumber = "0512345678" // user phone number form your app
        vc.languageSDK = "en"  //"en" "ar"
        self.navigationController?.pushViewController(vc, animated: true)





 
--- And for QRcode scanner call class VCCameraQR like this : 
   let vc = VCCameraQR()
        vc.idMerchant = "1000" // form bonat team call support to get idMerchant for Merchant
        vc.secret = "7102273b683c8e7d"  // form bonat team call support to get secret key for Merchant
        vc.phoneNumber = "0512345678" // user phone number form your app
        self.navigationController?.pushViewController(vc, animated: true)

 
 
================


--- And make some adjustments to the environment. Go to class: APIManagerSDKBonat ,You will find
Change the next
1-  environment (.test , .stage , .live)
2-  language (.ar , .en)
 
  
  func prepareURL(url : String) -> String {
        return getServerApiStatus(environment: .stage) + getlanguageSDK(language: .en)  + "/\(url)"   }

 func prepareURL2(url : String) -> String {
        return getServerApiStatus2(environment: .stage)  + "\(url)"  }

3- environment (.dev , .prod)

       func prepareURL3() -> String {
        return getFireBaseSDK(environment: .dev)  }
 
    





-- Access to the QRCode reading button until it is placed in the application. You can download it from here scanBtnHome w 70 x h 70 : 
https://drive.google.com/drive/folders/15OvILkkFvjpZuBsVGB4g3fhQayf-3VEv?usp=sharing

















pages from SDK : 






Contact us : 
- Bonat development team.

