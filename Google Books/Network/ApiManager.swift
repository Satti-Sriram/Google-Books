//
//  ApiManager.swift
//  Google Books
//
//  Created by SATTI SRIRAM on 18/07/21.
//

import Foundation

final class ApiManager {


  private let domainUrlString = "https://www.googleapis.com/books/v1/volumes?q=flowers&startIndex="
  

  func fetchBooks(withIndex id:Int, completionHandler: @escaping (Books) -> Void) {
    let url = URL(string: domainUrlString + "\(id)" + "&maxResults=10")!
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      if let error = error {
        print("Error returning film id \(id): \(error)")
        return
      }
      
      guard let httpResponse = response as? HTTPURLResponse,
        (200...299).contains(httpResponse.statusCode) else {
        print("Unexpected response status code: \(String(describing: response))")
        return
      }

      if let data = data,
        let books = try? JSONDecoder().decode(Books.self, from: data) {
          completionHandler(books)
      }
    }
    task.resume()
  }
}
