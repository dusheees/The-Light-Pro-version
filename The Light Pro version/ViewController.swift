//
//  ViewController.swift
//  The Light Pro version
//
//  Created by Андрей on 03.10.2021.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    /*override var shouldAutorotate: Bool
    {
        return false
    }*/

    // MARK: - Properties
    var isLightOn: Int = 0
    var levelLight: Int = 1
    override var prefersStatusBarHidden: Bool {
        return true
    }

    // MARK: - UIProperties
    @IBOutlet weak var buttonTorch: UIButton!
    @IBOutlet weak var buttonScreen: UIButton!
        
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .black
        
    }
    
    func updateColor() {
        switch isLightOn {
        case 1:
            view.backgroundColor = .red
            buttonScreen.setTitle("red", for: .normal)
        case 2:
            view.backgroundColor = .yellow
            buttonScreen.setTitle("yellow", for: .normal)
        case 3:
            view.backgroundColor = .green
            buttonScreen.setTitle("green", for: .normal)
        default:
            view.backgroundColor = .black
            buttonScreen.setTitle("screen", for: .normal)
        }
    }
    
    // MARK: - Actions
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
        case 2: isLightOn = 3
        case 3: isLightOn = 0
        default: isLightOn = 1
        }
//        isLightOn = (isLightOn + 1) % 3
        updateColor()
        
    }
    
}


