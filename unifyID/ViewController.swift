//
//  ViewController.swift
//  unifyID
//
//  Created by Kevin Bunarjo on 10/6/17.
//  Copyright © 2017 unify. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    lazy var button:UIButton = {
        let but = UIButton(type: .system)
        but.setTitle("Press Me!", for: .normal)
        but.addTarget(self, action: #selector(ViewController.takePicture), for: .touchUpInside)
        but.translatesAutoresizingMaskIntoConstraints = false
        return but
    }()
    
    let capturePreviewView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let camera = Camera()
    
    func takePicture() {
        
    }
    
    func setupSubviews() {
        self.view.addSubview(capturePreviewView)
        self.view.addSubview(button)
        
        capturePreviewView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        capturePreviewView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        capturePreviewView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        capturePreviewView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
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
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

