<TeXmacs|2.1.3>

<style|<tuple|generic|chinese>>

<\body>
  <doc-data|<doc-title|GMM regression based
  sampling>|<doc-author|<author-data|<author-name|Zhijun
  Zeng>|<\author-affiliation>
    Date: 2023.2.12
  </author-affiliation>>>>

  <\lemma>
    <math|X<rsub|1>\<sim\>\<cal-N\><around|(|\<mu\><rsub|1>,\<sigma\><rsub|1><rsup|2>|)>,X<rsub|2>\<sim\>\<cal-N\><around|(|\<mu\><rsub|2>,\<sigma\><rsub|2><rsup|2>|)>>,
    then <math|a*X<rsub|1>+b*X<rsub|2>\<sim\>\<cal-N\><around|(|a*\<mu\><rsub|1>+b*\<mu\><rsub|2>,a<rsup|2>*\<sigma\><rsub|1><rsup|2>+b<rsup|2>*\<sigma\><rsub|2><rsup|2>|)>>.
  </lemma>

  For each snapshot, the data <math|<around*|{|X<rsub|t><rsup|i>|}><rsub|i=1><rsup|M>\<sim\>P<rsub|t>>
  . Given gaussian number N, we want to fitting such distribution using
  Gaussian Mixture Model:

  <\equation>
    min<rsub|\<omega\><rsub|i>,\<b-mu\><rsub|i>,\<b-Sigma\><rsub|i>>W<rsub|2><around*|(|<big|sum><rsub|i=1><rsup|N>\<omega\><rsub|i>\<cal-N\><around*|(|\<b-mu\><rsub|i>,\<b-Sigma\><rsub|i>|)>,P<rsub|t>|)>
  </equation>

  In GMM model ,Gaussian distributions are not independent to each other ,so\ 
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>