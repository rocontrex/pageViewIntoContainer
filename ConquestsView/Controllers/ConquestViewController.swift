//
//  ViewController.swift
//  ConquestsView
//
//  Created by Rodrigo Conte on 02/09/20.
//  Copyright © 2020 Rodrigo Conte. All rights reserved.
//

import UIKit

class ConquestViewController: UIViewController, ConteinerToSuper {

    @IBOutlet weak var postalOutlet: UIButton!
    @IBOutlet weak var souvenirOutlet: UIButton!
    @IBOutlet weak var badgeOutlet: UIButton!
    @IBOutlet var allButtons: [UIButton]!
    
    var conquestPageViewController: ConquestPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSelectedButton(postalOutlet)
    }
    
    @IBAction func didTouchSegmentButton(_ sender: UIButton) {
        let conquestsViewsControllers = conquestPageViewController.conquestsViewsControllers
        guard
            let indexOfSelectedButton = allButtons.firstIndex(of: sender),
            let viewControllerBeingDisplayed = conquestPageViewController.viewControllers?.first,
            let indexOfViewControllerBeingDisplayed = conquestsViewsControllers.index(of: viewControllerBeingDisplayed)
        else { return }
        setSelectedButton(sender)
        let viewControllerToDisplay = conquestsViewsControllers[indexOfSelectedButton]
        let direction: UIPageViewController.NavigationDirection = indexOfSelectedButton > indexOfViewControllerBeingDisplayed ? .forward : .reverse
        conquestPageViewController.setViewControllers([viewControllerToDisplay],
            direction: direction,
            animated: true,
            completion: nil
        )
    }
    
    private func unselectAllButtons() {
        for button in allButtons {
            setUnselectedButton(button)
        }
    }
    
    func setSelectedButton(_ button: UIButton) {
        unselectAllButtons()
        button.setTitleColor(#colorLiteral(red: 0.9844431281, green: 0.9844661355, blue: 0.9844536185, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.3111339808, green: 0.1553293169, blue: 0.7954767346, alpha: 1)
        button.layer.borderWidth = 0
    }
    
    func setUnselectedButton(_ button: UIButton) {
        button.setTitleColor(#colorLiteral(red: 0.3111339808, green: 0.1553293169, blue: 0.7954767346, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9844431281, green: 0.9844661355, blue: 0.9844536185, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.3111339808, green: 0.1553293169, blue: 0.7954767346, alpha: 1)
    }
    
    func changeButtonByID(_ id: Int) {
        var button: UIButton = allButtons[0]
        for btn in allButtons{
            if btn.tag == id {
                button = btn
            }
        }
        setSelectedButton(button)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "containerSegue" {
            conquestPageViewController = segue.destination as? ConquestPageViewController
            conquestPageViewController.conquestViewController = self
        }
    }
}
