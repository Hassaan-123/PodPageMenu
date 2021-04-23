//
//  PodPageMenu.swift
//  PodPageMenu
//
//  Created by cedcoss on 4/22/21.
//

import UIKit

public class PodPageMenu: UIViewController {


    public var items = ["First"]
    public var arrview = [UIView]()
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
    public func Addsegments(title : [String])
    {
      if title.count >= 0
        {
          for x in title
          {
            items.append(x)
            let spclviews = UIView()
            arrview.append(spclviews)
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
    public func adddesign(controller:UIViewController)
    {

        addnavigation(views: controller.view)
        myview = controller.view
        myview.addSubview(segmentcontrl)
        segmentcontrl.selectedSegmentIndex = 0
        myview.addSubview(mainview)
        addconstrain()
        segmentcontrl.addTarget(self, action:  #selector(controlpressed),for: UIControl.Event.valueChanged )
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
           swipeRight.direction = .right
        swipeLeft.direction = .left
        myview.addGestureRecognizer(swipeRight)
        myview.addGestureRecognizer(swipeLeft)

    for v in arrview
    {
        print(v)
        mainview.addSubview(v)
        viewcontraint(innerview: v)
    }
    }
    var swipeindex = 0
    @objc func respondToSwipeGesture(_ sender : UISwipeGestureRecognizer)
    {
        if sender.direction == .left
            {
            if swipeindex == items.count - 1
            {}
            else
            {
                swipeindex += 1
            segmentcontrl.selectedSegmentIndex = swipeindex
            mainview.bringSubviewToFront(arrview[swipeindex])
            }
    }
    if sender.direction == .right
        {
            if swipeindex == 0{}
            else
            {
            swipeindex -= 1
        segmentcontrl.selectedSegmentIndex = swipeindex
        mainview.bringSubviewToFront(arrview[swipeindex])
            }
        }
        
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

    func viewcontraint(innerview : UIView)
    {
        innerview.translatesAutoresizingMaskIntoConstraints = false
        innerview.topAnchor.constraint(equalTo: mainview.topAnchor).isActive=true
        innerview.leadingAnchor.constraint(equalTo: mainview.leadingAnchor).isActive=true
        innerview.trailingAnchor.constraint(equalTo: mainview.trailingAnchor).isActive=true
        innerview.bottomAnchor.constraint(equalTo: mainview.bottomAnchor).isActive=true
    }

    @objc func controlpressed(_ sender : UISegmentedControl)
    {
        mainview.bringSubviewToFront(arrview[sender.selectedSegmentIndex])
        arrview[sender.selectedSegmentIndex].backgroundColor = .white
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
