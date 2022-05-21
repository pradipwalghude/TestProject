//
//  StoreInfoViewController.swift
//  Demo App
//
//  Created by Pradip Walghude on 5/20/22.
//

import UIKit

class StoreInfoViewController: UIViewController {
    
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var childContainerView: UIView!
    
    
    var viewModel: StoreInfoViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
        loadData()
        addProductDetailsController()
        self.navigationController?.navigationBar.backgroundColor = .orange
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.setStatusBar(backgroundColor: .orange)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func configureUIElements() {
        storeNameLabel.text = viewModel.storename
        addressLabel.text = viewModel.storeAddress
    }
    
    private func addProductDetailsController() {
        let vc = ProductListViewController.instantiate(from: .Home)
        vc.viewModel = ProductListViewModel(with: makeFetchProductUseCase())
        addChildView(vc)
    }
    
    private func makeFetchProductUseCase() -> FetchProductUseCase {
        return DefaultFetchProductUseCase(repository: makeProductRepository())
    }
    
    private func makeProductRepository() -> ProductRepository {
        return DefaultProductRepository(service: DefaultDataAPIService())
    }
    
    func addChildView(_ viewController: UIViewController) {
        displayContentController(content: viewController)
    }
    
    private func displayContentController(content: UIViewController) {
        addChild(content)
        content.view.frame = CGRect(x: childContainerView.frame.origin.x, y: childContainerView.frame.origin.y, width: self.view.frame.width, height: childContainerView.frame.height)
        
        childContainerView.addSubview(content.view)
        content.view.addConstraints(toParent: childContainerView)
        content.didMove(toParent: self)
    }
    
    
    func bindData() {
        viewModel.didUpdateData = { result in
            DispatchQueue.main.async { [weak self] in
                self?.configureUIElements()
            }
        }
        viewModel.didFailed = { error in
            
        }
    }
    
    func loadData() {
        viewModel.loadStoreInfo()
    }
}

extension StoreInfoViewController: Storyboarded {}


extension UINavigationController {
    
    func setStatusBar(backgroundColor: UIColor) {
        let statusBarFrame: CGRect
        if #available(iOS 13.0, *) {
            statusBarFrame = view.window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
        } else {
            statusBarFrame = UIApplication.shared.statusBarFrame
        }
        let statusBarView = UIView(frame: statusBarFrame)
        statusBarView.backgroundColor = backgroundColor
        view.addSubview(statusBarView)
    }
}


