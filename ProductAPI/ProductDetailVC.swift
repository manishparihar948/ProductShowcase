//
//  ProductDetailVC.swift
//  ProductAPI
//
//  Created by Manish Parihar on 27.09.23.
//

import SwiftUI

struct ProductDetailVC: View {
    
    let product: ProductElement
    
    init(product: ProductElement) {
        self.product = product
    }
    
    var body: some View {
        ZStack {
            // Background
            LinearGradient(
                gradient: Gradient(colors: [Color(.purple), Color(.systemBlue)]),
                startPoint: .leading,
                endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            // Foreground
            VStack(alignment: .leading, spacing: 5){
                
                // Text
                if let title = product.title {
                    Text(title)
                        .font(.system(size:25))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding(.leading, 10)
                        .padding(.bottom,10)
                }
                
                // Image
                ScrollView(.horizontal) {
                    HStack(spacing:10){
                        // Image
                        if let showImages = product.images {
                            
                            ForEach(showImages, id:\.self) { imgShow in
                                
                                AsyncImage(url: URL(string: imgShow)) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                    case .success(let returnedImage):
                                        returnedImage
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 200, height: 200)
                                            .padding(.leading, 10)

                                        
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
                        }
                    }
                }
               
                
                // Text
                if let category = product.category {
                    Text(category)
                        .font(.system(size:20))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding(.leading, 10)
                        .padding(.bottom,10)
                }
                
                // Description
                if let description = product.description {
                    Text(description)
                        .font(.system(size:20))
                        .foregroundStyle(.white)
                        .padding(.leading, 10)

                }
                
                Spacer()
            }
        }
    }
}

/*
 #Preview {
 ProductDetailVC()
 }
 */
