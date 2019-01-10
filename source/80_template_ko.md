
# 템플릿과 한글 {#sec:한글}

## 인용

대괄호를 붙이지 않으면 빈 칸이 필요하기 때문에,
본문 안에 인용할 때는 저자명을 수동으로 적고 김태석 등[-@김태석2018국내]은 연도만 붙이는 것으로 하였다. [@김태석2018국내, pp. 99-999]

내부 참조는 [-@sec:한글]장[^장이름], [@sec:캡션]이나 [@tbl:표-예시; @fig:그림들-셋]로,
또는 다음과 같이 참조할 수 있다. (@sec:캡션, @tbl:표-예시, [@fig:그림-예시; @fig:그림들])

[^장이름]: 장과 절을 다르게 처리할 수 없어 장은 번호만 가져와 수동으로 '장'을 붙임

## 캡션 {#sec:캡션}


a         b            c
------ --------- -------
123     456         789
1       2          3

: 표 캡션은
여러 줄에
걸쳐
작성할 수 있음 {#tbl:표-예시}


![그림 캡션은 한 줄로](source/figures/markdown.png){#fig:그림-예시}

<div id="fig:그림들">
![하나](source/figures/docx.png){#fig:그림들-하나 width=50%}
![둘](source/figures/html.png){#fig:그림들-둘 width=50%}

![셋](source/figures/latex.png){#fig:그림들-셋 width=50%}
![넷](source/figures/markdown.png){#fig:그림들-넷 width=50%}

그림들 캡션
</div>