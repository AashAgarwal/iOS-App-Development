//
//  TableViewCell.swift
//  MultipleImageCrawler
//
//  Created by Aashwatth Agarwal on 7/31/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    func setCollectionViewDataSourceDelegate(dataSource: UICollectionViewDataSource,  dataDelegate: UICollectionViewDelegate, forRow: Int) {
        collectionView.dataSource = dataSource
        collectionView.delegate = dataDelegate
        collectionView.tag = forRow
        collectionView.reloadData()
        collectionView.frame.size.height = 500
    }
}
