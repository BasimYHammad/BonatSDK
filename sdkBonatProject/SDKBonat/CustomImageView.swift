

import UIKit

var imageCache = [String: UIImage]()

class CustomImageViewSDKBonat: UIImageView {
    
    var lastURLUsedToLoadImage: String?
    
    
    func loadImage(imageUrl: String, complete : @escaping () -> () = {}) {
        lastURLUsedToLoadImage = imageUrl
        
//        self.image = nil
        
        if let cachedImage = imageCache[imageUrl] {
            self.image = cachedImage
            complete()
            return
        }
        
        guard let url = URL(string: imageUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                print("Failed to fetch post image:", err)
                return
            }
            
            if url.absoluteString != self.lastURLUsedToLoadImage {
                return
            }
            
            guard let imageData = data else { return }
            
            let photoImage = UIImage(data: imageData)
            
            imageCache[url.absoluteString] = photoImage
            
            DispatchQueue.main.async {
                self.image = photoImage
                complete()
            }
            
            }.resume()
    }
}


