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
<img src="https://user-images.githubusercontent.com/84512966/183927684-ebc59009-f302-4023-bfb4-0576951deba9.png"  width="700" height="600"/>

---

## 프로젝트 목적
개인프로젝트를 하면서 지금까지 배우고 익힌 기술들을 차근차근 다시 **복습** 목적으로 진행 하였습니다.
기초가 중요하다고 생각했기 때문에 기본적은 **CRUD 게시판을 중심**으로 떠오르는 기능들을 추가 하였습니다

## 프로젝트 주제
airbnb 시스템을 그대로 가져온 숙박 공유서비스 웹사이트 입니다
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

<img src="https://user-images.githubusercontent.com/84512966/183959563-9e7b12cb-2c14-4ee0-b0ea-788aa19901b3.png"  width="600" height="400"/>

* 회원가입
  * ajax 활용 아이디 중복 검사 및 비밀번호 확인
  * 다음 api 활용 주소 찾기
  * 유효성 검사

* 로그인
  * 아이디와 비밀번호 일치 확인

<img src="https://user-images.githubusercontent.com/84512966/183961226-56c1eafc-30d8-46b3-bace-ce9d206701ac.png"  width="400" height="400"/>


* MY 정보 - 내정보
  * 프로필사진 설정 및 아이디,닉네임,휴대폰번호 변경
  * 회원탈퇴 (비밀번호 확인)
  * 내가 올린 방 확인, 내가 예약한 방 확인, 승인 대기중인 방 확인, 좋아요 누른 방 , 수익확인


![image](https://user-images.githubusercontent.com/84512966/184163963-6c197bab-de88-4b19-bf3a-e7a9bf8513ca.png)

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


* 전체보기
  * 모든 게시물을 확인, 카테고리별 확인
  
![image](https://user-images.githubusercontent.com/84512966/184299739-8dfa1a61-4aa8-4c5b-9f3b-b70581eef392.png)


* 방 자세히 보기
  * 게시글 자세한 설명 및 가격, 지도표시, 예약결제, 찜하기

![20220812_161447_AdobeExpress](https://user-images.githubusercontent.com/84512966/184304126-53f3383c-ff44-4cd5-ac35-28d3c6f9c1cb.gif)

<img src="https://user-images.githubusercontent.com/84512966/184330184-6251f54e-a4d5-41f5-abcb-b5777750f50e.gif"  width="700" height="500"/>

* 방 사진 보기
  * 메인 5개 사진 및 전체보기를 통해 모든사진 보기

<img src="https://user-images.githubusercontent.com/84512966/184330706-72034f79-30a9-40d9-9063-d534ae5c99d9.gif"  width="700" height="400"/>

---


* 리뷰 메인
  * 정확성,철결,편의성,위치,소통 각각 점수 작성
  * 리뷰작성

<img src="https://user-images.githubusercontent.com/84512966/184335148-80fc551b-e565-4056-af7a-d783f7d82869.gif"  width="700" height="400"/>

* 리뷰에 답글 남기기

<img src="https://user-images.githubusercontent.com/84512966/184338484-e4f2ac43-7271-415e-b9f6-30bca4d68e81.gif"  width="700" height="400"/>

---

* 관리자 페이지
  * 월별 총 조회수 통계, 회원 나이 통계, 수익 통계
  * 회원관리 - 정지,탈퇴,활동,운영진 설정
  * 게시물관리 - 대기중,게시승인
  * 메뉴관리 - 카테고리 추가 및 삭제


<img src="https://user-images.githubusercontent.com/84512966/184342660-b3ac57d7-d2ce-467d-94dc-9e792ff2908c.png"  width="700" height="400"/>
<img src="https://user-images.githubusercontent.com/84512966/184342690-abe1e0f0-8fa4-4867-971e-64ae2db4f2f0.png"  width="700" height="400"/>
<img src="https://user-images.githubusercontent.com/84512966/184342726-c3b24422-d7ec-4eda-bafe-b2ea4e97ef5e.png"  width="700" height="400"/>




