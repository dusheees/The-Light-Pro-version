//
//  ViewController.swift
//  The Light Pro version
//
//  Created by Андрей on 03.10.2021.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    override var shouldAutorotate: Bool
    {
        return false
    }

    var isLightOn: Int = 0
    var levelLight: Int = 1
    
    @IBOutlet weak var buttonTorch: UIButton!
    @IBOutlet weak var buttonScreen: UIButton!
    
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
                device?.torchMode = AVCaptureDevice.TorchMode.on
                switch levelLight {
                case 1:
                    try device?.setTorchModeOn(level: 0.25)
                    buttonTorch.setTitle("0.25", for: .normal)
                    levelLight = 2
                case 2:
                    try device?.setTorchModeOn(level: 0.5)
                    buttonTorch.setTitle("0.5", for: .normal)
                    levelLight = 3
                case 3:
                    try device?.setTorchModeOn(level: 0.75)
                    buttonTorch.setTitle("0.75", for: .normal)
                    levelLight = 4
                case 4:
                    try device?.setTorchModeOn(level: 1.0)
                    buttonTorch.setTitle("1.0", for: .normal)
                    levelLight = 0
                default:
                    device?.torchMode = AVCaptureDevice.TorchMode.off
                    buttonTorch.setTitle("torch", for: .normal)
                    levelLight = 1

                device?.unlockForConfiguration()
                }
            } catch {
                print(error)
            }
        }
    }
    
    
    @IBAction func buttonPressed2(_ sender: Any) {
        switch isLightOn {
        case 1: isLightOn = 2
        case 2: isLightOn = 0
        default: isLightOn = 1
        }
        updateColor()
        
    }
    
    func updateColor() {
        switch isLightOn {
        case 1:
            view.backgroundColor = .lightGray
            buttonScreen.setTitle("light gray", for: .normal)
        case 2:
            view.backgroundColor = .white
            buttonScreen.setTitle("white", for: .normal)
        default:
            view.backgroundColor = .black
            buttonScreen.setTitle("screen", for: .normal)
        }
    }
    
}

