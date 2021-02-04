//
//  ViewController.swift
//  CombineMVVM
//
//  Created by 吉田寛規 on 2021/02/04.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    var cancellables: [AnyCancellable] = []
    
    let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.artices.sink{ value in
            print(value)
        }.store(in: &cancellables)
        
    }


}

