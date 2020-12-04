<!-- 동의서는 심사위원 전원이 날인된 논문 1부에만 부착하기 때문에 한번만 별도로 출력하면 됨. -->

\cleardoublepage

\makeatletter
\includepdf[
  pages=1,
  width=\Gm@layoutwidth,
  height=\Gm@layoutheight,
  keepaspectratio
  ]{source/ThesisDissertationAgreement.pdf}
\makeatother

\pagenumbering{gobble}
