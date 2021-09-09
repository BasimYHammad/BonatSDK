//
//  CVCReward.swift
//  sdkProject
//
//  Created by Basim on 8/18/21.
//


//
//import KOLocalizedString
import UIKit
//
class CVCRewardSDKBonat: UICollectionViewCell {
//
//    @IBOutlet weak var viewBtonPointOrCollect: UIView!
//
    @IBOutlet weak var uiiimgeCopun: CustomImageViewSDKBonat!
    @IBOutlet weak var uiimgeLocked: CustomImageViewSDKBonat!

    @IBOutlet weak var laName: UILabel!
    @IBOutlet weak var buPoint: UIButton!
    @IBOutlet weak var viewPoint: UIView!

    
    @IBOutlet weak var la0ExpiredOn: UILabel!
    @IBOutlet weak var laExpiredOn: UILabel!
    @IBOutlet weak var stackDate: UIStackView!
    
    @IBOutlet weak var viewCollect: UIView!


    @IBOutlet weak var buCollect: UIButton!
//        { didSet {
//            buCollect.setTitle(KOLocalizedString("KeyCollect1"), for: .normal)
//            if KOCurrentLanguageKey() == "ar"{
//                buCollect.titleLabel?.font = AppFont.semiBold.size(10.0)
//
//            }
//        }
    
  //  }
//

    @IBOutlet weak var viewCodeCupon: UIView!
    @IBOutlet weak var buCodeCupon: UIButton!
    @IBOutlet weak var imgeCodeCupon: CustomImageViewSDKBonat!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
//
}


func convertDateFormatterSDKBonat(date: String) -> String {
   
   if date != "" {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSS'Z'"//this your string date format
    dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
      dateFormatter.locale = Locale(identifier: "your_loc_id")
      let convertedDate = dateFormatter.date(from: date)
      guard dateFormatter.date(from: date) != nil  else {
   //     assert(false, "no date from string")
       
       
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"//this your string date format
       dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
       dateFormatter.locale = Locale(identifier: "your_loc_id")
       let convertedDate = dateFormatter.date(from: date)
       
       guard dateFormatter.date(from: date) != nil  else {
           return ""
       }
       dateFormatter.dateFormat = "MMM d, yyyy h:mm a"///this is what you want to convert format
       dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
       let timeStamp = dateFormatter.string(from: convertedDate!)
        
       print(timeStamp)
       return timeStamp
       
       
         // return ""
      }
      dateFormatter.dateFormat = "MMM d, yyyy h:mm a"///this is what you want to convert format
      dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
      let timeStamp = dateFormatter.string(from: convertedDate!)
       
      print(timeStamp)
      return timeStamp
   }else {
         return ""
   }
}

