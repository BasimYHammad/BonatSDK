
# SDKBonat : 


Bonat easily gets you rewarded at different businesses around you. It's the most convenient rewards app in the region, you can buy coupons and gift cards through the app and use them whenever you visit our partner businesses. All you need is your phone to get your unique Qr code whenever you visit the shop scan it and we will count your visits until you get rewarded.


## Development info : 
We implement with swift language for all xcode version 

## Getting Started

### Requirements

First, you have to change a few things to make them work together :


- **idMerchant** : Take it from us Required
- **Secret KEY** : Take it from us Required
- **Phone Number** :It is the real phone number of your application user and it is your responsibility to define it in the code Required
- **languageSDK** : (en / ar)  note en is default 

______

### note : you need camera permission

If you want to use QRCode reading feature
You need to add some data in the file

#### Info.plist
Privacy - Camera Usage Description

```python
 
<key>NSCameraUsageDescription</key>
   <string>need use Camera SDKBonat</string>

```
You can change the value as required for Business.
______


## Setup SDK
--Now for the function part of the SDK
All you have to do is download the project and follow these steps:

1- ​​drag and drop **SDKBonat** Folder to your project with all file Inside.





[![image](https://www.linkpicture.com/q/Screen-Shot-2021-09-09-at-7.43.57-AM.png)](https://www.linkpicture.com/view.php?img=LPic613fc449ef6611916619745)



#### don't forget check i(copy items if needed)

[![image](https://www.linkpicture.com/q/Screen-Shot-2021-09-09-at-7.39.54-AM.png)](https://www.linkpicture.com/view.php?img=LPic613fc46b00502363608011)



## environment 
And make some adjustments to the environment. Go to class: ***APIManagerSDKBonat.swift*** ,You will find
Change the next : 

**1-  environment (.test , .stage , .live)**

**2-  language (.ar , .en)**

**3- environment (.dev , .prod)**

     func prepareURL(url : String) -> String {
       return getServerApiStatus(environment: .stage) + getlanguageSDK(language: .en)  + "/\(url)" }

     func prepareURL2(url : String) -> String {
       return getServerApiStatus2(environment: .stage)  + "\(url)"  }

     func prepareURL3() -> String {
       return getFireBaseSDK(environment: .dev)  }




[![image](https://www.linkpicture.com/q/Screen-Shot-2021-09-12-at-4.59.26-AM.png)](https://www.linkpicture.com/view.php?img=LPic613fc3b19123d676301829)



### Now it is possible to build successfully. 






______

## Usage





--For show and using point reward, calling, call the class ***VCRewardsSDKBonat*** in the place you want, and you need
Call like this : 

```python
  let vc = VCRewardsSDKBonat()
       vc.idMerchant = "XXXX" // form bonat team call support to get idMerchant for Merchant
       vc.secret = "XXXXXXXXXXXXXXXXXX"  // form bonat team call support to get secret key for Merchant
       vc.phoneNumber = "05XXXXXXXX" // user phone number form your app
       vc.languageSDK = "en"  // "en" "ar"
       self.navigationController?.pushViewController(vc, animated: true)

```



[![image](https://www.linkpicture.com/q/Screen-Shot-2021-09-12-at-9.43.26-AM.png)](https://www.linkpicture.com/view.php?img=LPic613fc414d1ccb391172160)





















--For scan QRCode and register your visit, calling class ***VCCameraQR*** like this : 







```python
  let vc = VCCameraQR()
       vc.idMerchant = "XXXX" // form bonat team call support to get idMerchant for Merchant
       vc.secret = "XXXXXXXXXXXXXXXXXX" // form bonat team call support to get secret key for Merchant
       vc.phoneNumber = "05XXXXXXXX" // user phone number form your app
       self.navigationController?.pushViewController(vc, animated: true)

```




[![image](https://www.linkpicture.com/q/Screen-Shot-2021-09-12-at-9.53.34-AM.png)](https://www.linkpicture.com/view.php?img=LPic613fc3f002d821117270934)


________

-- Access to the QRCode reading button until it is placed in the application. You can download it from here scanBtnHome **w 70 x h 70** : 

**download**
(https://drive.google.com/drive/folders/15OvILkkFvjpZuBsVGB4g3fhQayf-3VEv?usp=sharing)


________


### Pages From SDK : 


[![image](https://www.linkpicture.com/q/01-Rewards.png)](https://www.linkpicture.com/view.php?img=LPic613fc5a9336551429780811)

[![image](https://www.linkpicture.com/q/02-Wallet.png)](https://www.linkpicture.com/view.php?img=LPic613fc5a9336551429780811)





[![image](https://www.linkpicture.com/q/03-feedback.png)](https://www.linkpicture.com/view.php?img=LPic613fc5a9336551429780811)



[![image](https://www.linkpicture.com/q/04-Rewards-n-Empty.png)](https://www.linkpicture.com/view.php?img=LPic613fc5a9336551429780811)


[![image](https://www.linkpicture.com/q/IMG_8838.jpg)](https://www.linkpicture.com/view.php?img=LPic613fc63ea5351779580258)




### Contact us : 
- Bonat development team.


