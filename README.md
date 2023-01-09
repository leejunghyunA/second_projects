# 📊 발표주제 및 자료
### 구매감소 고객 예측 및 추천 솔루션
[![발표자료 보러가기](https://user-images.githubusercontent.com/108326629/210029729-f3f9c7db-737b-4d11-b542-7294d28031e3.png "발표자료 보러가기")](https://docs.google.com/presentation/d/1t8-dkB2IBRQoJ1jgA2k_jGG7kQ5l39Zg/edit#slide=id.p1)<br/>

<br/>

# 👩‍👩‍👧‍👧 팀원 소개

| 팀원 | 업무 | 깃허브 주소 |
| ------ | -- | ----------- |
| 최애림 | 탐색적 분석, 데이터 전처리, 군집화 | https://github.com/choi-aerim |
| 이정현 | 탐색적 분석, 데이터 전처리, 모델링 | https://github.com/leejunghyunA |
| 양주희 | 탐색적 분석, 데이터 전처리, 추천 시스템 | https://github.com/YANGJUHEE521 |
| 진청아 | 탐색적 분석, 데이터 전처리, 추천 시스템 | https://github.com/risa1796 |

<br/>

# 🌱 요약
L사의 데이터를 활용하여 고객의 구매 패턴을 파악한 후, 구매 감소 고객 예측 모델을 구축하여 같은 특징을 갖는 고객을 군집화 한 후 해당 고객별로 추천솔루션을 통한 맞춤 마케팅을 제언합니다. 

## 사용한 모듈
- 언어 <img src="https://img.shields.io/badge/python-3776AB?style=flat-square&logo=python&logoColor=white"/>
- DB <img src="https://img.shields.io/badge/oracle-F80000?style=flat-square&logo=oracle&logoColor=white"/> 
- 구축환경 <img src="https://img.shields.io/badge/github-181717?style=flat-square&logo=github&logoColor=white"/> 
- 활용 기술 <img src="https://img.shields.io/badge/Scikit_learn-F7931E?style=flat-square&logo=scikit-learn&logoColor=black"/> <img src="https://img.shields.io/badge/Surprise-3776AB?"/> <img src="https://img.shields.io/badge/Pycaret-3776AB?"/>
- 통합 개발 환경 <img src="https://img.shields.io/badge/Anaconda-44A833?style=flat-square&logo=Anaconda&logoColor=black"/> <img src="https://img.shields.io/badge/Jupyter Notebook-F37626?style=flat-square&logo=Jupyter&logoColor=black"/>

<br/>

# 📣 과정
제공 받은 데이터를 분석하여 pain point를 찾고, 주제선정에 맞게 기존 고객에 대해 유지고객과 감소고객을 새로 정의하였습니다. 
그 후 분석에 필요한 데이터를 추출해내어 분석을 진행했습니다. 
사용된 모델을 통해 군집분석을 하였고, 군집화를 통해 5개의 고객군으로 나누었습니다. Tensorflow를 활용해 군집별 구매 특성을 파악하여 중점적으로 봐야할 상품을 파악한 후 surprise를 활용해 군집별 맞춤 추천시스템을 최종 마케팅 제언으로 제공하였습니다. 

| Week | 코드 | 내용|
| ------ | -- | ----------- |
| 1주차 | ☑️ | 탐색적 분석 |
| 2주차 | ☑️ | 카테고리 데이터 전처리 |
| 3주차 | ☑️ | 유지고객 및 감소고객 정의 |
| 4주차 | ☑️ | 감소고객 분류 모델 개발|
| 5주차 | ☑️ | 감소고객 유형별 군집화 |
| 6주차 | ☑️ | 군집별 맞춤 추천 시스템 개발 |

<br/>

# 💬 팀원들의 후기 

| 팀원 | 어려웠던 점과 배운 점 | 
| ------ | -- | 
| 최애림 | 평소에 접하기 힘든 빅데이터를 가지고 실습할 수 있는 좋은 기회였습니다. 감소고객을 정의하는 것부터 고객 유형을 나누는 군집화까지 모두 데이터를 기반으로 할 수 있다는 점과 어떤 마케팅적 제언이 필요한지 등 실무에서 해볼 수 있을 만한 부분을 고민할 수 있어 유익한 시간이었습니다. 모델 구축 시 구매감소 예측을 위해 어떤 피처가 중요하게 작용할지 고민해보고 다양한 아이디어를 시도해본 부분이 가장 크게 배운 점입니다. 2년이라는 구매 기간의 시계열적인 부분을 고려하지 못해 최종 모델 구축에 혼선이 있었지만 팀원들과의 적극적인 소통과 배려로 끝까지 잘 마무리할 수 있었습니다.| 
| 이정현 | Oracle을 사용해 실제 구매 데이터를 다루면서 많은 점을 배웠습니다. 방대한 데이터 중 필요한 정보만 추출하고 문제점을 발견하는 것이 데이터 분석에 있어 가장 중요하다 느꼈습니다. 또한, 단순히 주어진 데이터뿐만 아니라 해당 데이터와 관련된 외부 데이터 즉, 도메인 지식의 중요성을 다시 한번 느끼게 되었습니다. 구매 감소 모델 생성 시 많은 요인을 적용하면 모델 결과가 떨어지기 때문에 필요한 핵심 요인만 추출하고 새로운 파생 변수를 생성하였는데 그러면서 다양한 방법으로 데이터를 다루는 능력을 향상시켜준 경험이었습니다. 처음에 구매 기간의 시계열적인 부분을 생각하지 않고 데이터를 합쳐서 잘못된 방향으로 갔었지만, 강사님의 조언과 팀원들 간의 소통 및 화합으로 올바른 방향으로 갈 수 있었습니다.|
| 양주희 | 실제 기업의 방대한 데이터를 가지고 예측 모델을 구현하는 프로젝트를 진행하면서 실제 직무와 직결될 수 있는 경험을 하였습니다. 머신러닝을 공부하면서 가볍게 접했던 실습 데이터와는 다르게 기업 데이터를 접하면서 기초적인 분석에 어려움을 느꼈습니다. train과 test의 기간 설정은 어떻게 해야 할지, feature는 어떤 것들을 선정해야 할지 등 방향 잡기에 어려움을 겪었지만, 팀원들과의 계속된 회의 끝에 추천 솔루션까지 잘 마무리할 수 있게 되었습니다. 이번 프로젝트를 통해 모델 구축에 대한 전반적인 흐름과 추천 솔루션에 대한 통찰력을 얻게 되었습니다. | 
| 진청아 | 엄청난 크기의 실제 데이터를 팀원들과 함께 분석하면서 여러 어려움을 겪기도 했었지만 배운 점도 많았습니다. 데이터를 표면적으로만 보았을 때와 Deep-Dive를 통하여 내부를 보았을 때 확연히 다른 인사이트를 얻을 수 있는 것에 큰 흥미를 느꼈고 정밀한 탐색적 분석의 중요성을 크게 깨닫게 되었습니다. 과거 구매 기록이란 시차열 데이터를 활용하여 구매 감소 고객을 분류하는 모델을 만들어야 했기 때문에 어떤 기준으로 훈련 데이터와 검증 및 테스트 데이터를 정의해야 할지 헷갈리면서 어렵게 느껴졌었지만 꾸준한 팀원들과의 회의 및 강사님의 피드백을 통해 모델을 잘 구현할 수 있었던 것 같습니다. 

[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fchoi-aerim%2F220924_1027-ML-project&count_bg=%23D54A1C&title_bg=%23555555&icon=myspace.svg&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://hits.seeyoufarm.com)
