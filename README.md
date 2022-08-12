## 개발환경

* Eclipse
* Github
* Oracle SQL Developer

## 사용기술

### 백엔드
* JAVA
* SPRING FRAMEWORK
* MYBATIS
* AJAX

## 데이터베이스
* ORACLE

### 프론트엔드
* HTML/CSS
* JAVASCRIPT
* BOOTSTRAP
* JQUERY
---
## ER다이어그램
<img src="https://user-images.githubusercontent.com/84512966/183927684-ebc59009-f302-4023-bfb4-0576951deba9.png" width="700" height="600"/>

---

## 프로젝트 목적
개인프로젝트를 하면서 지금까지 배우고 익힌 기술들을 차근차근 다시 **복습** 목적으로 진행 하였습니다.

기초가 중요하다고 생각했기 때문에 기본적은 **CRUD 게시판을 중심**으로 떠오르는 기능들을 추가 하였습니다

## 프로젝트 주제
airbnb 시스템을 가져온 숙박 공유서비스 웹사이트 입니다
---

## 구현 기능
* 사용자
  * 회원가입,로그인,로그아웃,회원탈퇴
  * 내 정보수정
  * 사용자가 게시한 글 조회, 사용자가 예약한 숙소 조회, 사용자가 게시한 방 예약관리, 수익정보
* 관리자
  * 월간 총 조회수 확인, 회원별 나이대 확인, 최다 수익을 올린 숙소 확인
  * 탈퇴,정지,활동,운영진 등급별 회원 관리
  * 사용자가 올린 숙소 승인 후 게시하도록 게시물관리
  * 해외카테고리 추가 및 삭제
* 게시판
  * 게시판 CRUD (숙소게시판,후기게시판)
  * 방유형별,가격별,게시글유형별,장기유무,지역별,나라별 카테고리 선택
  * AJAX 활용 댓글 기능
  * AJAX 활용 좋아요 기능
  * 아임포트를 활용한 결제
  * kakaomap을 활용한 지도표시
---
## 이미지
* 메인페이지
  * 게시글 전체보기,로그인,회원가입,로그아웃

<img src="https://user-images.githubusercontent.com/84512966/184344768-bf2fb3d3-4471-4eda-9a5e-0d9d10894f67.gif"  width="700" height="600"/>

한페이지 스크롤로 총 3개의 섹션을 나누어 3번 스크롤을 할 수 있게 만들었습니다

* 회원가입
  * ajax 활용 아이디 중복 검사 및 비밀번호 확인
  * 다음 api 활용 주소 찾기
  * 유효성 검사

* 로그인
  * 아이디와 비밀번호 일치 확인

<img src="https://user-images.githubusercontent.com/84512966/183961226-56c1eafc-30d8-46b3-bace-ce9d206701ac.png"  width="400" height="400"/>

로그인을 하게 되면 세션스토리지에 담길 수 있도록 했습니다

* MY 정보 - 내정보
  * 프로필사진 설정 및 아이디,닉네임,휴대폰번호 변경
  * 회원탈퇴 (비밀번호 확인)
  * 내가 올린 방 확인, 내가 예약한 방 확인, 승인 대기중인 방 확인, 좋아요 누른 방 , 수익확인


![image](https://user-images.githubusercontent.com/84512966/184163963-6c197bab-de88-4b19-bf3a-e7a9bf8513ca.png)

프로필 이미지는 BLOB으로 처리 하였습니다.

BLOB로 저장한 이미지를 byte로 바꾸어 JDBC에서 BLOB로 **자동매핑** 했습니다.

프로필 이미지는 **AJAX**를 활용하여 수정이 가능하도록 했습니다.



* MY 정보 - 내가 올린 방
  * 게시중단 및 재시작 , 목록삭제


![image](https://user-images.githubusercontent.com/84512966/184164040-6f58bd59-6997-4fde-b479-ff915abb806d.png)



* MY 정보 - 내가 예약한 방
  * 예약상태 확인 , 예약취소, 목록 삭제

![image](https://user-images.githubusercontent.com/84512966/184164097-4276417d-bd23-432f-8e4c-9167e2414121.png)


* MY 정보 - 승인 대기중인 방
  * 예약자가 예약한 방들 호출, 승인 및 승인취소, 예약 취소

![image](https://user-images.githubusercontent.com/84512966/184163814-e05d0f3d-e14d-4e79-b466-9569983a37f6.png)


* 게시물(방) 작성하기
 
<img src="https://user-images.githubusercontent.com/84512966/184326596-90502c34-b787-4608-a53c-0a216e7d6c0f.gif"  width="850" height="600"/>

국내와 해외 주소를 **구분**하여 작성할 수 있게 했습니다.

**다음주소 api**와 **kakaomap api**를 사용하여 국내주소를 입력하면 kakaomap이 **좌표를 자동**으로 찍어 표시되게 했습니다.

글 content는 **ckeditor를 사용**하여 여러 옵션을 사용자가 사용할 수 있게 했습니다.


* 전체보기
  * 모든 게시물을 확인, 카테고리별 확인
  
![image](https://user-images.githubusercontent.com/84512966/184299739-8dfa1a61-4aa8-4c5b-9f3b-b70581eef392.png)


* 방 자세히 보기
  * 게시글 자세한 설명 및 가격, 지도표시, 예약결제, 찜하기

![20220812_161447_AdobeExpress](https://user-images.githubusercontent.com/84512966/184304126-53f3383c-ff44-4cd5-ac35-28d3c6f9c1cb.gif)

<img src="https://user-images.githubusercontent.com/84512966/184330184-6251f54e-a4d5-41f5-abcb-b5777750f50e.gif"  width="700" height="500"/>

방 상세보기 페이지에서 바로 결제를 할 수 있도록 했습니다.

**아임포트 api**를 이용하여 결제를 할 수 있게 했습니다.

**AJAX**를 이용하여 살펴본 방을 찜 할 수 있는 기능을 넣었고 이 방을 몇명이 찜을 눌렀는지도 불 수 있습니다

* 방 사진 보기
  * 메인 5개 사진 및 전체보기를 통해 모든사진 보기

<img src="https://user-images.githubusercontent.com/84512966/184330706-72034f79-30a9-40d9-9063-d534ae5c99d9.gif"  width="700" height="400"/>

방 상세보기 페이지 상단에 5개의 메인 이미지가 올라가고 **전체보기**를 누르면 스와이프로 주인이 올린 이미지를 모두 확인 할 수 있습니다.

사진은 content를 작성할 때 같이 업로드를 하지만 controller에서 **정규식을 사용하여 <img>태그만 따로 추출**하여 상세보기 페이지 상단에 사진만 추출했고

하단에 방 상세설명부분에는 <img>태그만 제외하여 상세설명만 볼 수 있도록 했습니다.


---


* 리뷰 메인
  * 정확성,철결,편의성,위치,소통 각각 점수 작성
  * 리뷰작성

<img src="https://user-images.githubusercontent.com/84512966/184335148-80fc551b-e565-4056-af7a-d783f7d82869.gif"  width="700" height="400"/>

상세보기 페이지에서 후기 버튼을 누르면 **AJAX**로 새로고침 없이 이동 되어지도록 했습니다.

이후 사용자가 남긴 별점 평균을 명시하고 **chart.js** 를 이용하여 한눈에 확인 할 수 있도록 했습니다.


* 리뷰에 답글 남기기

<img src="https://user-images.githubusercontent.com/84512966/184338484-e4f2ac43-7271-415e-b9f6-30bca4d68e81.gif"  width="700" height="400"/>

**AJAX**로 댓글을 작성할 수 있고 300글자로 제한을 두었습니다.

---

* 관리자 페이지
  * 월별 총 조회수 통계, 회원 나이 통계, 수익 통계
  * 회원관리 - 정지,탈퇴,활동,운영진 설정
  * 게시물관리 - 대기중,게시승인
  * 메뉴관리 - 카테고리 추가 및 삭제


<img src="https://user-images.githubusercontent.com/84512966/184342660-b3ac57d7-d2ce-467d-94dc-9e792ff2908c.png"  width="700" height="400"/>
<img src="https://user-images.githubusercontent.com/84512966/184342690-abe1e0f0-8fa4-4867-971e-64ae2db4f2f0.png"  width="700" height="400"/>
<img src="https://user-images.githubusercontent.com/84512966/184342726-c3b24422-d7ec-4eda-bafe-b2ea4e97ef5e.png"  width="700" height="400"/> 
<img src="https://user-images.githubusercontent.com/84512966/184344296-53c24bc9-ced3-4899-959a-1c3a3cea2c13.gif"  width="700" height="400"/> 

관리자 페이지는 bootstrap template을 사용하여 디자인을 했습니다.

관리자페이지 첫번째는 DB 테이블을 따로 두어 총 조회수를 월별로 저장 할 수 있도록 했습니다. 

최신화 버튼을 누르게 되면 controller에서 현재 월을 찾아 업데이트가 됩니다.

후기게시판과 동일하게 한눈에 확인 할 수 있도록 chart.js를 사용하여 그래프로 표시했습니다.

메뉴 관리에서는 해외나라명을 카테고리 탭에 추가 할 수 있습니다.

생성을 하게 되면 카테고리가 추가 되고 우로 메뉴를 옮기게 되면 카테고리에 표시 되지 않습니다.



---

## 프로젝트를 하면서 느낀점

