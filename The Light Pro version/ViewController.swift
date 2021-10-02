//
//  ViewController.swift
//  The Light Pro version
//
//  Created by Андрей on 03.10.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var isLightOn: Bool = true
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .black
        
    }
    
    
    @IBAction func buttonPressed1(_ sender: Any) {
        let device = AVCaptureDevice.default(for: AVMediaType.video)
        if ((device?.hasTorch) != nil) {
            do {
                try device?.lockForConfiguration()
                if (device?.torchMode == AVCaptureDevice.TorchMode.on) {
                    device?.torchMode = AVCaptureDevice.TorchMode.off
                } else {
                    do {
                        try device?.setTorchModeOn(level: 1.0)
                    } catch {
                        print(error)
                    }
                }
                device?.unlockForConfiguration()
            } catch {
                print(error)
            }
        }
    }
    
    @IBAction func buttonPressed2(_ sender: Any) {
        isLightOn.toggle()
        updateColor()
        
    }
    
    func updateColor() {
        if isLightOn == true{
            view.backgroundColor = .white
        }else{
            view.backgroundColor = .black
        }
    }
}

