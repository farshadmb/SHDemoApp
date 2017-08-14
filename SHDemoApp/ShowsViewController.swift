//
//  ShowsViewController.swift
//  SHDemoApp
//
//  Created by Farshad Mousalou on 8/14/17.
//  Copyright © 2017 Farshad Mousalou. All rights reserved.
//

import UIKit
import Material

class ShowsViewController: UIViewController {

    var pageController : PageTabBarController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupViewControllers()
        
        self.configPageController()
        
        self.navigationItem.title = "Go Shows"
        self.navigationItem.titleLabel.textColor = .white
        self.navigationItem.titleLabel.font = RobotoFont.light(with: 18.0)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupViewControllers(){
        
        var viewControllers = [UIViewController]()
        
        let titles = ["ACTIONS","ANIMATIONS","DRAMA"]
        
        for (index,title) in titles.enumerated() {
            
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: String(describing: ShowsItemsCollectionViewController.self)) else{
                continue
            }
            
            if  let vController = vc as? ShowsItemsCollectionViewController {
                vController.pageTabBarItem.title = title
                vController.pageTabBarItem.titleColor = Color.white
                vController.pageTabBarItem.pulseColor = Color.orange.base
                
                vController.pageTabBarItem.titleLabel?.font = RobotoFont.light(with: 12)
                vController.index = index
            }
            
            viewControllers.append(vc)
        }
        
        self.pageController = PageTabBarController(viewControllers: viewControllers, selectedIndex: 0)
        
    }
    
    func configPageController(){
        
        self.pageController?.pageTabBar.backgroundColor = self.navigationController?.navigationBar.backgroundColor
        self.pageController?.pageTabBar.lineColor = Color.amber.base
        self.pageController?.pageTabBar.lineAlignment = .bottom
        self.pageController?.pageTabBarAlignment = .top
        self.pageController?.pageTabBar.depthPreset = .none
        self.pageController?.pageTabBarItem.heightPreset = .small
        

        self.pageController?.willMove(toParentViewController: self)
        self.addChildViewController(self.pageController!)
        self.view.addSubview(self.pageController!.view)
        self.pageController?.didMove(toParentViewController: self)
        
        
        self.pageController?.view.translatesAutoresizingMaskIntoConstraints = false
        self.pageController?.view.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        self.pageController?.view.bottomAnchor.constraint(equalTo: self.bottomLayoutGuide.topAnchor, constant: 0).isActive = true
        
        self.pageController?.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        
        self.pageController?.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        
        self.view.layoutIfNeeded()
      
        
    }
    
    
  /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let tabCtrlr = segue.destination as? PageTabBarController {
            self.pageController = tabCtrlr
        }
        
        
    }*/
    

}
