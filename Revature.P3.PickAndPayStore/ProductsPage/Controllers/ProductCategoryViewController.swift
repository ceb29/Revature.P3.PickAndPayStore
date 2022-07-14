//
//  ProductCategoryViewController.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/13/22.
//

import UIKit

class ProductCategoryViewController: UIViewController {

    @IBOutlet weak var categorysearchBar : UISearchBar!
    @IBOutlet weak var categoryCollection : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        categoryCollection.register(CategoryCollectionViewCell.nib(), forCellWithReuseIdentifier: CategoryCollectionViewCell.identefier)
        categoryCollection.delegate = self
        categoryCollection.dataSource = self
    }

}

extension ProductCategoryViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ProductSVC") as? ProductsViewController else{
            return
        }
        vc.searchedItem = CategoryHelper.categoryHelper.categories[indexPath.row].name
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ProductCategoryViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CategoryHelper.categoryHelper.categories.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identefier, for: indexPath) as! CategoryCollectionViewCell
        
        let category = CategoryHelper.categoryHelper.categories[indexPath.row]
        cell.configure(image: UIImage(named: category.image)!, name: category.name)
        
        return cell
    }
}
