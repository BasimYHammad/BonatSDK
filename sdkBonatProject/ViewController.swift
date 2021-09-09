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
        print("scan scan scan")
        
        let vc = VCCameraQR()
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    @IBAction func Reward(_ sender: Any) {
        let vc = VCRewardsSDKBonat()
        self.navigationController?.pushViewController(vc, animated: true)

  }
   
    
    
}


