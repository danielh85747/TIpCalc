//
//  ViewController.swift
//  TIpCalc
//
//  Created by Daniel Stephenson on 2017-04-24.
//  Copyright © 2017 Daniel Stephenson. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, UITextFieldDelegate, GADBannerViewDelegate {
    
    @IBOutlet var totalPrice: UITextField!
    
    @IBOutlet var tipPercentage: UITextField!
    
    @IBOutlet var tipDisplay: UILabel!
    
    @IBAction func tipPush(_ sender: Any) {
        
        if (adInterstitial?.isReady)! {
            adInterstitial?.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready")
        }
        
        tipDisplay.text = "Pay $\(Double(totalPrice.text!)! * Double(tipPercentage.text!)! / 100) extra!"
        
    }
    
    @IBOutlet var adBanner: GADBannerView!
    
    var adInterstitial: GADInterstitial?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        initializeBanner()
        
        createAndLoadInterstitial()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func initializeBanner() {
        
        print("Google Mobile Ads SDK version: \(GADRequest.sdkVersion())")
        adBanner?.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        adBanner?.isHidden = false
        adBanner?.rootViewController = self
        
        let request = GADRequest()
        //request.testDevices = [kGADSimulatorID, "e683584f2085bb1bd316175befd3ef8b"]
        
        adBanner?.load(request)

        
        
    }
    
    func createAndLoadInterstitial() {
        adInterstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        let request = GADRequest()
        // Request test ads on devices you specify. Your test device ID is printed to the console when
        // an ad request is made.
        //request.testDevices = [kGADSimulatorID, "e683584f2085bb1bd316175befd3ef8b"]
        adInterstitial?.load(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }


}

