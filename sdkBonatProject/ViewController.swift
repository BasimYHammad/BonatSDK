//
//  ViewController.swift
//  sdkBonatProject
//
//  Created by Basim on 9/9/21.
//



import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var stackBtn: UIStackView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
 
        self.navigationController?.navigationBar.isHidden = true
       
    }

    override func viewDidAppear(_ animated: Bool) {
    
    }
    override func viewWillDisappear(_ animated: Bool) {
        
    }
 
    @IBAction func scan(_ sender: Any) {
       // print("scan QRCode")
        
        let vc = VCCameraQR()
        vc.idMerchant = "1000" // form bonat team call support to get idMerchant for Merchant
        vc.secret = "7102273b683c8e7d"  // form bonat team call support to get secret key for Merchant
        vc.phoneNumber = "0512345678" // user phone number form your app
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    @IBAction func Reward(_ sender: Any) {
        // go to reward page
        let vc = VCRewardsSDKBonat()
        vc.idMerchant = "1000" // form bonat team call support to get idMerchant for Merchant
        vc.secret = "7102273b683c8e7d"  // form bonat team call support to get secret key for Merchant
        vc.phoneNumber = "0512345678" // user phone number form your app
        vc.languageSDK = "en"  //"en" "ar"
        self.navigationController?.pushViewController(vc, animated: true)

  }
   
    
    
}


