//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Andrew Liu on 11/12/17.
//  Copyright © 2017 Andrew Liu. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBAction func submitBtnClicked(_ sender: Any) {
    }
    @IBOutlet weak var Prompt: UILabel!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return question!.answer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseCell")!
        let text = question?.answer[indexPath.row]
        cell.textLabel?.text = text
        return cell
    }
    
    public var question:Question?
    public var selected:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        Prompt.text = question!.prompt
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = tableView.cellForRow(at: indexPath)?.textLabel?.text
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
