//
//  ProductCollectionViewCell.swift
//  Demo App
//
//  Created by Pradip Walghude on 5/20/22.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    var updateCart: ((Int,Int) -> Void)?
    var updateSegmentView: ((Bool) -> Void)?
    
    public static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: Self.self).resource)
    }
    
    public static var identifier: String { return String(describing: Self.self) }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with viewModel: ProductList) {
        titleLabel.text = viewModel.productName
        priceLabel.text = "Price ₹\(viewModel.prize ?? "")"
        descriptionLabel.text = viewModel.description
        discountLabel.text = "Discount - \(viewModel.discount ?? "")"
        segmentControl.tag = viewModel.productSequence
        segmentControl.setTitle("\(viewModel.quantity)", forSegmentAt: 1)
        segmentControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
    }
    
    
    @IBAction func tappedonSegmentControl(_ sender: UISegmentedControl) {
        if segmentControl.selectedSegmentIndex == 0 {
            segmentControl.setTitle("0", forSegmentAt: 1)
            updateCart?(sender.tag,0)
        } else if segmentControl.selectedSegmentIndex == 2 {
            if segmentControl.titleForSegment(at: 1) == "1" {
                updateSegmentView?(true)
            } else {
                segmentControl.setTitle("1", forSegmentAt: 1)
                updateCart?(sender.tag,1)
            }
        }
    }
    
}



