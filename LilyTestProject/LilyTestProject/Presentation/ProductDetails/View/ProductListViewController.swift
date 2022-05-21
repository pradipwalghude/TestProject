//
//  ProductListViewController.swift
//  Demo App
//
//  Created by Pradip Walghude on 5/20/22.
//

import UIKit

class ProductListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var cartSummaryButton: UIButton!
    var viewModel: ProductListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        collectionView.register(ProductCollectionViewCell.nib, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        collectionView.registerEmptyCell()
        bindData()
        loadData()
    }
    
    func bindData() {
        viewModel.didUpdateData = { result in
            DispatchQueue.main.async { [weak self] in
                self?.collectionView.reloadData()
            }
        }
        viewModel.didFailed = { error in }
    }
    
    func loadData() {
        viewModel.loadProductList()
    }
    
    @IBAction func tappedOnCartSummaryButton(_ sender: UIButton) {
        let vc = CartSummaryViewController.instantiate(from: .Home)
        vc.viewModel = viewModel.cartProductList
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ProductListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell,
              let cellVM = viewModel.cellViewModel(for: indexPath) else { return collectionView.emptyCell(at: indexPath) }
        cell.configure(with: cellVM)
        
        cell.updateCart = { [weak self] (productSequence,quantity) in
            self?.viewModel.addToCart(for: productSequence,quantity: quantity)
            self?.cartSummaryButton.isHidden = self?.viewModel.isCartSummaryButtonVisible ?? true
        }
        
        cell.updateSegmentView = { [weak self] isUpdated in
            self?.showAlert(title: "Warnings", msg: "Only a single quantity for each product is allowed", style: .alert, actions: .none)
        }
        return cell
    }
    
}

extension ProductListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let gridColumnCount = UIDevice.current.userInterfaceIdiom == .pad ? 2.0 : 1.0
        return CGSize(width: (UIScreen.main.bounds.width / gridColumnCount) - 15 , height: 370)
    }
}

extension ProductListViewController: Storyboarded {}


