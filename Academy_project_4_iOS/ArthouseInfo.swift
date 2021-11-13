//
//  ArthouseInfo.swift
//  Academy_project_4_iOS
//
//  Created by Apple on 2021/11/08.
//

import UIKit
//MapView 사용을 위해 MapKit import 필요
import MapKit

//지도를 보여주기 위해 추가 delegate 선언
class ArthouseInfo: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //영화관 좌표 입력 및 타이틀 설정
        //37.56155949849524, 126.94706912625382
        movieLocation(latitude: 37.56155949, longitude: 126.94706912, delta: 0.03, title: "아트하우스 모모")
    }
    
    //위도, 경도, 범위를 파라미터로 받아 지도에 표시하는 함수 설정
    func movieLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees, delta span: Double, title strTitle: String) {
        //위도, 경도 설정
        let pLocation = CLLocationCoordinate2DMake(latitude, longitude)
        //지도 표시 범위 설정
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        mapView.setRegion(pRegion, animated: true)
        //어노테이션 객체 생성 & 위치 및 타이틀 설정
        let annotation = MKPointAnnotation()
        annotation.coordinate = pLocation
        annotation.title = strTitle
        //맵 뷰에 표시
        mapView.addAnnotation(annotation)
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
