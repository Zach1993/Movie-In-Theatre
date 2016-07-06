//
//  DetailViewController.swift
//  MovieViewer
//
//  Created by zach lee on 7/2/16.
//  Copyright © 2016 zach lee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var OverviewLabel: UILabel!
    @IBOutlet weak var YearReleasedLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailScrollViewer: UIScrollView!
    @IBOutlet weak var InfoView: UIView!
    
    
    var movie: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let size = detailScrollViewer.frame
        let sizeInfo = InfoView.frame
        detailScrollViewer.contentSize = CGSize(width: size.width, height: sizeInfo.origin.y + sizeInfo.height)
        
        
        let yearReleased = movie["release_date"] as? String
        YearReleasedLabel.text = "Release Date: \(yearReleased)"
        
        let title = movie["title"] as? String
        titleLabel.text = title
        
        let overview = movie["overview"] as? String
        OverviewLabel.text = overview
        OverviewLabel.sizeToFit()

        let baseURL = "http://image.tmdb.org/t/p/w500"
        
        if let posterPath = movie["poster_path"] as? String{
            let posterURL = NSURL(string: baseURL+posterPath)
            posterImageView.setImageWithURL(posterURL!)
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
