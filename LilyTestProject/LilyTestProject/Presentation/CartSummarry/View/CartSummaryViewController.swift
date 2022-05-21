//
//  CartSummaryViewController.swift
//  WeatherApp
//
//  Created by Pradip Walghude on 5/21/22.
//

import UIKit

class CartSummaryViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel: CartSummaryViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        collectionView.register(ProductCollectionViewCell.nib, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
    }
    
    
    @IBAction func tappedOnPlaceOrderButton(_ sender: UIButton) {
        
        let action = UIAlertAction(title: "Okay", style: .default) {[weak self] _ in
            self?.navigationController?.popToRootViewController(animated: true)
        }
        showAlert(title: "Success", msg: "Your Order has been placed successfully, thank you for shopping with us", style: .alert, actions: [action])
    }
    
}

extension CartSummaryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell,
              let cellVM = viewModel.cellViewModel(for: indexPath) else { return collectionView.emptyCell(at: indexPath) }
        cell.configure(with: cellVM)
        return cell
    }
    
}

extension CartSummaryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let gridColumnCount = UIDevice.current.userInterfaceIdiom == .pad ? 2.0 : 1.0
        return CGSize(width: (UIScreen.main.bounds.width / gridColumnCount) - 15 , height: 370)
    }
}

extension CartSummaryViewController: Storyboarded {}
