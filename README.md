# Silver Town Project

### 실버세대를 위한 요양시설 추천 서비스, 노인 질환에 대한 챗봇 구현

#### 개발 기간
2024/07/22 - 2024/08/26

#### 주요 개발 내역
##### 웹서비스
1. 회원가입 및 로그인
2. 주소를 좌표 변환하여 DB내 등록된 시설의 좌표와 거리 계산을 통해 이용자의 특성을 반영하여 가까운 시설 추천
3. 카카오 지도, 로컬 api를 활용해 해당 시설 주변의 대학병원, 약국, 편의점 내역 표시
4. 웹 크롤링을 통해 메인페이지 뉴스카드 반영
5. 게시판 기능 구현(글쓰기, 삭제, 수정, 페이징 등)
6. 관리자 페이지 내 DB내역 분석내용 시각화(회원 지역, 질환, 특성, 성비 등 분포), 방문자 통계
##### 챗봇
1. 질환 카테고리 선정(치매, 알코올성 치매, 우울증, 알츠하이머), 학습용 데이터 json파일 파싱 후 데이터 프레임 제작
2. mecab을 활용해 형태소 분석 및 단어사전 및 학습용 데이터셋 제작
3. seq-to-seq를 활용한 학습 모델 설계
4. 모델 학습 및 하이퍼파라미터 튜닝을 통해 학습 다각화
5. gradio를 활용한 데모 ui 제작 및 테스트
<hr>

### 개발 환경
#### OS
![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)
<hr>

#### IDE
![Eclipse](https://img.shields.io/badge/Eclipse-2C2255?style=for-the-badge&logo=eclipse&logoColor=white)
![vscode](https://img.shields.io/badge/Made%20for-VSCode-1f425f.svg)
<hr>

#### 개발 언어
![java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![js](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white)
![html5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![css](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)
![python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
<hr>

### 프레임 워크 및 라이브러리
#### 웹 서비스
![spring boot](https://img.shields.io/badge/springboot-6DB33F?style=for-the-badge&logo=springboot&logoColor=white)
![Oracle](https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white)
![jQuery](https://img.shields.io/badge/jquery-%230769AD.svg?style=for-the-badge&logo=jquery&logoColor=white)
![bootstrap](https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white)
#### 챗봇
![Anaconda](https://img.shields.io/badge/Anaconda-%2344A833.svg?style=for-the-badge&logo=anaconda&logoColor=white)
![PyTorch](https://img.shields.io/badge/PyTorch-%23EE4C2C.svg?style=for-the-badge&logo=PyTorch&logoColor=white)
![NumPy](https://img.shields.io/badge/numpy-%23013243.svg?style=for-the-badge&logo=numpy&logoColor=white)
![Pandas](https://img.shields.io/badge/pandas-%23150458.svg?style=for-the-badge&logo=pandas&logoColor=white)
![Matplotlib](https://img.shields.io/badge/Matplotlib-%23ffffff.svg?style=for-the-badge&logo=Matplotlib&logoColor=black)
<hr>

### 협업 툴
![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)
![Slack](https://img.shields.io/badge/Slack-4A154B?style=for-the-badge&logo=slack&logoColor=white)
![Figma](https://img.shields.io/badge/figma-%23F24E1E.svg?style=for-the-badge&logo=figma&logoColor=white)
<hr>

### 자료 출처
https://www.aihub.or.kr
<br>
<img src="https://www.data.go.kr/images/biz/use-info/img_opencode1_m.jpeg">
