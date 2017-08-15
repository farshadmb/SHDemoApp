//
//  ShowDetailViewController.swift
//  SHDemoApp
//
//  Created by Farshad Mousalou on 8/15/17.
//  Copyright © 2017 Farshad Mousalou. All rights reserved.
//

import UIKit
import AFNetworking
import Material

class ShowDetailViewController: UIViewController {

    @IBOutlet weak var topImageView: UIImageView!
    
    @IBOutlet weak var thumbImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var generLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    @IBOutlet weak var networkLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var summary: UILabel!
    
    var show : ShowItem?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.loadData()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func loadData(){
        
        
        if let thumbImage = self.show?.thumbImage {
            
           self.thumbImageView.setImageWith(thumbImage,
                                            placeholderImage: UIImage.image(with: Color.grey.base, size: self.thumbImageView.bounds.size))
        }
        
      
        if let image = self.show?.image {
            
            self.topImageView.setImageWith(image, placeholderImage:nil)
        }
        
        guard let item = self.show?.short else{
            return
        }
        
        
        self.titleLabel.text = item.title
        self.generLabel.text = item.genres
        self.durationLabel.text = item.duration
        self.rateLabel.text = item.rating + " /10"
        self.summary.text = item.summary
        
        self.networkLabel.text = self.show?.network
        self.statusLabel.text = self.show?.status
        
        
        
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
