//
//  PodPageMenu.swift
//  PodPageMenu
//
//  Created by cedcoss on 4/22/21.
//

import UIKit

public class PodPageMenu: UIViewController {

    
    var items = ["First","Second","Third"]
   public lazy var segmentcontrl : UISegmentedControl =
       {
          
           let segmentcontrl = UISegmentedControl(items: items)
           segmentcontrl.selectedSegmentIndex = 0
           segmentcontrl.backgroundColor = .red
           segmentcontrl.tintColor = .white
           segmentcontrl.translatesAutoresizingMaskIntoConstraints=false
           
           return segmentcontrl
       }()
   public lazy var mainview : UIView =
       {
           let mainview = UIView()
        mainview.translatesAutoresizingMaskIntoConstraints=false
           return mainview
       }()
    var myview : UIView!
    public override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    public func addtopsegments(title : String)
    {
        if title != ""
        {
            items.append(title)
        }
    }
    func addnavigation(views:UIView)
    {
        let width =  views.frame.width
             let navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: width, height: 50))
        views.addSubview(navigationBar);
             let navigationItem = UINavigationItem(title: "Page Menu")
//             let doneBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(selectorX))
//             navigationItem.rightBarButtonItem = doneBtn
             navigationBar.setItems([navigationItem], animated: false)
        
    }
    public func adddesign(views : UIView , controller:UIViewController)
    {
        addnavigation(views: views)
        myview = controller.view
        myview.addSubview(segmentcontrl)
        myview.addSubview(mainview)
        segmentcontrl.heightAnchor.constraint(equalToConstant: 50).isActive=true
        segmentcontrl.topAnchor.constraint(equalTo: myview.topAnchor,constant: 50).isActive=true
        segmentcontrl.leadingAnchor.constraint(equalTo: myview.leadingAnchor).isActive=true
        segmentcontrl.trailingAnchor.constraint(equalTo: myview.trailingAnchor).isActive=true
        
         
        mainview.topAnchor.constraint(equalTo: segmentcontrl.bottomAnchor).isActive=true
        mainview.leadingAnchor.constraint(equalTo: myview.leadingAnchor).isActive=true
        mainview.trailingAnchor.constraint(equalTo: myview.trailingAnchor).isActive=true
        mainview.bottomAnchor.constraint(equalTo: myview.bottomAnchor).isActive=true
        
        segmentcontrl.addTarget(controller, action:  #selector(controlpressed),for: segmentcontrl.allControlEvents )
    }
    public func addTarget()
    {
        print("print here")
    }
    public func addconstrain()
    {
        
    }
      @objc func controlpressed(_ sender : UISegmentedControl)
     {
         print("indise func")
        if sender.selectedSegmentIndex == 0
        {
            myview.backgroundColor = .systemRed
        }
        if sender.selectedSegmentIndex == 1
        {
            myview.backgroundColor = .yellow
        }
        if sender.selectedSegmentIndex == 2
        {
            myview.backgroundColor = .systemOrange
        }
        
         
     }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
