//
//  ConquestPageViewController.swift
//  ConquestsView
//
//  Created by Rodrigo Conte on 02/09/20.
//  Copyright © 2020 Rodrigo Conte. All rights reserved.
//

import UIKit

class ConquestPageViewController: UIPageViewController {

    private(set) lazy var conquestsViewsControllers: [UIViewController] = {
        return [self.addNewViewController("Postals"),
                self.addNewViewController("Souvenirs"),
                self.addNewViewController("Badges")]
    }()
    
    private func addNewViewController(_ name: String) -> UIViewController {
        let viewController = UIStoryboard(name: "Main", bundle: nil) .
        instantiateViewController(withIdentifier: "\(name)ViewController")
        viewController.title = name
        return viewController
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        if let firstViewController = conquestsViewsControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
    }
    
    func updateContainer(id: Int) {
        setViewControllers([conquestsViewsControllers[id]], direction: .forward, animated: true, completion: nil)
    }
}

extension ConquestPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = conquestsViewsControllers.firstIndex(of: viewController), index > 0 else { return nil }
        let before = index - 1
        
        return conquestsViewsControllers[before]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = conquestsViewsControllers.firstIndex(of: viewController), index < (conquestsViewsControllers.count - 1) else { return nil }
        let after = index + 1
        //delegate?.updateView(id: after)
        return conquestsViewsControllers[after]
    }
    
    func presentationCount(for _: UIPageViewController) -> Int {
        return conquestsViewsControllers.count
    }
    
    func presentationIndex(for _: UIPageViewController) -> Int {
        guard let viewControllerBeingDisplayed = viewControllers?.first else {
            return 0
        }
        let index = conquestsViewsControllers.firstIndex(of: viewControllerBeingDisplayed)
        
        return index ?? 0
    }
}
