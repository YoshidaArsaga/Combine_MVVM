//
//  ViewModel.swift
//  CombineMVVM
//
//  Created by 吉田寛規 on 2021/02/04.
//

import Foundation
import Combine

class ViewModel {
    
    var cancellables: [AnyCancellable] = []
    
    //input
    
    //output
    let artices: AnyPublisher<[Qiita], Never>
    
    init() {
        let _articles = PassthroughSubject<[Qiita], Never>()
        self.artices = _articles.eraseToAnyPublisher()
        
        QiitaRepository.getArticles() { complition in
            _articles.send(complition)
        }
        
        _articles.sink { value in
            print(value)
        }.store(in: &cancellables)
    }
    
}
