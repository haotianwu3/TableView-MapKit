//
//  ViewController.swift
//  TableView&MapKit
//
//  Created by Randolph on 13/1/2016.
//  Copyright © 2016年 September. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var shops = [Shop]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        loadSampleShops()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadSampleShops(){
        let shop1 = Shop(name: "CK", latitude: 22.30088, longitude: 114.17208200000005)!
        let shop2 = Shop(name: "LogOn", latitude: 22.2966911, longitude: 114.17192449999993)!
        let shop3 = Shop(name: "Nike", latitude: 22.2819496, longitude: 114.18574409999997)!
        
        shops += [shop1, shop2, shop3]
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "shopCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ShopTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let shop = shops[indexPath.row]
        
        cell.ShopLabel.text = shop.Name
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shops.count
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        // sender is the tapped `UITableViewCell`
        let cell = sender as! UITableViewCell
        let indexPath = self.tableView.indexPathForCell(cell)
        
        // load the selected model
        let item = self.shops[indexPath!.row]
        
        let detail = segue.destinationViewController as! DetailViewController
        // set the model to be viewed
        detail.shopName = item.Name
        detail.shopLongitude = item.ShopLongitude
        detail.shopLatitude = item.ShopLatitude
    }
}

