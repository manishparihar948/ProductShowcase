//
//  ProductViewModel.swift
//  ProductAPI
//
//  Created by Manish Parihar on 27.09.23.
//

import Foundation
import Combine

@MainActor
final class ProductViewModel : ObservableObject {
    @Published var productResponse : Product
    var cancellables = Set<AnyCancellable>()
    
    var offset = 0
    let batchSize = 30
    
    init() {
        self.productResponse = Product(products: [], total: 0, skip: 0, limit: 0)
        
        getProductList(limit:30)
    }
    
    func getProductList(limit:Int){
        guard let url = URL(string: "https://dummyjson.com/products") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: Product.self, decoder: JSONDecoder())
            .mapError{
                error-> Never in fatalError("Unhandled error: \(error)")
            }
            .sink( receiveValue: {[weak self](returnedProduct) in
                self?.productResponse = returnedProduct
                
                // Increment the offset for the next batch
                self?.offset += self?.batchSize ?? 0
            })
            .store(in: &cancellables)
    }
    
    func handleOutput(output:URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}
