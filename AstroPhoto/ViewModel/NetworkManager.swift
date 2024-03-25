//
//  NetworkManager.swift
//  AstroPhoto
//
//  Created by Елизавета Матвеева on 16.03.2024.
//

import Foundation
import Combine
import SwiftUI

class NetworkManager: ObservableObject{
    
    @Published var photoInfo = PhotoInfo()
    @Published var image: UIImage? = nil
    
    private var subscriptions = Set<AnyCancellable>()
    
    
    init() {
        let url = URL(string: Constants.bserURL)!
        let fullURL = url.withQuery(["api_key": Constants.key])!
        print(fullURL.absoluteString)
        
        
        
        URLSession.shared.dataTaskPublisher(for: fullURL)
            .map(\.data)
            .decode(type: PhotoInfo.self, decoder: JSONDecoder())
            .catch { (error) in
                Just(PhotoInfo())
            }
            .receive(on: RunLoop.main)
            .assign(to: \.photoInfo, on: self)
            .store(in: &subscriptions)
        //        print(subscriptions)
        
        $photoInfo.filter{$0.hdurl != nil}
            .map{ photoInfo  -> URL in
                return photoInfo.hdurl!
            }.flatMap{ (hdurl) in URLSession.shared.dataTaskPublisher(for: hdurl)
                    .map(\.data)
                    .catch({error in return Just(Data())
                    })
            }.map{(out) -> UIImage? in UIImage(data: out)}
            .receive(on: RunLoop.main)
            .assign(to: \.image, on: self)
            .store(in: &subscriptions)
}
    
    
    //            .sink(receiveCompletion: {(complition) in
    //            switch complition{
    //            case .finished:
    //                print("fetch is complete")
    //            case .failure(let failure):
    //                print("fetch complete with failure: \(failure.localizedDescription)")
    //            }
    //        })  {(data, response) in
    //            if let description = String(data: data, encoding: .utf8){
    //                print("fetched new data \(description)")
    //            }
    //        }.store(in: &subscriptions)
    //    }
    
}
