//
//  PromiseTableViewController.swift
//  Promesometro-iOS
//
//  Created by Fidel Esteban Morales Cifuentes on 7/21/19.
//  Copyright © 2019 Fidmor.89. All rights reserved.
//

import RxSwift
import UIKit

let cellIdentifier = "PromiseCell"

class PromiseTableViewController: UITableViewController {

    // MARK: - Dependencies

    var viewModel = PromiseTableViewModel()

    // MARK: - Properties

    private let disposeBag = DisposeBag()

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupTableView()
        setupRx()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.promises.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        // Configure the cell...
        let promise = viewModel.promises[indexPath.row]
        cell.textLabel?.text = promise.promise
        return cell
    }
}

// MARK: - Helpers
extension PromiseTableViewController {
    private func setupNavigationController() {
        self.title = "Promesas"

        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
    }

    private func setupTableView() {
        // Register cell.
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }

    private func setupRx() {
        viewModel
            .getPromises()
            .bind (onNext: { [weak self] _ in self?.tableView.reloadData() })
            .disposed(by: disposeBag)
    }
}
