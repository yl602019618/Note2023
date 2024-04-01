<TeXmacs|2.1.3>

<style|<tuple|generic|chinese>>

<\body>
  <doc-data|<doc-title|Neural ODE and Adjoint
  Method>|<doc-author|<author-data|<author-name|Zhijun
  Zeng>|<\author-affiliation>
    Date: 2023.2.1
  </author-affiliation>>>>

  <section|Problem statement>

  The main minimization problem is\ 

  <\equation>
    min<rsub|\<theta\>> L<around*|(|z<around*|(|t<rsub|1>|)>|)>,s.t.
    <wide|z|\<dot\>><around*|(|t|)>=f<rsub|\<theta\>><around*|(|z<around*|(|t|)>,t|)>,z<around*|(|t<rsub|0>|)>=z<rsub|0>
  </equation>

  This problem is a constrained non-linear optimization problem. We need to
  calculate <math|<frac|dL<around*|(|z<around*|(|t<rsub|1>|)>|)>|d\<theta\>>>
  efficiently.

  <section|Lagrangian Sub-Sub-Problem>

  Using Lagrange Multipliers , we derive the new objective like

  <\equation>
    \<psi\>=L<around*|(|z<around*|(|t<rsub|1>|)>|)>-<big|int><rsub|t<rsub|0>><rsup|t<rsub|1>>\<lambda\><around*|(|t|)>F<around*|(|<wide|z|\<dot\>><around*|(|t|)>,z<around*|(|t|)>,\<theta\>,t|)>dt
  </equation>

  where <math|F<around*|(|<wide|z|\<dot\>><around*|(|t|)>,z<around*|(|t|)>,\<theta\>,t|)>=<wide|z<around*|(|t|)>-f<rsub|\<theta\>><around*|(|z<around*|(|t|)>,t|)>|\<dot\>>>
  and the Lagrange Multipler is <math|\<lambda\><around*|(|t|)>>. Then\ 

  <\equation>
    <frac|d\<psi\>|d\<theta\>>=<frac|dL<around*|(|z<around*|(|t<rsub|1>|)>|)>|d\<theta\>>
  </equation>

  Then we can choose <math|\<lambda\><around*|(|t|)>> to avoid hard
  derivatives.

  <section|Simplification>

  <\equation>
    <\aligned>
      <tformat|<table|<row|<cell|<big|int><rsub|t<rsub|0>><rsup|t<rsub|1>>\<lambda\><around|(|t|)>*F*d*t>|<cell|=<big|int><rsub|t<rsub|0>><rsup|t<rsub|1>>\<lambda\><around|(|t|)>*<around|(|<wide|z<around|(|t|)>|\<dot\>>-f|)>*d*t>>|<row|<cell|>|<cell|=<big|int><rsub|t<rsub|0>><rsup|t<rsub|1>>\<lambda\><around|(|t|)><wide|z<around|(|t|)>|\<dot\>>d*t-<big|int><rsub|t<rsub|0>><rsup|t<rsub|1>>\<lambda\><around|(|t|)>*f*d*t>>>>
    </aligned>
  </equation>

  Using integration by parts, we derive that

  <\equation>
    <\aligned>
      <tformat|<table|<row|<cell|<big|int><rsub|t<rsub|0>><rsup|t<rsub|1>>\<lambda\><around|(|t|)>*z<wide|<around|(|t|)>|\<dot\>>*d*t>|<cell|=<around*|\<nobracket\>|\<lambda\><around|(|t|)>*z<around|(|t|)>|\|><rsub|t<rsub|0>><rsup|t<rsub|1>>-<big|int><rsub|t<rsub|0>><rsup|t<rsub|1>>z<around|(|t|)><wide|\<lambda\>|\<dot\>><around|(|t|)>*d*t>>|<row|<cell|>|<cell|=\<lambda\><around*|(|t<rsub|1>|)>*z<around*|(|t<rsub|1>|)>-\<lambda\><around*|(|t<rsub|0>|)>*z<rsub|t<rsub|0>>>>|<row|<cell|>|<cell|-<big|int><rsub|t<rsub|0>><rsup|t<rsub|1>>z<around|(|t|)><wide|\<lambda\><around|(|t|)>|\<dot\>>d*t>>>>
    </aligned>
  </equation>

  Then by substituting it into the original equation\ 

  <\equation>
    <\aligned>
      <tformat|<table|<row|<cell|<big|int><rsub|t<rsub|0>><rsup|t<rsub|1>>\<lambda\><around|(|t|)>*F*d*t>|<cell|=\<lambda\><around*|(|t<rsub|1>|)>*z<around*|(|t<rsub|1>|)>-\<lambda\><around*|(|t<rsub|0>|)>*z<rsub|t<rsub|0>>>>|<row|<cell|>|<cell|-<big|int><rsub|t<rsub|0>><rsup|t<rsub|1>><around|(|z<wide|\<lambda\>|\<dot\>>+\<lambda\>*f|)>*d*t>>>>
    </aligned>
  </equation>

  <\equation>
    <\aligned>
      <tformat|<table|<row|<cell|<frac|<math-up|d>|<math-up|d>\<theta\>><around*|[|<big|int><rsub|t<rsub|0>><rsup|t<rsub|1>>\<lambda\>*F*d*t|]>>|<cell|=\<lambda\><around*|(|t<rsub|1>|)><frac|<math-up|d>z<around*|(|t<rsub|1>|)>|<math-up|d>\<theta\>>-<around*|(|<wide*|\<lambda\><around*|(|t<rsub|0>|)><frac|<math-up|d>z<rsub|t*0>|<math-up|d>\<theta\>>|\<wide-underbrace\>><rsub|z<rsub|t<rsub|0>><text|is
      input >>|)> 0>>|<row|<cell|>|<cell|-<big|int><rsub|t<rsub|0>><rsup|t<rsub|1>><around*|(|<frac|<math-up|d>z|<with|math-font-family|rm|<nbsp>d>\<theta\>>*<wide|\<lambda\>|\<dot\>>+\<lambda\>*<frac|<math-up|d>f|<with|math-font-family|rm|<nbsp>d>\<theta\>>|)>*d*t>>>>
    </aligned>
  </equation>

  \ Using chain rule of <math|<frac|df|d\<theta\>>=<frac|\<partial\>
  f|\<partial\> \<theta\>>+<frac|\<partial\> f|\<partial\>
  z><frac|dz|d\<theta\>>>,

  <\equation>
    <\aligned>
      <tformat|<table|<row|<cell|<frac|<math-up|d>|<math-up|d>\<theta\>><around*|[|<big|int><rsub|t<rsub|0>><rsup|t<rsub|1>>\<lambda\>*F*d*t|]>>|<cell|=\<lambda\><around*|(|t<rsub|1>|)><frac|<math-up|d>z<around*|(|t<rsub|1>|)>|<math-up|d>\<theta\>>>>|<row|<cell|>|<cell|-<big|int><rsub|t<rsub|0>><rsup|t<rsub|1>><around*|(|<wide|\<lambda\>|\<dot\>>+\<lambda\>*<frac|\<partial\>*f|\<partial\>*z>|)>*<frac|<math-up|d>z|<with|math-font-family|rm|<nbsp>d>\<theta\>>*d*t>>|<row|<cell|>|<cell|-<big|int><rsub|t<rsub|0>><rsup|t<rsub|1>>\<lambda\>*<frac|\<partial\>*f|\<partial\>*\<theta\>>*d*t>>>>
    </aligned>
  </equation>

  Also using the chain rule we have

  <\equation>
    <frac|<math-up|d>L|<with|math-font-family|rm|<nbsp>d>\<theta\>>=<frac|\<partial\>*L|\<partial\>*z<around*|(|t<rsub|1>|)>>*<frac|<math-up|d>z<around*|(|t<rsub|1>|)>|<math-up|d>\<theta\>>-<frac|<math-up|d>|<math-up|d>\<theta\>><around*|[|<big|int><rsub|t<rsub|0>><rsup|t<rsub|1>>\<lambda\>*F*d*t|]>
  </equation>

  by combine all the derivation together

  <\equation>
    <\aligned>
      <tformat|<table|<row|<cell|<frac|<math-up|d>L|<with|math-font-family|rm|<nbsp>d>\<theta\>>>|<cell|=<around*|[|<frac|\<partial\>*L|\<partial\>*z<around*|(|t<rsub|1>|)>>-\<lambda\><around*|(|t<rsub|1>|)>|]>*<frac|<math-up|d>z<around*|(|t<rsub|1>|)>|<math-up|d>\<theta\>>>>|<row|<cell|>|<cell|+<big|int><rsub|t<rsub|0>><rsup|t<rsub|1>><around*|(|<wide|\<lambda\>|\<dot\>><around|(|t|)>+\<lambda\><around|(|t|)><frac|\<partial\>*f|\<partial\>*z>|)>*<frac|<math-up|d>z<around|(|t|)>|<math-up|d>\<theta\>>*d*t>>|<row|<cell|>|<cell|+<big|int><rsub|t<rsub|0>><rsup|t<rsub|1>>\<lambda\><around|(|t|)><frac|\<partial\>*f|\<partial\>*\<theta\>>*d*t>>>>
    </aligned>
  </equation>

  <\itemize>
    <item><math|<frac|\<partial\>L|\<partial\>
    z<around*|(|t<rsub|1>|)>>>:Gradient of loss with respect to output.

    <item><math|<frac|\<partial\> z<around*|(|t<rsub|1>|)>|\<partial\>\<theta\>>>:Gradient
    of loss with respect to output,not easy.

    <item><math|<wide|\<lambda\>|\<dot\>><around*|(|t|)>>:Derivative of
    lambda, a vector, with respect to time.

    <item><math|\<lambda\><around*|(|t|)><frac|\<partial\> f|\<partial\>
    z>>:vector -Jacobian product.Can compute with reverse mode autodiff
    without explicitly constructing Jacobian
    <math|<frac|\<partial\>f|\<partial\> z>>.

    <item><math|<frac|dz<around*|(|t|)>|d\<theta\>>>:Jacobian of arbitrary
    layer with respect to params,not easy.

    <item><math|\<lambda\><around*|(|t|)><frac|\<partial\>f \ |\<partial\>
    \<theta\>>>:vector-Jacobian Product. Can compute with reverse mode
    autodiff without explicitly constructing Jacobian <math|<frac|\<partial\>
    f|\<partial\> \<theta\>>>
  </itemize>

  Now the problem is to computing <math|<frac|dz<around*|(|t|)>|d\<theta\>>>
  at each point t. To get rid of this computation , we choose\ 

  <\equation>
    <wide|\<lambda\>|\<dot\>><around*|(|t|)>=-\<lambda\><around*|(|t|)><frac|\<partial\>f|\<partial\>
    z>,s.t.\<lambda\><around*|(|t<rsub|1>|)>=<frac|\<partial\>L|\<partial\>z<around*|(|t<rsub|1>|)>>
  </equation>

  This giving <math|\<lambda\><around*|(|t<rsub|0>|)>=\<lambda\><around*|(|t<rsub|1>|)>-<big|int><rsub|t<rsub|1>><rsup|t<rsub|<rsub|0>>>\<lambda\><around*|(|t|)><frac|\<partial\>f|\<partial\>z>dt>.
  Then the equation will be simplified as

  <\equation>
    <frac|dL|d\<theta\>>=-<big|int><rsub|t<rsub|1>><rsup|t<rsub|0>>\<lambda\><around*|(|t|)><frac|\<partial\>f|\<partial\>\<theta\>>dt
  </equation>

  \;

  <section|Implicit Layers>

  Explicit layer definining what a layer is\ 

  <\equation>
    z=f<around*|(|x|)>
  </equation>

  Implicit layer defining what a layer does

  <\equation>
    z:g<around*|(|z,x|)>=0
  </equation>

  Of course implicit layer requires a root computing algorithm.

  <subsection|Forward propagation>

  Here we utilize the fixed point theorem.Considering a function
  <math|f:\<bbb-R\><rsup|n>\<rightarrow\>\<bbb-R\><rsup|n>> with a fixed
  point <math|z\<in\>\<bbb-R\><rsup|n>> , which means\ 

  <\equation>
    z=f<around*|(|z|)>
  </equation>

  The optimization process\ 

  <\equation>
    w=f<around*|(|w|)> where f<around*|(|w|)>=w-\<eta\><frac|\<partial\>
    l|\<partial\> w>
  </equation>

  More generally ,we can have paramterised fixed point problem:
  <math|f:\<bbb-R\><rsup|p>\<times\>\<bbb-R\><rsup|n>\<rightarrow\>\<bbb-R\><rsup|n>><space|1em>with
  parameter <math|\<alpha\>\<in\>\<bbb-R\><rsup|p>>

  <\equation>
    z=f<around*|(|\<alpha\>,z|)>
  </equation>

  \;
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
    <associate|auto-3|<tuple|3|1>>
    <associate|auto-4|<tuple|4|?>>
    <associate|auto-5|<tuple|4.1|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Problem
      statement> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Lagrangian
      Sub-Sub-Problem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Simplification>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>