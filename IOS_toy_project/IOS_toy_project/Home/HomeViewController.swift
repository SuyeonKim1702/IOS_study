//
//  MusicCollectionViewController.swift
//  IOS_toy_project
//
//  Created by 코드잉 on 2020/12/30.
//

import UIKit

private let reuseIdentifier = "MusicCollectionViewCell"
let trackManager: TrackManager = TrackManager()

class MusicCollectionViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         collectionView.delegate = self
         collectionView.dataSource = self
         collectionView.register(UINib(nibName: "MusicCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "MusicCollectionViewCell")
        
    }
}

extension MusicCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    // 데이터를 몇개 표시할 것인가?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trackManager.tracks.count
    }
    
    
    
    //셀을 어떻게 보여줄까?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //TODO 셀 구성하기
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MusicCollectionViewCell", for: indexPath) as? MusicCollectionViewCell
        
        //nil일 경우에
        else{
            return UICollectionViewCell()
        }
        
        let item = trackManager.track(at: indexPath.item)
        
        cell.updateUI(item: item)
        
        
        return cell
    }
    
    //셀의 크기 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemSpacing: CGFloat = 20 // 아이템 간의 간격
        let margin: CGFloat = 20
        let width = (collectionView.bounds.width - itemSpacing - 2*margin)/2
        let height = width + 60
        
        return CGSize(width: width, height: height)
    }
    
    
   //헤더뷰 어떻게 표시할까
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            
            guard let item = trackManager.todaysTrack else {
                return UICollectionReusableView()
            }
        
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TrackCollectionReusableView", for: indexPath) as? TrackCollectionReusableView else{
                return UICollectionReusableView()
            }
            header.update(item: item)
            header.tapHandler = { item -> Void in
                
                //파일 정보 가져오기
                let songInfo = item
                
                
                let playerStoryboard = UIStoryboard.init(name: "Player", bundle: nil)
                // 해당 스토리보드에서 oo 뷰컨트롤러를 찾을 것이다.
                guard let playerVC = playerStoryboard.instantiateViewController(identifier: "PlayerViewController") as? PlayerViewController else { return }

                
                playerVC.simplePlayer.replaceCurrentItem(with: songInfo)
                
                self.present(playerVC, animated: true, completion: nil)
                
            
                
                
               
            }
            return header
            
        
            
            
        default:
            return UICollectionReusableView()
        }
        
       
        
        
        
    }


     
    // 아이템 클릭시에 어떻게 할까?
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //파일 정보 가져오기
        let songInfo = trackManager.tracks[indexPath.item]
        
        
        let playerStoryboard = UIStoryboard.init(name: "Player", bundle: nil)
        // 해당 스토리보드에서 oo 뷰컨트롤러를 찾을 것이다.
        guard let playerVC = playerStoryboard.instantiateViewController(identifier: "PlayerViewController") as? PlayerViewController else { return }

        
        playerVC.simplePlayer.replaceCurrentItem(with: songInfo)
        present(playerVC, animated: true, completion: nil)
        
    
    }
 
    
    
}



   



