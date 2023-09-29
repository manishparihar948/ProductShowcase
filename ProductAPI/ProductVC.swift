//
//  ProductVC.swift
//  ProductAPI
//
//  Created by Manish Parihar on 27.09.23.
//

import SwiftUI

struct ProductVC: View {
    
    @StateObject private var viewModel = ProductViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.productResponse.products) { product in
                    NavigationLink(destination: ProductDetailVC(product: product)){
                        productRow(product:product)
                    }
                }
            }
            .navigationTitle("Products")
        }
    }
    
    private func productRow(product:ProductElement) -> some View {
        HStack {
            
            // Image
            if let imageUrl = product.thumbnail {
                AsyncImage(url: URL(string: imageUrl)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let returnedImage):
                        returnedImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            
                    case .failure:
                        Image(systemName: "questionmark")
                            .font(.headline)
                            .frame(width: 100, height: 100)
                    default:
                        Image(systemName: "questionmark")
                            .font(.headline)
                            .frame(width: 100, height: 100)
                    }
                }
            }

            HStack {
                // Text
                VStack(alignment:.leading){
                    if let productTitle = product.title {
                        Text(productTitle)
                            .font(.system(size:20))
                            .foregroundStyle(Color.blue)
                            .padding(.top,25)
                    }
                    
                    if let category = product.category {
                        Text(category)
                            .font(.system(size:15))
                            .foregroundStyle(Color.gray)
                            .padding(.top,2)
                    }
                    Spacer()
                }
                
                Spacer()
                
                if let price = product.price {
                    Text("$\(price)")
                        .foregroundStyle(.red)
                        .fontWeight(.bold)
                        .padding(.top,10)
                }
            }
        }
    }
}

#Preview {
    ProductVC()
}
