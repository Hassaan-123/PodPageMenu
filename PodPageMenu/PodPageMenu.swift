//
//  PodPageMenu.swift
//  PodPageMenu
//
//  Created by cedcoss on 4/22/21.
//

import UIKit

public class PodPageMenu: UIViewController {

    
   public var items = ["First"]
   public var arrview : [UIView]!
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
           
        let firstview = UIView()
        arrview.append(firstview)
        return mainview
       }()
    var myview : UIView!
    public override func viewDidLoad() {
        super.viewDidLoad()
        
 
        
        // Do any additional setup after loading the view.
    }
    public func addtopsegments(title : [String])
    {
        if title.count >= 0
        {
            for x in title
            {
            items.append(x)
            let spclviews = UIView()
            arrview.append(spclviews)
                mainview.addSubview(spclviews)
            }
        }
    }
    func addnavigation(views:UIView)
    {
        let width =  views.frame.width
             let navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 30, width: width, height: 50))
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
        segmentcontrl.selectedSegmentIndex = 0
        arrview[0].backgroundColor = .red
        myview.addSubview(mainview)
        addconstrain()
        segmentcontrl.addTarget(self, action:  #selector(controlpressed),for: UIControl.Event.valueChanged )
    }
    public func addTarget()
    {
        print("print here")
    }
      func addconstrain()
    {
        segmentcontrl.heightAnchor.constraint(equalToConstant: 50).isActive=true
        segmentcontrl.topAnchor.constraint(equalTo: myview.topAnchor,constant: 80).isActive=true
        segmentcontrl.leadingAnchor.constraint(equalTo: myview.leadingAnchor).isActive=true
        segmentcontrl.trailingAnchor.constraint(equalTo: myview.trailingAnchor).isActive=true
         
        mainview.topAnchor.constraint(equalTo: segmentcontrl.bottomAnchor).isActive=true
        mainview.leadingAnchor.constraint(equalTo: myview.leadingAnchor).isActive=true
        mainview.trailingAnchor.constraint(equalTo: myview.trailingAnchor).isActive=true
        mainview.bottomAnchor.constraint(equalTo: myview.bottomAnchor).isActive=true
        
    }
      @objc func controlpressed(_ sender : UISegmentedControl)
     {
         print("indise func")
        
         mainview.bringSubviewToFront(arrview[sender.selectedSegmentIndex])
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
