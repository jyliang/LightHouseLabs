//
//  IntentViewController.swift
//  EpicAppSiriExtensionUI
//
//  Created by Jason Liang on 3/13/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

import IntentsUI

// As an example, this extension's Info.plist has been configured to handle interactions for INSendMessageIntent.
// You will want to replace this or add other intents as appropriate.
// The intents whose interactions you wish to handle must be declared in the extension's Info.plist.

// You can test this example integration by saying things to Siri like:
// "Send a message using <myApp>"

class IntentViewController: UIViewController, INUIHostedViewControlling {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - INUIHostedViewControlling
    
    // Prepare your view controller for the interaction to handle.
    func configureView(for parameters: Set<INParameter>, of interaction: INInteraction, interactiveBehavior: INUIInteractiveBehavior, context: INUIHostedViewContext, completion: @escaping (Bool, Set<INParameter>, CGSize) -> Void) {
        
        if let result = interaction.intent as? INGetVisualCodeIntent {
            let urlString = "http://bunch.live"
          let dim = self.extensionContext?.hostedViewMaximumAllowedSize.width ?? 300
            let image = createQRFromString(urlString, size: CGSize(width: dim, height: dim))
            self.view.addSubview(UIImageView(image: image))
            
            completion(true, parameters, self.desiredSize)
            return
        }
        // Do configuration here, including preparing views and calculating a desired size for presentation.
        completion(false, parameters, CGSize.zero)
    }
    
    var desiredSize: CGSize {
        let dim = self.extensionContext?.hostedViewMaximumAllowedSize.width ?? 300
        return CGSize(width: dim, height: dim)
    }
    
    func createQRFromString(_ str: String, size: CGSize) -> UIImage {
        let stringData = str.data(using: .utf8)
        
        let qrFilter = CIFilter(name: "CIQRCodeGenerator")!
        
        qrFilter.setValue(stringData, forKey: "inputMessage")
        qrFilter.setValue("H", forKey: "inputCorrectionLevel")
        
        let colorFilter = CIFilter(name: "CIFalseColor")!
        colorFilter.setValue(CIColor(color: UIColor.red), forKey: "inputColor0")
        colorFilter.setValue(CIColor(color: UIColor.white), forKey: "inputColor1")
        colorFilter.setValue(qrFilter.outputImage!, forKey: kCIInputImageKey)
        
        let minimalQRimage = colorFilter.outputImage!
        // NOTE that a QR code is always square, so minimalQRimage..width === .height
        let minimalSideLength = minimalQRimage.extent.width
        
        let smallestOutputExtent = (size.width < size.height) ? size.width : size.height
        let scaleFactor = smallestOutputExtent / minimalSideLength * UIScreen.main.scale
        let scaledImage = minimalQRimage.transformed(
            by: CGAffineTransform(scaleX: scaleFactor, y: scaleFactor))
        
        return UIImage(ciImage: scaledImage,
                       scale: UIScreen.main.scale,
                       orientation: .up)
    }
    
}
