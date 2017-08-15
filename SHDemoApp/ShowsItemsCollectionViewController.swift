//
//  ShowsItemsCollectionViewController.swift
//  SHDemoApp
//
//  Created by Farshad Mousalou on 8/14/17.
//  Copyright © 2017 Farshad Mousalou. All rights reserved.
//

import UIKit
import MaterialComponents
import Material
import AFNetworking
import AFNetworking_AutoRetry



class ShowsItemsCollectionViewController: MDCCollectionViewController {

    var index : Int = 0
    
    var pageCount : Int = 1
    
    var items = [ShowItem]()
    
    var isLoadingData : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configCollectionView()
        
        if index == 0 {
            self.fetchShowsFromAPI()
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
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

// MARK: - UI Methods

extension ShowsItemsCollectionViewController {
    
    func configCollectionView(){
        
        self.styler.cellBackgroundColor = .clear
        self.styler.cellLayoutType = .grid
        self.styler.gridColumnCount = 1
        self.styler.allowsItemInlay = false
        self.styler.cellStyle = .card
        self.styler.shouldHideSeparators = true
//        self.styler.gridPadding = 5.0
        
        
    }
    
}

// MARK: - Send Request and Recieve Response
extension ShowsItemsCollectionViewController {
    
    
    func fetchShowsFromAPI(){
        
        guard isLoadingData == false else{
            return
        }
        
        self.isLoadingData = true
        
        self.sendRequest(with: self.parameterForRequest(for: self.pageCount)) { (items, error) in
            
            self.isLoadingData = false
            
            guard error == nil else{
                return
            }
            
            guard let recievedItems = items else{
                // No Item recieved or no more data
                return
            }
            
            self.parse(response: recievedItems)
            
            
        }
        
    }
    
    func fetchMoreShows(){
        
        guard isLoadingData == false else{
            return
        }
        
        self.pageCount += 1
        self.fetchShowsFromAPI()
    }
    
    
    func parameterForRequest(for page:Int) -> [String:Any]{
        
        return ["page" : page]
    }
    
    func sendRequest(with parameter : [String: Any]? = nil,completion:@escaping (_ result : [[String:Any]]?,_ error:Error?)->()){
        
        APINetworkManager.get("shows", parameters: parameter, success: { (task, response) in
            
            guard let json = response as? [[String:Any]] else{
                print("Something wrong in response!!!")
                return
            }
                completion(json,nil)
            
            
        }, failure: { (dataTask, error) in
            
            completion(nil,error)
            
        }, autoRetry: 3)
        
        
        
    }
    
    func parse(response:[[String:Any]]){
     
        
        
        response.forEach { (item) in
            
            let newItem = ShowItem(with: item)
            
            if self.items.contains(newItem) == false{
                self.items.append(newItem)
            }
            
            
        }
        
        if response.count > 0 {
            self.collectionView?.reloadData()
        }
        
        
    }
    
    
}

extension ShowsItemsCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ShowItemCollectionViewCell
        
        let item = items[indexPath.row]
        
        cell.configure(with: item.short)
        
        if var thumbImage = item.thumbImage {
            
            cell.imageView.setImageWith(thumbImage, placeholderImage: UIImage.image(with: Color.grey.base, size: cell.imageView.bounds.size))
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row + 1 == items.count{
            self.fetchMoreShows()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellHeightAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
}
