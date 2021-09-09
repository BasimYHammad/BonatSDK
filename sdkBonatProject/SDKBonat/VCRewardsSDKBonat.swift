//
//  VCRewards.swift
//  sdkProject
//
//  Created by Basim on 8/18/21.
//

import UIKit

class VCRewardsSDKBonat: UIViewController  , UITextViewDelegate {


    var languageSDK = "ar"



    var customerAuth1 : CustomerAuthSDKBonat!
    var loyalMerchant : LoyalMerchantSDKBonat?
    var coupon : CouponSDKBonat?
    

    
    @IBOutlet weak var viewEmptyALL: UIView!

    @IBOutlet weak var viewEmpty: UIView!
    @IBOutlet weak var imgeWalletEmapty: UIImageView!
    @IBOutlet weak var imgeRewWardsEmapty: UIImageView!
    @IBOutlet weak var laNoRewards: UILabel!
    @IBOutlet weak var laTryAgin: UILabel!
    @IBOutlet weak var viewFeedBackFinal: UIView!
    @IBOutlet weak var txtView: UITextView!

    @IBOutlet weak var buSend: UIButton!
    @IBOutlet weak var buSkip: UIButton!
    @IBAction func buSendPressed(_ sender: Any) {
        self.view.endEditing(true)
        print ("buSendPressed")
        
        
        self.post_messageFeedback(idMerchant: self.customerAuth1.data.idMerchant?.description ?? "", message: self.txtView.text, rate: self.ratingSelectFinal.description, sdKTokenNew: self.customerAuth1.data.sdkToken.description)
        
    }
    @IBAction func buSkipPressed(_ sender: Any) {
        print ("buSkipPressed")
        self.view.endEditing(true)
        viewFeedBackFinal.isHidden = true
        if self.languageSDK == "ar" {
            self.txtView.text = "اكتب رايك"
        }else {
            self.txtView.text = "Describe your feadback"
        }
        txtView.textColor = UIColor.lightGray
    }
    
    
    @IBOutlet weak var stackAll: UIStackView!
    @IBOutlet var collectionViewRewards: UICollectionView!
    @IBOutlet var collectionViewWallet: UICollectionView!

    @IBOutlet weak var laRewards: UILabel!
    @IBOutlet weak var laTietle: UILabel!
    @IBOutlet weak var laPointUser: UILabel!
    @IBOutlet weak var laPoints: UILabel!
    @IBOutlet weak var laYouSaved: UILabel!
    @IBOutlet weak var laValueSaved: UILabel!
    @IBOutlet weak var laHowWasYourExperience: UILabel!
    @IBOutlet weak var laWallet: UILabel!

    @IBOutlet weak var viewLineRewards: UIView!
    @IBOutlet weak var viewLineWallet: UIView!

    @IBOutlet weak var buWallet: UIButton!
    @IBOutlet weak var buRewards: UIButton!
    @IBAction func buWalletPreesed(_ sender: Any) {
        
        collectionViewWallet.isHidden = false
        collectionViewRewards.isHidden = true
        collectionViewWallet.reloadData()
        
        viewLineRewards.backgroundColor  = .lightGray
        viewLineWallet.backgroundColor = .black
        
        laWallet.textColor  = .black
        laRewards.textColor = .lightGray
        
    }
    
    
    @IBAction func buRewards(_ sender: Any) {
        collectionViewWallet.isHidden = true
        collectionViewRewards.isHidden =  false
        collectionViewRewards.reloadData()
        
        viewLineRewards.backgroundColor = .black
        viewLineWallet.backgroundColor  = .lightGray
 
        laWallet.textColor   = .lightGray
        laRewards.textColor  = .black
    }
    
    @IBOutlet weak var buBack: UIButton!
    @IBAction func bubuBackPreesed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    @IBOutlet weak var viewbuEmge1: UIView!
    @IBOutlet weak var buEmge1: UIButton!
    @IBOutlet weak var viewbuEmge2: UIView!
    @IBOutlet weak var buEmge2: UIButton!
    @IBOutlet weak var viewbuEmge3: UIView!
    @IBOutlet weak var buEmge3: UIButton!
    @IBOutlet weak var viewbuEmge4: UIView!
    @IBOutlet weak var buEmge4: UIButton!
    @IBOutlet weak var viewbuEmge5: UIView!
    @IBOutlet weak var buEmge5: UIButton!
    
    
    @IBAction func buEmgePressed(_ sender: Any) {
        
        print ((sender as! UIButton).tag)
        changeSelectFeedBack(tag: (sender as! UIButton).tag)
    }
    
    
    func changeSelectFeedBack(tag : Int)  {
        switch tag {
        case 1:
            self.viewbuEmge1.backgroundColor = #colorLiteral(red: 0.8235294118, green: 0.6941176471, blue: 0.5333333333, alpha: 0.24)
            self.viewbuEmge2.backgroundColor = UIColor.clear
            self.viewbuEmge3.backgroundColor = UIColor.clear
            self.viewbuEmge4.backgroundColor = UIColor.clear
            self.viewbuEmge5.backgroundColor = UIColor.clear
            changeConstect(rate: 1)
            
            return
            
        case 2:
            self.viewbuEmge1.backgroundColor = UIColor.clear
            self.viewbuEmge2.backgroundColor = #colorLiteral(red: 0.8235294118, green: 0.6941176471, blue: 0.5333333333, alpha: 0.24)
            self.viewbuEmge3.backgroundColor = UIColor.clear
            self.viewbuEmge4.backgroundColor = UIColor.clear
            self.viewbuEmge5.backgroundColor = UIColor.clear
            changeConstect(rate: 2)
            return
        case 3:
            self.viewbuEmge1.backgroundColor = UIColor.clear
            self.viewbuEmge2.backgroundColor = UIColor.clear
            self.viewbuEmge3.backgroundColor = #colorLiteral(red: 0.8235294118, green: 0.6941176471, blue: 0.5333333333, alpha: 0.24)
            self.viewbuEmge4.backgroundColor = UIColor.clear
            self.viewbuEmge5.backgroundColor = UIColor.clear
            changeConstect(rate: 3)
            return
        case 4:
            
            self.viewbuEmge1.backgroundColor = UIColor.clear
            self.viewbuEmge2.backgroundColor = UIColor.clear
            self.viewbuEmge3.backgroundColor = UIColor.clear
            self.viewbuEmge4.backgroundColor = #colorLiteral(red: 0.8235294118, green: 0.6941176471, blue: 0.5333333333, alpha: 0.24)
            self.viewbuEmge5.backgroundColor = UIColor.clear
            changeConstect(rate: 4)
            return
        case 5:
            self.viewbuEmge1.backgroundColor = UIColor.clear
            self.viewbuEmge2.backgroundColor = UIColor.clear
            self.viewbuEmge3.backgroundColor = UIColor.clear
            self.viewbuEmge4.backgroundColor = UIColor.clear
            self.viewbuEmge5.backgroundColor = #colorLiteral(red: 0.8235294118, green: 0.6941176471, blue: 0.5333333333, alpha: 0.24)
            ///
            changeConstect(rate: 5)
            ///
            return
        default:
            return
        }
        
    }
    var ratingSelect = 5
    func changeConstect(rate : Int)  {
        
       // print (rate , "adasdasdadlknsadkasknld")
        
        switch rate {
        case 1:
            ratingSelect = 1
            
            showFeedBackView(rate: 1)
            return
            
        case 2:
            ratingSelect = 2
            showFeedBackView(rate: 2)

            return
        case 3:
            ratingSelect = 3
            showFeedBackView(rate: 3)

            return
        case 4:
            ratingSelect = 4
            showFeedBackView(rate: 4)

            return
        case 5:
            ratingSelect = 5
            showFeedBackView(rate: 5)
            return
        default:
            ratingSelect = 5
            showFeedBackView(rate: 5)


            return
        }
        
        
    }
    
    
    func showFeedBackView(rate : Int)  {
        viewFeedBackFinal.isHidden = false
        changeSelectFeedBackFinal(tag: rate)
        
    }
    
    
    
    @IBOutlet weak var viewbuEmgeFinal1: UIView!
    @IBOutlet weak var buEmgeFinal1: UIButton!
    @IBOutlet weak var viewbuEmgeFinal2: UIView!
    @IBOutlet weak var buEmgeFinal2: UIButton!
    @IBOutlet weak var viewbuEmgeFinal3: UIView!
    @IBOutlet weak var buEmgeFinal3: UIButton!
    @IBOutlet weak var viewbuEmgeFinal4: UIView!
    @IBOutlet weak var buEmgeFinal4: UIButton!
    @IBOutlet weak var viewbuEmgeFinal5: UIView!
    @IBOutlet weak var buEmgeFinal5: UIButton!
    
    var ratingSelectFinal = 5

    @IBAction func buEmgeFinalPressed(_ sender: Any) {
        
        print ((sender as! UIButton).tag)
        
        changeSelectFeedBackFinal(tag: ((sender as! UIButton).tag))
    }
    
    func changeSelectFeedBackFinal(tag : Int)  {
        switch tag {
        case 1:
            self.viewbuEmgeFinal1.backgroundColor = #colorLiteral(red: 0.8235294118, green: 0.6941176471, blue: 0.5333333333, alpha: 0.24)
            self.viewbuEmgeFinal2.backgroundColor = UIColor.clear
            self.viewbuEmgeFinal3.backgroundColor = UIColor.clear
            self.viewbuEmgeFinal4.backgroundColor = UIColor.clear
            self.viewbuEmgeFinal5.backgroundColor = UIColor.clear
            ratingSelectFinal = 1
            return
            
        case 2:
            self.viewbuEmgeFinal1.backgroundColor = UIColor.clear
            self.viewbuEmgeFinal2.backgroundColor = #colorLiteral(red: 0.8235294118, green: 0.6941176471, blue: 0.5333333333, alpha: 0.24)
            self.viewbuEmgeFinal3.backgroundColor = UIColor.clear
            self.viewbuEmgeFinal4.backgroundColor = UIColor.clear
            self.viewbuEmgeFinal5.backgroundColor = UIColor.clear
            ratingSelectFinal = 2
            return
        case 3:
            self.viewbuEmgeFinal1.backgroundColor = UIColor.clear
            self.viewbuEmgeFinal2.backgroundColor = UIColor.clear
            self.viewbuEmgeFinal3.backgroundColor = #colorLiteral(red: 0.8235294118, green: 0.6941176471, blue: 0.5333333333, alpha: 0.24)
            self.viewbuEmgeFinal4.backgroundColor = UIColor.clear
            self.viewbuEmgeFinal5.backgroundColor = UIColor.clear
            ratingSelectFinal = 3
            return
        case 4:
            
            self.viewbuEmgeFinal1.backgroundColor = UIColor.clear
            self.viewbuEmgeFinal2.backgroundColor = UIColor.clear
            self.viewbuEmgeFinal3.backgroundColor = UIColor.clear
            self.viewbuEmgeFinal4.backgroundColor = #colorLiteral(red: 0.8235294118, green: 0.6941176471, blue: 0.5333333333, alpha: 0.24)
            self.viewbuEmgeFinal5.backgroundColor = UIColor.clear
            ratingSelectFinal = 4
            return
        case 5:
            self.viewbuEmgeFinal1.backgroundColor = UIColor.clear
            self.viewbuEmgeFinal2.backgroundColor = UIColor.clear
            self.viewbuEmgeFinal3.backgroundColor = UIColor.clear
            self.viewbuEmgeFinal4.backgroundColor = UIColor.clear
            self.viewbuEmgeFinal5.backgroundColor = #colorLiteral(red: 0.8235294118, green: 0.6941176471, blue: 0.5333333333, alpha: 0.24)
            ///
          ratingSelectFinal = 5
            ///
            return
        default:
            return
        }
    }
    
    
    func changelanguageSDK(languageSDK : String){
        
        if languageSDK == "en" {
            laTietle.text = "Half M Rewards"
            laPoints.text = "POINTS"
            laYouSaved.text = "YOU SAVED"
            laWallet.text = "Wallet"
            laRewards.text = "Rewards"
            laTryAgin.text = "TRY ANOTHER TIME" // Get reward to fill your wallet
            laNoRewards.text = "NO REWARDS YET!" //  WALLET EMPTY
            laHowWasYourExperience.text = "How was your experience?"
            buSend.setTitle("SUBMIT", for: .normal)
            buSkip.setTitle("SKIP", for: .normal)
            
        }else {
            // ar
            laTietle.text = "Half M Rewards"
            laPoints.text = "نقطة"
            laYouSaved.text = "وفّرت"
            laWallet.text = "المحفظة"
            laRewards.text = "المكافآت"
            laTryAgin.text = "حاول مرة أخرى" // Get reward to fill your wallet
            laNoRewards.text = "لا توجد مكافآت!" //  WALLET EMPTY
            laHowWasYourExperience.text = "كيف كانت تجربتك؟"
            buSend.setTitle("إرسال", for: .normal)
            buSkip.setTitle("تجاوز", for: .normal)
        }
        
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setSetting()
        self.languageSDK = "en"
        changelanguageSDK(languageSDK: self.languageSDK)
        post_SDKBounatAuthFirst(idMerchant: "1000", secret: "7102273b683c8e7d", phoneNumber: "0512345678", onSuccess: { (dataNew) in
            self.customerAuth1 = dataNew
            self.showData()
            self.viewEmptyALL.isHidden = true
            self.get_loyalMerchant(idMerchant: self.customerAuth1.data.idMerchant?.description ?? "" , sdKTokenNew: self.customerAuth1.data.sdkToken.description)
            self.get_couponsList(sdKTokenNew: self.customerAuth1.data.sdkToken.description)
        })
        
    }
    
    
 // test 

    func showData() {
     
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = true
        
        buEmge1.tag = 1
        buEmge2.tag = 2
        buEmge3.tag = 3
        buEmge4.tag = 4
        buEmge5.tag = 5
        
        buEmgeFinal1.tag = 1
        buEmgeFinal2.tag = 2
        buEmgeFinal3.tag = 3
        buEmgeFinal4.tag = 4
        buEmgeFinal5.tag = 5
        
        self.viewbuEmge5.backgroundColor = UIColor.clear
        collectionViewWallet.isHidden = true
        collectionViewRewards.isHidden =  false
        collectionViewRewards.reloadData()
        viewLineRewards.backgroundColor = .black
        viewLineWallet.backgroundColor  = .lightGray
        laWallet.textColor   = .lightGray
        laRewards.textColor  = .black
        viewFeedBackFinal.isHidden = true
        txtView.delegate = self
        txtView.textColor = UIColor.lightGray
        if self.languageSDK == "ar" {
            self.txtView.text = "اكتب رايك"
        }else {
            self.txtView.text = "Describe your feadback"
        }
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if txtView.textColor == UIColor.lightGray {
            txtView.text = ""
            txtView.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if txtView.text == "" {
            if self.languageSDK == "ar" {
                self.txtView.text = "اكتب رايك"
            }else {
                self.txtView.text = "Describe your feadback"
            }
            txtView.textColor = UIColor.lightGray
        }
    }
    
//    func textViewDidChange(_ textView: UITextView) {
//        if txtView.text == "" {
//            txtView.text =  "Describe your feadback"// KOLocalizedString("Keyshareyourexperiencebriefly")
//            txtView.textColor = UIColor.lightGray
//        }
//    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = textView.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let changedText = currentText.replacingCharacters(in: stringRange, with: text)
        return changedText.count <= 140
    }
    

    func setSetting(){
        
        collectionViewRewards.delegate = self
        collectionViewRewards.dataSource = self
        let nibName = UINib(nibName: "CVCRewardSDKBonat", bundle:nil)
        
        collectionViewRewards.register(nibName, forCellWithReuseIdentifier: "CVCRewardSDKBonat")
        collectionViewWallet.delegate = self
        collectionViewWallet.dataSource = self
        let nibName1 = UINib(nibName: "CVCRewardSDKBonat", bundle:nil)
        collectionViewWallet.register(nibName1, forCellWithReuseIdentifier: "CVCRewardSDKBonat")
    }
 
    @objc func buCodeCuponPressed(_ sender : UIButton){
        print(sender.titleLabel?.text ?? "")
        UIPasteboard.general.string = sender.titleLabel?.text
        
//        var indexSelect : IndexPath
//        indexSelect = IndexPath.init(row: sender.tag, section: 0)
//        collectionViewWallet.reloadItems(at: [indexSelect])
        
        
        if self.coupon?.data?.coupons?.count != 0 {
            for pro in 1...((self.coupon?.data?.coupons?.count)!)
            {
                self.coupon?.data?.coupons?[pro - 1].isSelect = false
            }
            self.coupon?.data?.coupons?[sender.tag].isSelect = true
            self.collectionViewWallet.reloadData()
        }else {
            
        }
        
        
//
    }
    @objc func buCollectPreesed(_ sender : UIButton){
        
        let curObject = self.loyalMerchant?.data.rewardMenu[sender.tag]
        if curObject?.isLocked == true {
        }else {
            self.post_pointRedemption(idCampaign : curObject?.idCampaign ?? "" , sdKTokenNew : self.customerAuth1.data.sdkToken.description )
        }
        
        
        
    }
      
}


extension VCRewardsSDKBonat :  UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if collectionView != collectionViewWallet {
//
//        }else {
//
//            if self.coupon?.data?.coupons?.count != 0 {
//                for pro in 1...((self.coupon?.data?.coupons?.count)!)
//                {
//                    self.coupon?.data?.coupons?[pro - 1].isSelect = false
//                }
//                self.coupon?.data?.coupons?[indexPath.item].isSelect = true
//                self.collectionViewWallet.reloadData()
//            }else {
//
//            }
//
//        }
      
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView != collectionViewWallet {
            
            return self.loyalMerchant?.data.rewardMenu.count ?? 0
        }else {
            return self.coupon?.data?.coupons?.count ?? 0
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCRewardSDKBonat", for: indexPath) as! CVCRewardSDKBonat
       if collectionView != collectionViewWallet {
            
            let curObject = self.loyalMerchant?.data.rewardMenu[indexPath.row]
            cell.uiiimgeCopun.loadImage(imageUrl: curObject?.imageURL ?? "")
            cell.laName.text = curObject?.title
            if languageSDK == "en" {
                cell.buPoint.setTitle((curObject?.pointPrice.description ?? "") + " POINT", for: .normal)
            }else {
                // ar
                cell.buPoint.setTitle((curObject?.pointPrice.description ?? "") + " نقطة", for: .normal)
            }
//            cell.buPoint.setTitle((curObject?.pointPrice.description ?? "") + " POINT", for: .normal)
            cell.buCollect.addTarget(self, action: #selector(self.buCollectPreesed(_:)), for: .touchUpInside)
            cell.buCollect.tag = indexPath.row
            
            if curObject?.isLocked != true {
                cell.stackDate.isHidden = true
                cell.viewPoint.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.662745098, blue: 0.231372549, alpha: 1)
                cell.buPoint.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.662745098, blue: 0.231372549, alpha: 1)
                cell.viewCollect.backgroundColor = #colorLiteral(red: 0.003166638315, green: 0.003166806418, blue: 0.003166715847, alpha: 1)
                cell.buCollect.backgroundColor = #colorLiteral(red: 0.003166638315, green: 0.003166806418, blue: 0.003166715847, alpha: 1)
                cell.viewCollect.layer.borderWidth = 0.0
                cell.viewCollect.layer.borderColor = #colorLiteral(red: 0.8392156863, green: 0.8392156863, blue: 0.8392156863, alpha: 0)
                cell.uiimgeLocked.isHidden = true
                cell.buCollect.setTitleColor(.white, for: .normal)
                cell.buCollect.isEnabled = true
                cell.viewCollect.isHidden = false
                cell.viewCodeCupon.isHidden = true
                cell.viewPoint.isHidden = false
                
            }else {
                cell.stackDate.isHidden = true
                cell.viewPoint.backgroundColor = #colorLiteral(red: 0.9058823529, green: 0.4078431373, blue: 0.3843137255, alpha: 1)
                cell.buPoint.backgroundColor = #colorLiteral(red: 0.9058823529, green: 0.4078431373, blue: 0.3843137255, alpha: 1)
                cell.viewCollect.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.9803921569, alpha: 1)
                cell.buCollect.backgroundColor  = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.9803921569, alpha: 1)
                cell.viewCollect.layer.borderWidth = 1.0
                cell.viewCollect.layer.borderColor = #colorLiteral(red: 0.8392156863, green: 0.8392156863, blue: 0.8392156863, alpha: 1)
                cell.uiimgeLocked.isHidden = false
                cell.buCollect.setTitleColor(#colorLiteral(red: 0.8392156863, green: 0.8392156863, blue: 0.8392156863, alpha: 1), for: .normal)
                cell.buCollect.isEnabled = false
                cell.viewCollect.isHidden = false
                cell.viewCodeCupon.isHidden = true
                cell.viewPoint.isHidden = false
                
            }
            
        }else {
            let curObject = self.coupon?.data?.coupons?[indexPath.row]
            
            cell.uiiimgeCopun.loadImage(imageUrl: curObject?.imageURL?.first ?? "")
            cell.laName.text = curObject?.title
            let expirationDate1 = curObject?.expirationDate
            cell.laExpiredOn.text =   convertDateFormatterSDKBonat(date: expirationDate1 ?? "")
            cell.buCodeCupon.setTitle((curObject?.idCoupon?.description ?? "") , for: .normal)
            
            if curObject?.isSelect == true {
                if languageSDK == "en" {
                    cell.buCodeCupon.setTitle("copied!", for: .normal)
                }else {
                    cell.buCodeCupon.setTitle("تم النسخ", for: .normal)
                }
            }else {
                
            }
            // wallet
            cell.stackDate.isHidden = false
            cell.uiimgeLocked.isHidden = true
            
            cell.viewPoint.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.662745098, blue: 0.231372549, alpha: 1)
            cell.buPoint.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.662745098, blue: 0.231372549, alpha: 1)
            cell.viewCollect.backgroundColor = #colorLiteral(red: 0.003166638315, green: 0.003166806418, blue: 0.003166715847, alpha: 1)
            cell.buCollect.backgroundColor = #colorLiteral(red: 0.003166638315, green: 0.003166806418, blue: 0.003166715847, alpha: 1)
            cell.viewCollect.layer.borderWidth = 0.0
            cell.viewCollect.layer.borderColor = #colorLiteral(red: 0.8392156863, green: 0.8392156863, blue: 0.8392156863, alpha: 0)
            cell.buCollect.setTitleColor(.white, for: .normal)
            cell.buCollect.isEnabled = true
            
            cell.viewCollect.isHidden = true
            cell.viewCodeCupon.isHidden = false
            
            cell.viewPoint.isHidden = true
       }
        cell.buCodeCupon.addTarget(self, action: #selector(self.buCodeCuponPressed(_:)), for: .touchUpInside)
        cell.buCodeCupon.tag = indexPath.row
        
        
    
        if languageSDK == "en" {
            cell.la0ExpiredOn.text = "Expires on : "
            cell.buCollect.setTitle("Collect", for: .normal)
        }else {
            // ar
            cell.la0ExpiredOn.text = "تنتهي في : "
            cell.buCollect.setTitle("إستبدال", for: .normal)

        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         let vv =  collectionView.frame.width  - 0.0
        return CGSize(width: vv / 1.0 , height: 175.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    

    }
    
extension VCRewardsSDKBonat {
    func get_loyalMerchant(idMerchant : String , sdKTokenNew : String) {
    APIManagerSDKBonat.shared.get_loyalMerchant(idMerchant : idMerchant , sdKTokenNew: sdKTokenNew, onSuccess : {
            (dataAll, msg) in
                if msg == "done" {

                    self.loyalMerchant = dataAll
                    DispatchQueue.main.async {
                        self.laPointUser.text = dataAll.data.customerPoint?.description
                        self.laValueSaved.text = dataAll.data.rewardsRedeemed?.description

                        if dataAll.data.allowFeedback?.description != "" {
                            if dataAll.data.allowFeedback?.description == "0" {

                                self.stackAll.arrangedSubviews[1].isHidden = true

                            }else {
                                self.stackAll.arrangedSubviews[1].isHidden = false

                            }
                        }

                        if self.loyalMerchant?.data.rewardMenu.count == 0 {
                            self.viewEmpty.isHidden = false
                            self.imgeRewWardsEmapty.isHidden = false
                            self.imgeWalletEmapty.isHidden = true
                        }else {
                            self.viewEmpty.isHidden = true
                            self.imgeRewWardsEmapty.isHidden = true
                            self.imgeWalletEmapty.isHidden = true
                        }


                        //    self.collectionViewWallet.reloadData()
                        self.collectionViewRewards.reloadData()
                    }



                }else {
                    print ( "check api url and response form server")
                }
            }, messageReturn: { (msg) in
                print (msg)
            }, onFailure: { (msg) in
                print (msg)
            })



    }
    
    
    
   
    
    func get_couponsList( sdKTokenNew : String) {
            APIManagerSDKBonat.shared.get_couponsList(sdKTokenNew : sdKTokenNew , onSuccess : {
                (dataAll, msg) in
                    if msg == "done" {
                        self.coupon = dataAll
                       
                                       DispatchQueue.main.async {
                       
                       //                    if  self.coupon?.data?.coupons?.count  == 0 {
                       //                        self.viewEmpty.isHidden = false
                       //                        self.imgeRewWardsEmapty.isHidden = true
                       //                        self.imgeWalletEmapty.isHidden = false
                       //                    }else {
                       //                        self.viewEmpty.isHidden = true
                       //                        self.imgeRewWardsEmapty.isHidden = true
                       //                        self.imgeWalletEmapty.isHidden = true
                       //                    }
                       
                                       self.collectionViewWallet.reloadData()
                                      // self.collectionViewRewards.reloadData()
                                       }


                    }else {
                        print ( "check api url and response form server")
                    }
                }, messageReturn: { (msg) in
                    print (msg)
                }, onFailure: { (msg) in
                    print (msg)
                })

//
    }
    
    
    
    func post_messageFeedback(idMerchant : String ,message : String , rate : String ,sdKTokenNew : String){
        
        APIManagerSDKBonat.shared.post_messageFeedback(idMerchant : idMerchant ,message : message , rate : rate ,sdKTokenNew : sdKTokenNew , onSuccess : {
            (dataAll, msg) in
                if msg == "done" {
                    DispatchQueue.main.async {
                    if dataAll.code == 0 {
                        self.viewFeedBackFinal.isHidden = true
                        if self.languageSDK == "ar" {
                            self.txtView.text = "اكتب رايك"
                        }else {
                            self.txtView.text = "Describe your feadback"
                        }
                        self.txtView.textColor = UIColor.lightGray
                        self.stackAll.arrangedSubviews[1].isHidden = true
                    }else {
                        self.viewFeedBackFinal.isHidden = false
                        if self.languageSDK == "ar" {
                            self.txtView.text = "اكتب رايك"
                        }else {
                            self.txtView.text = "Describe your feadback"
                        }
                        self.txtView.textColor = UIColor.lightGray
                        self.stackAll.arrangedSubviews[1].isHidden = false

                    }
                    }


                }else {
                    print ( "check api url and response form server")
                }
            }, messageReturn: { (msg) in
                print (msg)
            }, onFailure: { (msg) in
                print (msg)
            })
        
    }
    
    

func post_pointRedemption(idCampaign : String , sdKTokenNew : String ) {
     APIManagerSDKBonat.shared.post_pointRedemption(idCampaign : idCampaign ,sdKTokenNew : sdKTokenNew  , onSuccess : {
        (dataAll, msg) in
            if msg == "done" {
      
                DispatchQueue.main.async {
                    if dataAll.code == 0 {
                        self.get_couponsList(sdKTokenNew: self.customerAuth1.data.sdkToken.description)
                        self.get_loyalMerchant(idMerchant: self.customerAuth1.data.idMerchant?.description ?? "" , sdKTokenNew: self.customerAuth1.data.sdkToken.description)

                        self.collectionViewWallet.isHidden = false
                        self.collectionViewRewards.isHidden = true
                        self.collectionViewWallet.reloadData()
                        
                        self.viewLineRewards.backgroundColor  = .lightGray
                        self.viewLineWallet.backgroundColor = .black
                        
                        self.laWallet.textColor  = .black
                        self.laRewards.textColor = .lightGray
                        
                    }else {
                        
                    }
                }


            }else {
                print ( "check api url and response form server")
            }
        }, messageReturn: { (msg) in
            print (msg)
        }, onFailure: { (msg) in
            print (msg)
        })
    
    
}


}
