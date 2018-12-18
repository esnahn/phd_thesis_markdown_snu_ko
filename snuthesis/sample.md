---
entitle: "Calculus, Analysis, Mathematical Statistics, \\\ Statistical Computinig and Lab; Regression Analysis" # 영문 제목. 중간에 줄 넘기기를 위해서는 백슬래시 3개가 필요함.
kotitle: "미적분학 해석학 수리통계학 확률의 개념 및 응용, \\\ 전산통계 및 실험 그리고 회귀분석 및 실험" # 국문 제목. 중간에 줄 넘기기를 위해서는 백슬래시 3개가 필요함.
enabstract: abstract.tex # 영문 초록. 
koabstract: koabstract.tex # 국문 초록. 
acknowledgement: acknowledgement.tex # 감사의 글. 생략 가능 (파일명 대신 'false'를 적으면 됨.).
bibliography: references.bib # 참고문헌. 중간에 있는 bibliography 블록을 확인할 것. 
author: "홍길동" # 작성자.
enauthor: "Hong Gildong" # 영문 성명.
authorrun: "홍 길 동"  # 선택 사항. 특정 위치에 이름을 띄어 쓰고자 할 때.
advisor: "이 교 수"
graddate: "2018 년 2 월" # 한글. 학위 수여일.
submissiondate: "2017 년 11 월" # 한글. 논문 제출기한 기준.
approvaldate: "2017 년 12 월" # 한글. 논문 종심기한 기준.
twoside: false # true: 양면, false: 단면
biblio-style: apalike # one of: plain, unsrt, alpha, abbrv, acm, apalike, siam, plainnat, abbrvnat, unsrtnat, etc.
# When you change biblio-style, you should remove all *.bbl and *.aux files related before you build pdf file again.
phd: true # true: 박사학위논문, false: 석사학위논문
ko: false # true: 한글로 작성하는 논문, false: 영어로 작성하는 논문
committee: # 논문심사위원. 석사는 3인, 박사는 5인. 
  - Freddie Mercury
  - 이 교 수
  - Brian May
  - Roger Taylor
  - John Deacon
enkeyword: # 영문 키워드. 최대 6개까지.
  - Alpha
  - Bravo
  - Charlie
  - Delta
kokeyword: # 국문 키워드. 최대 6개까지.
  - 갑
  - 을
  - 병
  - 정
studentid: "2014-12345" # 학번.
header-includes:  # header에 넣고 싶은 내용 아무거나. 주로 추가적인 패키지 로딩. 
- \usepackage{algorithmicx} 
output: 
  pdf_document:
    citation_package: natbib # 참고문헌 처리 패키지. 여기서는 natbib으로 설정.
    template: "sample_template.tex"
    keep_tex: true
    pandoc_args: [
      "--chapters"
    ]
---


# Introduction
It would be much clean to white thesis using markdown. e.g., there are some [github](https://github.com) repositories dedicated  for this. https://github.com/tompollard/phd_thesis_markdown is an example.

\begin{figure}
\begin{center}
\includegraphics[width=\textwidth]{figs/Octocat}
\end{center}
\caption{A cute Octocat. Yes, we are on GitHub!!!}
\end{figure}

\begin{table}
\caption{A simple table.}
\begin{center}
\begin{tabular}{ l | c | r }
  1 & 2 & 3 \\
  4 & 5 & 6 \\
  7 & 8 & 9 \\
\end{tabular}
\end{center}
\end{table}

# A Great Model


## Something even better


### Even a better one?

* It is easy to make a list in markdown.
* seriously!


1. Even a numbered list.
2. don't ya think?

\begin{table}
\caption{Just another table.}
\begin{center}
\begin{tabular}{ l | c | r }
  1 & 2 & 3 \\
  4 & 5 & 6 \\
  7 & 8 & 9 \\
\end{tabular}
\end{center}
\end{table}

# Conclusion

Argh. Why am I doing this? @Nesterov:DoklAkadNaukSssr:1983 \citep{Boyd:ConvexOptimization:2004} \citet{Bertsekas:ConvexOptimizationTheory:2009}

<!-- DO NOT REMOVE THE FOLLOWING!!!!!!!! -->
<!-- references. --> 
<!-- note: this is how to use comments 
in a markdown file.-->
<!-- I know it's not clean... -->
\addcontentsline{toc}{chapter}{\bibname}
<!-- set to your bibliography file name -->
\bibliography{references} 
<!-- DO NOT REMOVE THE ABOVE!!!!!!!! -->

<!-- Remove the below if you don't have any appendices -->
\appendix

# How to use Appendix

Just add appendix here!
After peeking through many of theses, it was clear that most of the students are likely to have appendices in their thesis. This causes some messy block like 

```markdown
<!-- references. --> 
<!-- note: this is how to use comments 
in a markdown file.-->
<!-- I know it's not clean... -->
\addcontentsline{toc}{chapter}{\bibname}
<!-- set to your bibliography file name -->
\bibliography{references} 
```
in the middle of the markdown, but I could not find a better way to use appendices than this.


# Dang it
dszf
