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
        self.performSegue(withIdentifier: "showView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SwitchViewController
        {
            let vc = segue.destination as? SwitchViewController
            vc?.data = selected
            NSLog((selected?.list[0].prompt)!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data.append(Cell(title: "Mathematics", description: "content", image: "math"))
        data.append(Cell(title: "Marvel Super Heros", description: "content", image: "marvel"))
        data.append(Cell(title: "Science", description: "content", image: "science"))
        var l1 = QuestionList(Question(prompt: "Q1", correct: "1", "1", "2", "3", "4"), Question(prompt: "Q2", correct: "2", "1", "2", "3", "4"), Question(prompt: "Q3", correct: "3", "1", "2", "3", "4"), Question(prompt: "Q4", correct: "4", "1", "2", "3", "4"))
        list = ["Mathematic": l1, "Marvel Super Heros": l1, "Science": l1]
        NSLog("\(data.count)")
        table.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

