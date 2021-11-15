# Academy_project_4_iOS
iOS Application for independent film theatre (ArtHouse Momo, [아트하우스 모모](https://www.arthousemomo.co.kr/))

*****  

**프로젝트 설명**
> 아트하우스 모모 iOS 애플리케이션
Sqlite, 테이블 뷰 및 맵 뷰를 적용한 스위프트 기반 영화관 애플리케이션 구현 (iOS 애플리케이션) 

**사용 언어 & 기술 & 도구**
> Language: Swift
> IDE: Xcode 
> DB: Sqlite  
> 협업툴: Github (CI/CD)

**애플리케이션 스토리보드 화면**  
<img width="70%" src="https://user-images.githubusercontent.com/72402916/141800974-ea292105-ce23-45b8-be7e-d51ae0e7239e.PNG"/>

##**구현 기능**
1. Tab Bar Controller 
   - 영화리스트, 찜 목록, 영화관 정보, 회원메뉴 제공  
2. Navigation Controller & Table View
   - 영화리스트 및 찜 목록을 테이블 뷰로 진행  
3. Web View
   - 실제 영화 예매를 위해 앱 내에서 웹사이트 연결이 가능한 웹 뷰 제공  
4. Map View
   - 영화관 위치를 확인할 수 있도록 맵 뷰 제공  
5. DB (Sqlite3)
   - 회원정보, 영화정보 및 찜 목록을 Sqlite로 관리  

###**애플리케이션 메뉴**
1. 회원 -------------------------------------- 
   - 로그인, 회원가입, 회원정보 수정 및 회원 탈퇴 (Sqlite3)   
   
2. 영화 --------------------------------------
   * DB에 저장된 영화 테이블 뷰로 노출
   - 웹 뷰로 웹사이트를 연결해 실제 예매 기능과 연결
   - 선호하는 영화를 별도로 관리할 수 있는 찜 기능 제공   

3. 영화관 정보 -------------------------------
   - 영화관 장소 정보를 지도(맵 뷰)와 함께 
