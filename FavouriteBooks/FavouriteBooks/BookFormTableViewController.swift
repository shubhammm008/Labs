//
//  BookFormTableViewController.swift
//  FavouriteBooks
//
//  Created by Shubham Singh on 25/08/25.
//

import UIKit

class BookFormTableViewController: UITableViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var lengthTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    var book:Book?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let book1 = book{
            updateUI(book:book1)
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func updateUI(book:Book){
        titleTextField.text = book.title
        authorTextField.text = book.author
        genreTextField.text = book.genre
        lengthTextField.text = book.length
    }
    init?(coder: NSCoder ,book:Book?) {
        self.book = book
        super.init(coder: coder)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        let book = Book(title:titleTextField.text ?? "", author: authorTextField.text ?? "", genre: genreTextField.text ?? "", length: lengthTextField.text ?? "")
        self.book = book
        performSegue(withIdentifier: "saveButton", sender: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
