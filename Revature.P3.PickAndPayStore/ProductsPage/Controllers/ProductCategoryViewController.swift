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
    
    var filteredCategories = [CategoryHelper.newCategory]()
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredCategories = CategoryHelper.categoryHelper.categories
        
        // Do any additional setup after loading the view.
        categoryCollection.register(CategoryCollectionViewCell.nib(), forCellWithReuseIdentifier: CategoryCollectionViewCell.identefier)
        categoryCollection.delegate = self
        categoryCollection.dataSource = self
        categorysearchBar.delegate = self
        categoryCollection.collectionViewLayout =  UICollectionViewFlowLayout()
    }

}

//filter
extension ProductCategoryViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText:String){
        filterContentForSearchText(searchText: searchText)
   }

   func filterContentForSearchText(searchText: String, scope: String = "All") {
       if searchText != "" {

           print(searchText)
           filteredCategories = CategoryHelper.categoryHelper.categories.filter {category in

               return   category.name.lowercased().contains(searchText.lowercased())

           }
       }else { self.filteredCategories = CategoryHelper.categoryHelper.categories}
       categoryCollection.reloadData()
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

extension ProductCategoryViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellsAcross: CGFloat = 3
        let spaceBetweenCells: CGFloat = 1
        let dim = (collectionView.bounds.width - (cellsAcross + 50) * spaceBetweenCells) / cellsAcross
        
        return CGSize(width: dim, height: 200.0)
    }
}

extension ProductCategoryViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredCategories.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identefier, for: indexPath) as! CategoryCollectionViewCell
        
        cell.layer.cornerRadius = 20
        let category = filteredCategories[indexPath.row]
        cell.configure(image: UIImage(named: category.image)!, name: category.name)
        
        return cell
    }
}
