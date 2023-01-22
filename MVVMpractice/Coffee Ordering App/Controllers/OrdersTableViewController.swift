//
//  OrdersTableViewController.swift
//  MVVMpractice
//
//  Created by 강민혜 on 1/22/23.
//

import Foundation
import UIKit

class OrdersTableViewController: UITableViewController {
    
    var orderListViewModel = OrderListViewModel() // 해당 화면에 사용될 모든 데이터를 공급
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateOrders()
    }
    
    private func populateOrders() {

        OrderWebservice().load(resource: Order.all) { [weak self] result in
            
            switch result {
            case .success(let orders):
                self?.orderListViewModel.ordersViewModel = orders.map(OrderViewModel.init)
                
                self?.tableView.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

extension OrdersTableViewController: AddCoffeeOrderDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navC = segue.destination as? UINavigationController,
              let addCoffeeOrderVC = navC.viewControllers.first as? AddOrderViewController else {
            fatalError("Error performing segue!")
        }
        
        addCoffeeOrderVC.delegate = self
    }
    
    // delegate functions of AddCoffeeOrderDelegate
    func addCoffeeOrderViewControllerClose(controller: UIViewController) {
        
        controller.dismiss(animated: true, completion: nil)
    }
    
    func addCoffeeOrderViewControllerDidSave(order: Order, controller: UIViewController) {
        
        controller.dismiss(animated: true, completion: nil)
        
        let orderVM = OrderViewModel(order: order)
        self.orderListViewModel.ordersViewModel.append(orderVM)
        self.tableView.insertRows(at: [IndexPath.init(row: self.orderListViewModel.ordersViewModel.count - 1, section: 0)], with: .automatic)
    }
    
}


extension OrdersTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderListViewModel.ordersViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let vm = self.orderListViewModel.orderViewModel(at: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath)
        
        cell.textLabel?.text = vm.type
        cell.detailTextLabel?.text = vm.size
        
        return cell
    }
}



