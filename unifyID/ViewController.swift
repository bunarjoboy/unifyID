//
//  ViewController.swift
//  unifyID
//
//  Created by Kevin Bunarjo on 10/6/17.
//  Copyright © 2017 unify. All rights reserved.
//

import UIKit
import AVFoundation
import SwiftKeychainWrapper

class ViewController: UIViewController {

    let numberOfPicturesTaken:Int = 10
    let photoDelay:Double = 0.5
    let buttonSize:CGFloat = 100
    
    let camera = Camera()
    
    lazy var button:UIButton = {
        let but = UIButton(type: .system)
        but.addTarget(self, action: #selector(ViewController.takePicture), for: .touchUpInside)
        but.backgroundColor = .lightGray
        but.layer.borderColor = UIColor.black.cgColor
        but.layer.borderWidth = 2
        but.layer.masksToBounds = true
        but.translatesAutoresizingMaskIntoConstraints = false
        return but
    }()
    
    let capturePreviewView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func takePicture() {
        var count = 0
        let timeNow = DispatchTime.now()
        while count < numberOfPicturesTaken {
            //delay
            let when = timeNow + (photoDelay * Double(count))
            let copyOfCount = count // so we can order the photo names
            DispatchQueue.main.asyncAfter(deadline: when) {
                self.camera.captureImage {(image, error) in
                    guard let image = image else {
                        print(error ?? "Image capture error")
                        return
                    }
                    
                    // save
                    let didSave = KeychainWrapper.standard.set(image, forKey: "image\(copyOfCount)")
                    print("Was saving successful? \(didSave)")
                }
                
            }
            count += 1
        }
    }
    
    func setupSubviews() {
        self.view.addSubview(capturePreviewView)
        self.view.addSubview(button)
        
        capturePreviewView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        capturePreviewView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        capturePreviewView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        capturePreviewView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        button.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        button.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        button.layer.cornerRadius = buttonSize / 2
        setupSubviews()
        
        func configureCameraController() {
            camera.prepareCamera {(error) in
                if let error = error {
                    print(error)
                }
                
                try? self.camera.displayPreview(on: self.capturePreviewView)
            }
        }
        
        configureCameraController()
    }

}

