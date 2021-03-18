//
//  NewEmojiTableViewController.swift
//  EmojiReader
//
//  Created by Данила  on 08.03.2021.
//

import UIKit

class NewEmojiTableViewController: UITableViewController {
    
    var emoji = Emoji(emoji: "", name: "", description: "", isFavorit: false)
    
    @IBOutlet weak var emojiTextFild: UITextField!
    @IBOutlet weak var nameTextFild: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        updateSabeBattoneState()
        
    }
    
    private func updateSabeBattoneState() {
        let emojiText = emojiTextFild.text ?? ""
        let nameText = nameTextFild.text ?? ""
        let descriptionText = descriptionTextField.text ?? ""
        saveButton.isEnabled = !emojiText.isEmpty && !nameText.isEmpty && !descriptionText.isEmpty
    }
    
    private func updateUI() {
        emojiTextFild.text = emoji.emoji
        nameTextFild.text = emoji.name
        descriptionTextField.text = emoji.description
    }
    
    @IBAction func textChanged(_ sender: UITextField) {
        updateSabeBattoneState()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveSegue" else { return }
        let emoji = emojiTextFild.text ?? ""
        let name = nameTextFild.text ?? ""
        let description = descriptionTextField.text ?? ""
        
        self.emoji = Emoji(emoji: emoji, name: name, description: description, isFavorit: self.emoji.isFavorit)
    }
    
}
