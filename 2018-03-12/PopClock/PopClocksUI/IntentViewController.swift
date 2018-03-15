//
//  IntentViewController.swift
//  PopClocksUI
//
//  Created by Jason Liang on 3/12/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

import IntentsUI

// As an example, this extension's Info.plist has been configured to handle interactions for INSendMessageIntent.
// You will want to replace this or add other intents as appropriate.
// The intents whose interactions you wish to handle must be declared in the extension's Info.plist.

// You can test this example integration by saying things to Siri like:
// "Send a message using <myApp>"

import CoreImage


class IntentViewController: UIViewController, INUIHostedViewControlling {
    
    func storeTime() {
        UserDefaults.standard.setValue(Date(), forKey: "time")
    }
    
    func shouldCreateCode() -> Bool {
        if let time = UserDefaults.standard.value(forKey: "time") as? Date,
            Date().timeIntervalSince(time) < 10 {
            storeTime()
            return false
        }
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - INUIHostedViewControlling
    

    // Prepare your view controller for the interaction to handle.
    func configureView(for parameters: Set<INParameter>, of interaction: INInteraction, interactiveBehavior: INUIInteractiveBehavior, context: INUIHostedViewContext, completion: @escaping (Bool, Set<INParameter>, CGSize) -> Void) {
        // Do configuration here, including preparing views and calculating a desired size for presentation.
        
        if let qrResponse = interaction.intentResponse as? INGetVisualCodeIntentResponse,
            shouldCreateCode() {
            storeTime()
            let size = CGSize(width: self.view.bounds.width - 30, height: self.view.bounds.width - 30)
            let qrImage = createQRFromString("http://bunch.live", size:size)
            
            let templateImage = qrImage.withRenderingMode(.automatic)
            let imageView = UIImageView(image: templateImage)
            imageView.tintColor = UIColor.orange
            
            self.view.addSubview(imageView)
            completion(true, parameters, self.desiredSize)
            return
        }
        
        completion(false, parameters, CGSize.zero)
        
    }
    
    var desiredSize: CGSize {
        return CGSize(width: self.view.bounds.width, height: self.view.bounds.width)
//        return self.extensionContext!.hostedViewMaximumAllowedSize
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
