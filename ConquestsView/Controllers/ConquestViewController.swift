//
//  ViewController.swift
//  ConquestsView
//
//  Created by Rodrigo Conte on 02/09/20.
//  Copyright © 2020 Rodrigo Conte. All rights reserved.
//

import UIKit

protocol SuperToContainer: AnyObject {
    func updateContainer(id: Int)
}

class ConquestViewController: UIViewController, ContainerToSuper {
    
    let CONST_ID_POSTAL = 0
    let CONST_ID_SOUVENIR = 1
    let CONST_ID_BADGE = 2
    
    weak var delegate: SuperToContainer?

    @IBOutlet weak var postalOutlet: UIButton!
    @IBOutlet weak var souvenirOutlet: UIButton!
    @IBOutlet weak var badgeOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSelectedButton(btn: postalOutlet)
        setUnselectedButton(btn: souvenirOutlet)
        setUnselectedButton(btn: badgeOutlet)
        // Do any additional setup after loading the view.
        
        NotificationCenter.default.post(name: Notification.Name.conquestViewDidLoad, object: nil)
        
    }

    private func enablePostalBtn() {
        setSelectedButton(btn: postalOutlet)
        setUnselectedButton(btn: souvenirOutlet)
        setUnselectedButton(btn: badgeOutlet)
    }
    
    @IBAction func postalAction(_ sender: Any) {
        enablePostalBtn()
        delegate?.updateContainer(id: CONST_ID_POSTAL)
    }
    
    private func enableSouvenirBtn() {
        setSelectedButton(btn: souvenirOutlet)
        setUnselectedButton(btn: postalOutlet)
        setUnselectedButton(btn: badgeOutlet)
    }
    
    @IBAction func souvenirAction(_ sender: Any) {
        enableSouvenirBtn()
        delegate?.updateContainer(id: CONST_ID_SOUVENIR)
    }
    
    private func enableBadgeBtn() {
        setSelectedButton(btn: badgeOutlet)
        setUnselectedButton(btn: souvenirOutlet)
        setUnselectedButton(btn: postalOutlet)
    }
    
    @IBAction func badgeAction(_ sender: Any) {
        enableBadgeBtn()
        //superToContainer?.updateContainer(id: CONST_ID_BADGE)
    }
    
    func setSelectedButton(btn: UIButton) {
        btn.setTitleColor(#colorLiteral(red: 0.9844431281, green: 0.9844661355, blue: 0.9844536185, alpha: 1), for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.3111339808, green: 0.1553293169, blue: 0.7954767346, alpha: 1)
        btn.layer.borderWidth = 0
    }
    
    func setUnselectedButton(btn: UIButton) {
        btn.setTitleColor(#colorLiteral(red: 0.3111339808, green: 0.1553293169, blue: 0.7954767346, alpha: 1), for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.9844431281, green: 0.9844661355, blue: 0.9844536185, alpha: 1)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = #colorLiteral(red: 0.3111339808, green: 0.1553293169, blue: 0.7954767346, alpha: 1)
    }
    
    func updateView(id: Int) {
        if id == CONST_ID_POSTAL {
            enablePostalBtn()
        } else if id == CONST_ID_SOUVENIR {
            enableSouvenirBtn()
        } else if id == CONST_ID_BADGE {
            enableBadgeBtn()
        } else {
            return
        }
    }
    
}

extension Notification.Name {
    static let conquestViewDidLoad = Notification.Name("conquestViewDidLoad")
}
