//
//  RootTabBarController.swift
//  SHDemoApp
//
//  Created by Farshad Mousalou on 8/14/17.
//  Copyright © 2017 Farshad Mousalou. All rights reserved.
//

import UIKit
import Material

class RootTabBarController: BottomNavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.items?.forEach({ (item) in
            
            item.title = nil
            item.image = Icon.cm.videocam?.tint(with: Color.grey.lighten1)
            item.selectedImage = Icon.cm.videocam?.tint(with: Color.amber.base)
            item.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.yellow], for: .selected)
        })
        self.selectedIndex = 2
        
        // Do any additional setup after loading the view.
    }

    override func prepare() {
        super.prepare()
        tabBar.depthPreset = .none
        tabBar.dividerColor = Color.grey.lighten3
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
