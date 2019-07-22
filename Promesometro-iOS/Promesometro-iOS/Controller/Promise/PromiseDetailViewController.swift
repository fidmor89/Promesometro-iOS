//
//  PromiseDetailViewController.swift
//  Promesometro-iOS
//
//  Created by Fidel Esteban Morales Cifuentes on 7/21/19.
//  Copyright © 2019 Fidmor.89. All rights reserved.
//

import UIKit

class PromiseDetailViewController: UIViewController {

    var viewModel: PromiseDetailViewModel!

    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        guard viewModel != nil else {
            // TODO: Show an error to the user
            return dismiss(animated: true)
        }

        textView.text = viewModel.promise.asPrettyJSON()

    }
}
