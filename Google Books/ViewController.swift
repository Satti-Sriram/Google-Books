//
//  ViewController.swift
//  Google Books
//
//  Created by SATTI SRIRAM on 18/07/21.
//

import UIKit
import SDWebImage



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    let bookIdentifier = "booklist"
    var books: Books?
    var items = [Item]()
    var pageIndex: Int = 0
    var tblBooks = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.tblBooks.register(BookItemTableViewCell.self, forCellReuseIdentifier: bookIdentifier)
        self.tblBooks.keyboardDismissMode = UIScrollView.KeyboardDismissMode.interactive
        self.tblBooks.keyboardDismissMode = UIScrollView.KeyboardDismissMode.onDrag
        self.SetupViews()
        

        
        
    }
    func SetupViews() {
        self.view.addSubview(self.tblBooks)
        self.tblBooks.translatesAutoresizingMaskIntoConstraints = false
        self.tblBooks.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        self.tblBooks.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        self.tblBooks.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        self.tblBooks.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        self.tblBooks.layer.cornerRadius = 10
        self.tblBooks.layer.masksToBounds = false
        self.tblBooks.backgroundColor = UIColor.clear
        self.tblBooks.showsVerticalScrollIndicator = false
        self.tblBooks.showsHorizontalScrollIndicator = false
        self.tblBooks.delegate = self
        self.tblBooks.dataSource = self
        self.tblBooks.separatorStyle = .none

        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        callBooksApi(index: 0)
    }
    func callBooksApi(index: Int) {
        ApiManager().fetchBooks(withIndex: index, completionHandler: { (books) in
            self.items.append(contentsOf: books.items)
            DispatchQueue.main.async {
                self.tblBooks.reloadData()
            }
            print("response of books", books);
            // Do any additional setup after loading the view.
        })
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
            let cell: BookItemTableViewCell = (tblBooks.dequeueReusableCell(withIdentifier: bookIdentifier, for: indexPath) as? BookItemTableViewCell) ?? BookItemTableViewCell()
            cell.backgroundColor = UIColor.clear
            cell.contentView.backgroundColor = UIColor.clear
            cell.selectionStyle = .none
        let book = self.items[indexPath.row]
        cell.lblTitle.text = book.volumeInfo.title
        cell.lblDesc.text = book.volumeInfo.volumeInfoDescription
        cell.imgThumb.sd_setImage(with: URL(string: book.volumeInfo.imageLinks.smallThumbnail), placeholderImage: UIImage(named: "thumb.png"))
        if book.id == items.last?.id {
            self.pageIndex += 1
            self.callBooksApi(index: self.pageIndex)
        }
            return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

