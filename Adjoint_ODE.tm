<TeXmacs|2.1.3>

<style|<tuple|generic|chinese>>

<\body>
  <doc-data|<doc-title|Adjoint Method For ODE identification with Wasserstein
  Distance >|<doc-author|<author-data|<author-name|Zhijun
  Zeng>|<\author-affiliation>
    DATE: 2023.02.06
  </author-affiliation>>>>

  <section|Problem Statement>

  Given a specific dynamic system

  <\equation>
    <wide|y|\<dot\>> <around*|(|t|)>=g<around*|(|t,y<around*|(|t|)>|)>,y<around*|(|0|)>=y<rsub|0>
  </equation>

  We can generate the observation given time label
  <math|<around*|{|t<rsub|i>|}><rsub|i=1><rsup|n>> as
  <math|<around*|{|y<rsub|t<rsub|i>>|}><rsub|i=1><rsup|n>>. Suppose for fixed
  <math|y<rsub|0>> , the solution with time label sampled uniformly from
  <math|t=0> to <math|t=T> obeys distribution <math|\<rho\><rsub|T>>. Our
  target is to learning such distribution with parametrized dynamic system

  <\equation>
    <wide|z<rsub|\<theta\>>|\<dot\>><around*|(|t|)>=f<around*|(|t,z<rsub|\<theta\>><around*|(|t|)>,\<theta\>|)>
  </equation>

  For each training epoch we sample a batch <math|m> uniformly from
  <math|t=0> to <math|t=T> with a constant initial condition
  <math|z<rsub|0>=y<rsub|0>> and compute the solution as
  <math|<around*|{|z<rsub|0>,z<rsub|1>,\<ldots\>,z<rsub|m>|}>>. Besides,
  sample another batch <math|m> uniformly from <math|t=0> to <math|t=T> and
  observe the real solution <math|<around*|{|y<rsub|0>,y<rsub|1>,\<ldots\>,y<rsub|m>|}>>.
  For each batch, the loss is defined as\ 

  <\equation>
    \<cal-L\><around*|(|t<rsup|1><rsub|0>,\<ldots\>t<rsup|1><rsub|m>,t<rsub|0><rsup|2>,\<ldots\>,t<rsub|m><rsup|2>,z<around*|(|t<rsub|0><rsup|1>|)>,\<ldots\>z<around*|(|t<rsub|m><rsup|1>|)>,y<around*|(|t<rsub|0><rsup|2>|)>,\<ldots\>,y<around*|(|t<rsub|m><rsup|2>|)>,\<theta\>|)>=SWD<around*|(|<around*|{|z<around*|(|t<rsub|0><rsup|1>|)>,\<ldots\>z<around*|(|t<rsub|m><rsup|1>|}>,<around*|{|y<around*|(|t<rsub|0><rsup|2>|)>,\<ldots\>,y<around*|(|t<rsub|m><rsup|2>|)>|}>
    |)>|\<nobracket\>>
  </equation>

  where SWD are sliced-wasserstein distance. By using Lagrange Multipler
  method , we denote the unconstrained target

  <\equation>
    \<cal-J\><around*|(|\<theta\>|)>=\<cal-L\><around*|(|z<around*|(|t<rsub|0>|)>,z<around*|(|t<rsub|1>|)>,\<ldots\>,z<around*|(|t<rsub|m>|)>|)>+<big|sum><rsub|i=1><rsup|N><big|int><rsub|t<rsub|0>><rsup|t<rsub|i>>a<around*|(|t|)><around*|(|<wide|z|\<dot\>><around*|(|t|)>-f<around*|(|t,z<around*|(|t|)>,\<theta\>|)>|)>dt
  </equation>

  our target is to minimize the target function

  <\equation>
    min<rsub|\<theta\>>\<cal-J\><around*|(|\<theta\>|)>=min<rsub|\<theta\>>
    \<cal-L\><around*|(|z<around*|(|t<rsub|0>|)>,z<around*|(|t<rsub|1>|)>,\<ldots\>,z<around*|(|t<rsub|m>|)>|)>+<big|sum><rsub|i=1><rsup|N><big|int><rsub|t<rsub|0>><rsup|t<rsub|i>>a<around*|(|t|)><around*|(|<wide|z|\<dot\>><around*|(|t|)>-f<around*|(|t,z<around*|(|t|)>,\<theta\>|)>|)>dt
  </equation>

  <section|Adjoint Method>

  The difference of the Lagrange target function is computed as

  <\equation>
    <\aligned>
      <tformat|<table|<row|<cell|\<cal-J\><around|(|\<theta\>|)>-\<cal-J\><around*|(|\<theta\><rsup|\<ast\>>|)>=>|<cell|\<cal-L\><around*|(|z<around*|(|t<rsub|1>|)>,z<around*|(|t<rsub|2>|)>*\<cdots\>,z<around*|(|t<rsub|m>|)>|)>-\<cal-L\><around*|(|z<rsup|\<ast\>><around*|(|t<rsub|1>|)>,z<rsup|\<ast\>><around*|(|t<rsub|2>|)>*\<cdots\>,z<rsup|\<ast\>><around*|(|t<rsub|m>|)>|)>>>|<row|<cell|>|<cell|+<big|sum><rsub|i=1><rsup|m><big|int><rsub|t<rsub|0>><rsup|t<rsub|i>>a<around|(|t|)>*<around*|(|<wide|z|\<dot\>><around|(|t|)>-<wide|z|\<dot\>><rsup|\<ast\>><around|(|t|)>|)>*d*t>>|<row|<cell|>|<cell|-<big|sum><rsub|i=1><rsup|m><big|int><rsub|t<rsub|0>><rsup|t<rsub|i>>a<around|(|t|)>*<around*|(|f<around|(|t,z,\<theta\>|)>-f<around*|(|t,z<rsup|\<ast\>>,\<theta\><rsup|\<ast\>>|)>|)>*d*t.<label|unc>>>>>
    </aligned>
  </equation>

  where <math|<wide|z|\<dot\>><around*|(|t|)>=f<around*|(|t,z<around*|(|t|)>,\<theta\>|)>>
  and <math|<wide|z<rsup|\<ast\>>|\<dot\>><around*|(|t|)>=f<around*|(|t,z<around*|(|t|)>,\<theta\><rsup|\<ast\>>|)>>.

  We analyse the small perturbation of <math|\<theta\>> to obtain the
  gradient. Let <math|\<theta\>=\<theta\><rsup|\<ast\>>+\<varepsilon\>\<zeta\>>
  ,then\ 

  <\equation>
    z<around*|(|t|)>=z*<rsup|\<ast\>><around*|(|t|)>+\<varepsilon\>\<eta\><around*|(|t|)>+\<cal-O\><around*|(|\<varepsilon\><rsup|2>|)>
  </equation>

  <\lemma>
    \ The perturbations <math|\<eta\>*<around*|(|t|)> >to the trajectory
    caused by the perturbations of parameters also satisfifies an ODE

    <\equation>
      <wide|\<eta\>|\<dot\>><around*|(|t|)>=<frac|\<partial\>f|\<partial\>z><around*|(|t,z<rsup|\<ast\>><around*|(|t|)>,\<theta\><rsup|\<ast\>>|)>\<eta\><around*|(|t|)>+<frac|\<partial\>f|\<partial\>\<theta\>><around*|(|t,z<rsup|\<ast\>><around*|(|t|)>,\<theta\><rsup|\<ast\>>|)>\<zeta\><around*|(|t|)>
    </equation>
  </lemma>

  <\proof>
    It is easy to check that <math|\<eta\><around*|(|*t|)>=z<rsub|\<varepsilon\>><around*|(|t|)><around*|\||<rsub|\<varepsilon\>=0>|\<nobracket\>>.>
    Further

    <\equation>
      <math|<wide|\<eta\>|\<dot\>><around|(|t|)>=<around*|\<nobracket\>|z<rsub|t,\<epsilon\>><around|(|t|)>|\|><rsub|\<epsilon\>=0>=<around*|\<nobracket\>|z<rsub|\<epsilon\>,t><around|(|t|)>|\|><rsub|\<epsilon\>=0>=<around*|\<nobracket\>|<frac|d|d*\<epsilon\>>|\|><rsub|\<epsilon\>=0>*z<rsub|\<varepsilon\>><around|(|t|)>>,
    </equation>

    recall that <math|<wide|z|\<dot\>><around*|(|t|)>=f<around*|(|t,z<around*|(|t|)>,\<theta\>|)>>,
    we have

    <\equation>
      <wide|\<eta\>|\<dot\>><around|(|t|)>=<around*|\<nobracket\>|<frac|d|d*\<epsilon\>>|\|><rsub|\<epsilon\>=0>*f<around*|(|t,z<rsup|\<ast\>>+\<epsilon\>*\<eta\>+\<cal-O\><around*|(|\<epsilon\><rsup|2>|)>,\<theta\><rsup|\<ast\>>+\<epsilon\>*\<zeta\>|)>=<around*|\<nobracket\>|f<rsub|z>|\|><rsub|\<ast\>>*\<eta\><around|(|t|)>+<around*|\<nobracket\>|f<rsub|\<theta\>>|\|><rsub|\<ast\>>*\<zeta\><around|(|t|)>
    </equation>

    \;
  </proof>

  Recall <eqref|unc> , the first term yields

  <\equation>
    \<cal-L\><around*|(|z<around*|(|t<rsub|1>|)>,z<around*|(|t<rsub|2>|)>*\<cdots\>,z<around*|(|t<rsub|m>|)>|)>-\<cal-L\><around*|(|z<rsup|\<ast\>><around*|(|t<rsub|1>|)>,z<rsup|\<ast\>><around*|(|t<rsub|2>|)>*\<cdots\>,z<rsup|\<ast\>><around*|(|t<rsub|m>|)>|)>=<big|sum><rsub|i=1><rsup|m><frac|\<partial\>\<cal-L\>|\<partial\>z<around*|(|t<rsub|i>|)>><around*|\||<rsub|\<ast\>>|\<nobracket\>>\<varepsilon\>\<eta\>*<around*|(|t<rsub|i>|)>+\<cal-O\><around*|(|\<varepsilon\><rsup|2>|)>
  </equation>

  The second term yields by integration by part

  <\equation>
    <big|sum><rsub|i=1><rsup|m><big|int><rsub|t<rsub|0>><rsup|t<rsub|i>>a<around|(|t|)>*<around*|(|<wide|z|\<dot\>><around|(|t|)>-<wide|z|\<dot\>><rsup|\<ast\>><around|(|t|)>|)>*d*t
    =<big|sum><rsub|i=1><rsup|m>a<around*|(|t|)><around*|(|z<around*|(|t|)>-z<rsup|\<ast\>><around*|(|t|)>|)><around*|\||<rsup|t<rsub|i>><rsub|t<rsub|0>>|\<nobracket\>>-<big|int><rsub|t<rsub|0>><rsup|t<rsub|i>><wide|a|\<dot\>><around*|(|t|)><around*|(|z<around*|(|t|)>-z<rsup|\<ast\>><around*|(|t|)>|)>dt=<big|sum><rsub|i=1><rsup|m>a<around*|(|t<rsub|i>|)>\<varepsilon\>\<eta\><around*|(|t<rsub|i>|)>-<big|int><rsub|t<rsub|o>><rsup|t<rsub|i>><wide|a|\<dot\>><around*|(|t|)>\<varepsilon\>\<eta\><around*|(|t|)>dt+\<cal-O\><around*|(|\<varepsilon\><rsup|2>|)>,
  </equation>

  The third term yields

  <\equation>
    -<big|sum><rsub|i=1><rsup|m><big|int><rsub|t<rsub|0>><rsup|t<rsub|i>>a<around|(|t|)>*<around*|(|f<around|(|t,z,\<theta\>|)>-f<around*|(|t,z<rsup|\<ast\>>,\<theta\><rsup|\<ast\>>|)>|)>*d*t=-<big|sum><rsub|i=1><rsup|m><big|int><rsub|t<rsub|0>><rsup|t<rsub|i>>a<around*|(|t|)><around*|(|<frac|\<partial\>f|\<partial\>z><around*|(|t,z<rsup|\<ast\>><around*|(|t|)>,\<theta\><rsup|\<ast\>>|)>\<varepsilon\>\<eta\><around*|(|t|)>+<frac|\<partial\>f|\<partial\>\<theta\>><around*|(|t,z<rsup|\<ast\>><around*|(|t|)>,\<theta\><rsup|\<ast\>>|)>\<varepsilon\>\<zeta\><around*|(|t|)>|)>dt+\<cal-O\><around*|(|\<varepsilon\><rsup|2>|)>.
  </equation>

  Combine all the result together, we have

  <\equation>
    <\aligned>
      <tformat|<table|<row|<cell|J<around|(|\<theta\>|)>-J<around*|(|\<theta\><rsup|\<ast\>>|)>=>|<cell|<big|sum><rsub|i=1><rsup|N><around*|(|a<around*|(|t<rsub|i>|)>+<around*|\<nobracket\>|<frac|\<partial\>*L|\<partial\>*z<around*|(|t<rsub|i>|)>>|\|><rsub|\<ast\>>|)>*\<epsilon\>*\<eta\><around|(|t|)>>>|<row|<cell|>|<cell|-<big|sum><rsub|i=1><rsup|N><big|int><rsub|t<rsub|0>><rsup|t<rsub|i>><around*|(|<wide|a|\<dot\>><around|(|t|)>+<around*|\<nobracket\>|a<around|(|t|)><frac|\<partial\>*f|\<partial\>*z>|\|><rsub|\<ast\>>|)>*\<epsilon\>*\<eta\><around|(|t|)>*d*t>>|<row|<cell|>|<cell|-<around*|\<nobracket\>|<big|sum><rsub|i=1><rsup|N><big|int><rsub|t<rsub|0>><rsup|t<rsub|i>>a<around|(|t|)><frac|\<partial\>*f|\<partial\>*\<theta\>>|\|><rsub|\<ast\>>*\<epsilon\>*\<zeta\><around|(|t|)>*d*t+\<cal-O\><around*|(|\<epsilon\><rsup|2>|)>>>>>
    </aligned>
  </equation>

  Thus, by letting the adjoint equation be as follow

  <\equation>
    <wide|a|\<dot\>><around*|(|t|)>=-a<around*|(|t|)><frac|\<partial\>f|\<partial\>z><around*|\||<rsub|\<ast\>>|\<nobracket\>>,with
    a<around*|(|t<rsub|i>|)>=<frac|\<partial\>\<cal-L\>|\<partial\>z<around*|(|t<rsub|i>|)>><around*|\||<rsub|\<ast\>>|\<nobracket\>>,i=1,2,\<ldots\>,m
  </equation>

  we have the compact form of the difference as\ 

  <\equation>
    J<around|(|\<theta\>|)>-J<around*|(|\<theta\><rsup|\<ast\>>|)>=-<big|sum><rsub|i=1><rsup|m><big|int><rsub|t<rsub|0>><rsup|t<rsub|i>>a<around*|(|t|)><frac|\<partial\>f|\<partial\>\<theta\>><around*|\||<rsub|\<ast\>>\<varepsilon\>\<zeta\>|\<nobracket\>><around*|(|t|)>dt+\<cal-O\><around*|(|\<varepsilon\><rsup|2>|)>
  </equation>

  we have the gradient of Lagrange loss as

  <\equation>
    <frac|dJ|d\<theta\>>=-<big|sum><rsub|i=1><rsup|m><big|int><rsub|t<rsub|0>><rsup|t<rsub|m>>a<around*|(|t|)><frac|\<partial\>f|\<partial\>\<theta\>><around*|\||<rsub|\<ast\>>|\<nobracket\>>dt=-<big|sum><rsub|i=m><rsup|1><around*|(|m-i+1|)><big|int><rsub|t<rsub|i-1>><rsup|t<rsub|i>>a<around*|(|t|)><frac|\<partial\>f|\<partial\>\<theta\>><around*|\||<rsub|\<ast\>>|\<nobracket\>>dt
  </equation>

  \;

  \;

  \ 
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|1>>
    <associate|unc|<tuple|6|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Problem
      Statement> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Adjoint
      Method> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>