//
//  QiitaRepository.swift
//  CombineMVVM
//
//  Created by 吉田寛規 on 2021/02/04.
//

import Foundation
import Alamofire
import Combine

class QiitaRepository {
    
    static func getArticles(complition: @escaping ([Qiita]) -> Void) {
        
        AF.request(URLs.baseURL + "/api/v2/items",
                   method: .get,
                   parameters: ["per_page" : "10"],
                   encoding: URLEncoding.default)
            .response{(responce) in
               
                switch responce.result{
                case .success:
                    guard let data = responce.data else {
                        return
                    }
                    do {
                        let res = try JSONDecoder().decode([Qiita].self, from: data) as [Qiita]
                        complition(res)
                        
                    } catch let error {
                        print("Error: \(error)")
                    }
                    
                case .failure(let error):
                    print(error)
                    
                }
            }
    }
}
