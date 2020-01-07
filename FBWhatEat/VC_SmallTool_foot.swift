//
//  VC_SmallTool_foot.swift
//  FBWhatEat
//
//  Created by 史晓义 on 2019/11/17.
//  Copyright © 2019 FeatherBrowser. All rights reserved.
//

import CCBaseKit

public class VC_SmallTool_foot: CC_ViewController
{
    
    let foodStr = "馄饨 拉面 烩面 热干面 刀削面 油泼面 炸酱面 炒面 重庆小面 米线 酸辣粉 土豆粉 螺狮粉 凉皮儿 麻辣烫 肉夹馍 羊肉汤 炒饭 盖浇饭 卤肉饭 烤肉饭 黄焖鸡米饭 驴肉火烧 川菜 麻辣香锅 火锅 酸菜鱼 烤串 披萨 烤鸭 汉堡 炸鸡 寿司 蟹黄包 煎饼果子 生煎 炒年糕 小笼包"
    var foodArr = [String]()
    
    lazy var startButton: UIButton = {
        let startButton = UIButton(type: .custom)
        startButton.layer.border(0.5, UIColor.init(rgb: 0x999999))
        startButton.setTitle("开始", for: .normal)
        startButton.setTitle("停止", for: .selected)
        startButton.setTitleColor(UIColor.init(rgb: 0x333333), for: .normal)
        startButton.setTitleColor(UIColor.init(rgb: 0x333333), for: .selected)
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        startButton.layer.corner(6)
        return startButton
    }()
    lazy var foodLabel: UILabel = {
        let foodLabel = UILabel()
        foodLabel.font = UIFont.boldSystemFont(ofSize: 30)
        foodLabel.textAlignment = .center
        return foodLabel
    }()
    
    private var timer : Timer? = nil                    //计时器
    public  var timerIntrval = 0.1                      //timer的计时时间
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    override public func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timerOff()
    }
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timerOff()
    }
}

extension VC_SmallTool_foot
{
    public override func cc_setUI() {
        self.view.backgroundColor = .white
        self.title = "今天吃什么"
        
        cc_addBackBarButton()
        
        foodArr = foodStr.components(separatedBy: " ")
        
        foodLabel.frame = self.view.bounds
        view.addSubview(foodLabel)
        
        startButton.frame = .init(
            x: (self.view.cc_w-120)/2,
            y: self.view.cc_h-150,
            width: 120,
            height: 50)
        view.addSubview(startButton)
    }
    public override func cc_setViewModel() {
        startButton.addTarget(self, action: #selector(startButtonClick), for: .touchUpInside)
    }
}

extension VC_SmallTool_foot
{
    
    @objc func startButtonClick() {
        if startButton.isSelected {
            timerOff()
        } else {
            timerOn()
        }
    }
    //关闭定时器
    func timerOff() -> Void {
        timer?.invalidate()
        timer = nil
        startButton.isSelected = false
    }
    //开启定时器
    func timerOn() -> Void {
        self.timerOff()
        startButton.isSelected = true
        if self.timer != nil {
            return
        }
        timer = Timer.scheduledTimer(timeInterval: self.timerIntrval,
                                     target: self,
                                     selector: #selector(timerFired),
                                     userInfo: nil,
                                     repeats: true)
        RunLoop.current.add(self.timer!, forMode: .default)
    }
    
    @objc func timerFired() {
        foodLabel.text = foodArr[Int(arc4random_uniform(UInt32(foodArr.count)))]
        foodLabel.textColor = UIColor.init(red: CGFloat(arc4random_uniform(255))/255, green: CGFloat(arc4random_uniform(255))/255, blue: CGFloat(arc4random_uniform(255))/255, alpha: 1)
    }
    
    
}






