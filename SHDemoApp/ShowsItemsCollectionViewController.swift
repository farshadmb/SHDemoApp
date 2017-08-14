//
//  ShowsItemsCollectionViewController.swift
//  SHDemoApp
//
//  Created by Farshad Mousalou on 8/14/17.
//  Copyright © 2017 Farshad Mousalou. All rights reserved.
//

import UIKit
import Material

class ShowsItemsCollectionViewController: CollectionViewController {

    var index : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = index % 2 == 0 ? Color.indigo.base : Color.indigo.darken4
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare() {
        super.prepare()
        self.collectionView.grid.columns = 2
        self.collectionView.grid.axis.direction = .vertical
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        cell.contentView.backgroundColor = .white
        return cell;
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
