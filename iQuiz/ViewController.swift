//
//  ViewController.swift
//  iQuiz
//
//  Created by Andrew Liu on 11/1/17.
//  Copyright © 2017 Andrew Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var list:[String:QuestionList]?
    var data:[Cell] = []
    var selected:QuestionList?
    
    @IBAction func goBack(unwindSegue: UIStoryboardSegue) {};
    
    @IBAction func SettingBtnClick(_ sender: Any) {
        let alertVC = UIAlertController(title: "Alert", message: "Settings go here", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            alertVC.dismiss(animated: true)
        })
        self.present(alertVC, animated: true)

    }

    @IBOutlet weak var table: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseTableViewCell", for: indexPath) as? ReuseTableViewCell
        let text = data[indexPath.row]
        cell?.myImage.image = UIImage(named: text.image)
        cell?.Description.text = text.description
        cell?.Title.text = text.title
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("called");
        selected = list?[(tableView.cellForRow(at: indexPath) as! ReuseTableViewCell).Title.text!]
        NSLog(selected!.list[0].prompt)
        self.performSegue(withIdentifier: "showView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SwitchViewController
        {
            let vc = segue.destination as? SwitchViewController
            vc?.data = selected
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data.append(Cell(title: "Mathematics", description: "content", image: "math"))
        data.append(Cell(title: "Marvel Super Heros", description: "content", image: "marvel"))
        data.append(Cell(title: "Science", description: "content", image: "science"))
        var l1 = QuestionList(Question(prompt: "What is fire?", correct: "One of the four classical elements", answer: "One of the four classical elements", "A magical reaction given to us by God", "A band that hasn't yet been discovered", "Fire! Fire! Fire! heh-heh"))
        var l2 = QuestionList(Question(prompt: "Who is Iron Man", correct: "Tony Stark", answer: "Tony Stark", "Obadiah Stane", "A rock hit by Megadeth", "Nobody knows"), Question(prompt: "Who founded the X-Men?", correct: "Professor X", answer: "Tony Stark", "Professor X", "The X-Institute", "Erik Lensherr"), Question(prompt: "How did Spider-Man get his powers?", correct: "He was bitten by a radioactive spider", answer: "He was bitten by a radioactive spider", "He ate a radioactive spider", "He is a radioactive spider", "He looked at a radioactive spider"))
        var l3 = QuestionList(Question(prompt: "What is 2+2?", correct: "4", answer: "4", "22", "An irrational number", "Nobody knows"))
        list = ["Mathematics": l3, "Marvel Super Heros": l2, "Science": l1]
        NSLog("\(data.count)")
        table.dataSource = self
        table.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension UIViewController {
    func swipeAction(swipe: UISwipeGestureRecognizer) {

    }
}
