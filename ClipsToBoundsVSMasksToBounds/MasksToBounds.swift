//
//  ClipsToBounds.swift
//  ClipsToBoundsVSMasksToBounds
//
//  Created by 엄철찬 on 2022/03/06.
//

import Foundation
import UIKit

class MasksToBounds : UIViewController {
    
    let mainRectView : UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.frame = CGRect(x: 100, y: 300 , width: 200, height: 200)
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
        label.text = " MasksToBounds is false"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainRectView)
        view.addSubview(controlSwitch)
        view.addSubview(label)
        title = "MasksToBounds"
        mainRectView.layer.shadowOffset = .init(width: 10, height: 10)
        mainRectView.layer.shadowOpacity = 0.7
        
        
        label.translatesAutoresizingMaskIntoConstraints = false

        label.bottomAnchor.constraint(equalTo: controlSwitch.topAnchor, constant: -20).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func onClickSwitch(sender: UISwitch) {
        if sender.isOn {
            mainRectView.layer.masksToBounds = true
            label.text = " MasksToBounds is true"
        } else {
            mainRectView.layer.masksToBounds = false
            label.text = " MasksToBounds is false"
        }
    }
    

}
