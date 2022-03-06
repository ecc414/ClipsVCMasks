//
//  ViewController.swift
//  ClipsToBoundsVSMasksToBounds
//
//  Created by 엄철찬 on 2022/03/06.
//

import UIKit
import Foundation

class ClipsToBounds: UIViewController {
    
    let mainRectView : UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.frame = CGRect(x: 100, y: 300 , width: 200, height: 200)
        return view
    }()
    
    let subRectView : UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        return view
    }()
    
    lazy var controlSwitch: UISwitch = { // Create a Switch.
        let swicth: UISwitch = UISwitch()
        swicth.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height - 200) // Display the border of Swicth.
        swicth.tintColor = UIColor.orange // Set Switch to On.
        swicth.isOn = false // Set the event to be called when switching On / Off of Switch.
        swicth.addTarget(self, action: #selector(onClickSwitch(sender:)), for: UIControl.Event.valueChanged)
        return swicth
    }()
    
    let label : UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = " ClipsToBounds is false"
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(moveToClipsToBounds))
        
        title = "ClipsToBounds"
        
        view.addSubview(mainRectView)
        mainRectView.addSubview(subRectView)
        view.addSubview(controlSwitch)
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        mainRectView.bounds.origin = CGPoint(x: 50, y: 50)
        label.bottomAnchor.constraint(equalTo: controlSwitch.topAnchor, constant: -20).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func moveToClipsToBounds(){
        let VC = MasksToBounds()
        VC.view.backgroundColor = .systemBackground
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    @objc func onClickSwitch(sender: UISwitch) {
        if sender.isOn {
            mainRectView.clipsToBounds = true
            label.text = " ClipsToBounds is true"
        } else {
            mainRectView.clipsToBounds = false
            label.text = " ClipsToBounds is false"
        }
    }
}

