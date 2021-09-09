//
//  Model.swift
//  sdkProject
//
//  Created by Basim on 8/29/21.
//

import Foundation


class SDKBonatAuth: Codable {
    let code: Int
     let data: DataClassSDKBonat?
     let debugError, message: String

     init(code: Int, data: DataClassSDKBonat, debugError: String, message: String) {
         self.code = code
         self.data = data
         self.debugError = debugError
         self.message = message
     }
 }

 // MARK: - DataClass
 class DataClassSDKBonat: Codable {
     let idMerchant: Int
     let name, sdkToken: String

     enum CodingKeys: String, CodingKey {
         case idMerchant, name
         case sdkToken = "sdk_token"
     }

     init(idMerchant: Int, name: String, sdkToken: String) {
         self.idMerchant = idMerchant
         self.name = name
         self.sdkToken = sdkToken
     }
 }


public class CustomerAuthSDKBonat: Codable {
    let code: Int
    let data: CustomerDataSDKBonat
    let debugError, message: String

    init(code: Int, data: CustomerDataSDKBonat, debugError: String, message: String) {
        self.code = code
        self.data = data
        self.debugError = debugError
        self.message = message
    }
}

// MARK: - DataClass
class CustomerDataSDKBonat: Codable {
    let idCustomer: Int
    let name, phoneNumber: String?
    let idMerchant, customerPoint: Int?
    let startDate: String?
    let allowFeedback, blocked: Int?
    let sdkToken: String

    enum CodingKeys: String, CodingKey {
        case idCustomer, name, phoneNumber, idMerchant, customerPoint, startDate, allowFeedback, blocked
        case sdkToken = "sdk_token"
    }

    init(idCustomer: Int, name: String, phoneNumber: String, idMerchant: Int, customerPoint: Int, startDate: String, allowFeedback: Int, blocked: Int, sdkToken: String) {
        self.idCustomer = idCustomer
        self.name = name
        self.phoneNumber = phoneNumber
        self.idMerchant = idMerchant
        self.customerPoint = customerPoint
        self.startDate = startDate
        self.allowFeedback = allowFeedback
        self.blocked = blocked
        self.sdkToken = sdkToken
    }
}


///////


// MARK: - Welcome
class LoyalMerchantSDKBonat: Codable {
    let code: Int
    let data: MerchantSDKBonat
    let debugError: String

    init(code: Int, data: MerchantSDKBonat, debugError: String) {
        self.code = code
        self.data = data
        self.debugError = debugError
    }
}

// MARK: - DataClass
class MerchantSDKBonat: Codable {
    let feedbackReasons: [FeedbackReasonSDKBonat]
    let idMerchant, customerPoint, allowFeedback, idLoyaltyType: Int?
    let totalVisits: String?
    let rewardsRedeemed, saved: Int?
    let totalPayments: String?
    let hasPickup: Int?
    let lastVisit: String?
    let baseVisit, punches, onePointTH, twoPointsTH: Int?
    let threePointsTH: Int?
    let merchantImageURL: String?
    let merchantCoverImageURL: String?
    let dataDescription, name, scale: String?
    let rewardMenu: [RewardMenuSDKBonat?]
    let reward: RewardSDKBonat?

    enum CodingKeys: String, CodingKey {
        case feedbackReasons, idMerchant, customerPoint, allowFeedback, idLoyaltyType, totalVisits, rewardsRedeemed, saved, totalPayments, hasPickup, lastVisit, baseVisit, punches, onePointTH, twoPointsTH
        case threePointsTH = "ThreePointsTH"
        case merchantImageURL = "merchantImageUrl"
        case merchantCoverImageURL = "merchantCoverImageUrl"
        case dataDescription = "description"
        case name, scale
        case rewardMenu = "RewardMenu"
        case reward = "Reward"
    }

    init(feedbackReasons: [FeedbackReasonSDKBonat], idMerchant: Int, customerPoint: Int, allowFeedback: Int, idLoyaltyType: Int, totalVisits: String, rewardsRedeemed: Int, saved: Int, totalPayments: String, hasPickup: Int, lastVisit: String, baseVisit: Int, punches: Int, onePointTH: Int, twoPointsTH: Int, threePointsTH: Int, merchantImageURL: String, merchantCoverImageURL: String, dataDescription: String, name: String, scale: String, rewardMenu: [RewardMenuSDKBonat], reward: RewardSDKBonat) {
        self.feedbackReasons = feedbackReasons
        self.idMerchant = idMerchant
        self.customerPoint = customerPoint
        self.allowFeedback = allowFeedback
        self.idLoyaltyType = idLoyaltyType
        self.totalVisits = totalVisits
        self.rewardsRedeemed = rewardsRedeemed
        self.saved = saved
        self.totalPayments = totalPayments
        self.hasPickup = hasPickup
        self.lastVisit = lastVisit
        self.baseVisit = baseVisit
        self.punches = punches
        self.onePointTH = onePointTH
        self.twoPointsTH = twoPointsTH
        self.threePointsTH = threePointsTH
        self.merchantImageURL = merchantImageURL
        self.merchantCoverImageURL = merchantCoverImageURL
        self.dataDescription = dataDescription
        self.name = name
        self.scale = scale
        self.rewardMenu = rewardMenu
        self.reward = reward
    }
}

// MARK: - FeedbackReason
class FeedbackReasonSDKBonat: Codable {
    let idfeedBackReasons: Int
    let feedBackReasonsTitle: String

    enum CodingKeys: String, CodingKey {
        case idfeedBackReasons = "idfeedBack_reasons"
        case feedBackReasonsTitle = "feedBack_reasons_title"
    }

    init(idfeedBackReasons: Int, feedBackReasonsTitle: String) {
        self.idfeedBackReasons = idfeedBackReasons
        self.feedBackReasonsTitle = feedBackReasonsTitle
    }
}

// MARK: - Reward
class RewardSDKBonat: Codable {
    let hasReward: Bool
    let idCoupon: String

    init(hasReward: Bool, idCoupon: String) {
        self.hasReward = hasReward
        self.idCoupon = idCoupon
    }
}

// MARK: - RewardMenu
class RewardMenuSDKBonat: Codable {
    let idCampaign: String
    let isLocked: Bool
    let title: String
    let pointPrice: Int
    let imageURL: String
    let images: [String]
    let rewardMenuDescription: String

    enum CodingKeys: String, CodingKey {
        case idCampaign, isLocked, title, pointPrice
        case imageURL = "imageUrl"
        case images
        case rewardMenuDescription = "description"
    }

    init(idCampaign: String, isLocked: Bool, title: String, pointPrice: Int, imageURL: String, images: [String], rewardMenuDescription: String) {
        self.idCampaign = idCampaign
        self.isLocked = isLocked
        self.title = title
        self.pointPrice = pointPrice
        self.imageURL = imageURL
        self.images = images
        self.rewardMenuDescription = rewardMenuDescription
    }
}



// MARK: - Welcome
class CouponSDKBonat: Codable {
    let code: Int?
    let data: CouponDataInitSDKBonat?
    let debugError: String?

    init(code: Int?, data: CouponDataInitSDKBonat?, debugError: String?) {
        self.code = code
        self.data = data
        self.debugError = debugError
    }
}

// MARK: - DataClass
class CouponDataInitSDKBonat: Codable {
    let coupons: [CouponDataSDKBonat]?

    enum CodingKeys: String, CodingKey {
        case coupons = "Coupons"
    }

    init(coupons: [CouponDataSDKBonat]?) {
        self.coupons = coupons
    }
}

// MARK: - Coupon
class CouponDataSDKBonat: Codable {
    let idCoupon, title: String?
    let merchantImageURL: String?
    let name: String?
    let isUsed: Int?
    let prevIDCustomer: String?
    let expirationDate: String?
    let usedDate: String?
    let idCampaignType: Int?
    let campaignType: String?
    let icon: String?
    let iconPDF: String?
    let message, from, oldPrice: String?
    let newPrice: String?
    let discount: String?
    let couponDescription: String?
    let imageURL: [String]?
    
    var isSelect = false

    enum CodingKeys: String, CodingKey {
        case idCoupon, title
        case merchantImageURL = "merchantImageUrl"
        case name, isUsed
        case prevIDCustomer = "prevIdCustomer"
        case expirationDate, usedDate, idCampaignType, campaignType, icon
        case iconPDF = "icon_pdf"
        case message, from, oldPrice, newPrice, discount
        case couponDescription = "description"
        case imageURL = "imageUrl"
    }

    init(idCoupon: String?, title: String?, merchantImageURL: String?, name: String?, isUsed: Int?, prevIDCustomer: String?, expirationDate: String?, usedDate: String?, idCampaignType: Int?, campaignType: String?, icon: String?, iconPDF: String?, message: String?, from: String?, oldPrice: String?, newPrice: String?, discount: String?, couponDescription: String?, imageURL: [String]?) {
        self.idCoupon = idCoupon
        self.title = title
        self.merchantImageURL = merchantImageURL
        self.name = name
        self.isUsed = isUsed
        self.prevIDCustomer = prevIDCustomer
        self.expirationDate = expirationDate
        self.usedDate = usedDate
        self.idCampaignType = idCampaignType
        self.campaignType = campaignType
        self.icon = icon
        self.iconPDF = iconPDF
        self.message = message
        self.from = from
        self.oldPrice = oldPrice
        self.newPrice = newPrice
        self.discount = discount
        self.couponDescription = couponDescription
        self.imageURL = imageURL
    }
}



class FeedBackSDKBonat: Codable {
    let code: Int
    let debugError: String

    init(code: Int, debugError: String) {
        self.code = code
        self.debugError = debugError
    }
}


class PointRedemptionSDKBonat: Codable {
    let code: Int
    let data: PointRedemptionDataSDKBonat
    let debugError: String

    init(code: Int, data: PointRedemptionDataSDKBonat, debugError: String) {
        self.code = code
        self.data = data
        self.debugError = debugError
    }
}

// MARK: - DataClass
class PointRedemptionDataSDKBonat: Codable {
    let message, idCoupon: String

    init(message: String, idCoupon: String) {
        self.message = message
        self.idCoupon = idCoupon
    }
}
