<TeXmacs|2.1.3>

<style|<tuple|generic|chinese>>

<\body>
  <doc-data|<doc-title|Theory of Identification of ODE system with
  Distributional Observation>|<doc-author|<author-data|<author-name|Zhijun
  Zeng>>>>

  <section|Problem setting>

  Given an nonlinear ODE system

  <\equation>
    <tabular*|<tformat|<table|<row|<cell|<frac|dy|dt>>|<cell|=>|<cell|f<around*|(|y,t|)>>>|<row|<cell|y<around*|(|0|)>>|<cell|=>|<cell|y<rsub|0>>>>>>
  </equation>

  The solution of this system in interval <math|t\<in\><around*|[|0,T|]>> is
  given by <math|y<around*|(|t|)>>. Suppose one sample observation in a
  uniform distributional manner, that is <math|X\<sim\>y<around*|(|\<cal-U\><around*|[|0,T|]>|)>>
  , the total observation then become the emperical distribution
  <math|<around*|{|x<rsub|i>|}><rsub|i=1><rsup|N>\<sim\>X>. So the question
  is can we recover <math|y<around*|(|t|)>> or <math|f<around*|(|y,t|)>> from
  such observation.

  <section|Result>

  <\theorem>
    Any non-descreasing left-continuous normal Function on <math|\<bbb-R\>>
    is a distribution function of a random variable.
  </theorem>

  <\proof>
    Let probability space be <math|<around*|(|\<Omega\>,\<cal-F\>,P|)>> ,
    <math|Y\<sim\>\<cal-U\><around*|[|0,1|]>>, then consider a random
    variable <math|X=F<rsup|-1><around*|(|Y|)>,>we then prove that the
    distribution function of X is <math|F<around*|(|x|)>>.

    First,\ 

    <\equation>
      F<around*|(|x|)>\<gtr\>u\<Leftrightarrow\>x\<gtr\>F<rsup|-1><around*|(|u|)>
    </equation>

    and for any <math|x\<in\>\<bbb-R\>>, <math|F<around*|(|x|)>\<in\>\<bbb-R\>>,
    thus\ 

    <\equation>
      <around*|(|X\<less\>x|)>=<around*|(|F<rsup|-1><around*|(|Y|)>\<less\>x|)>=<around*|(|Y\<less\>F<around*|(|x|)>|)>\<in\>\<cal-F\>
    </equation>

    thus <math|X > is a random variable , notice that Y is a uniform
    distribution,

    <\equation>
      P<around*|(|X\<less\>x|)>=P<around*|(|F<rsup|-1><around*|(|Y|)>\<less\>x|)>=P<around*|(|Y\<less\>F<around*|(|x|)>|)>=F<around*|(|x|)>
    </equation>

    \;
  </proof>

  This theorem shows that in 1-dimensional observation ,if the distributional
  function is observed as <math|F<around*|(|x|)>> then the transformation
  will be <math|y<around*|(|x|)>=F<rsup|-1><around*|(|x|)>>

  More generally, suppose we have a random variable <math|X> and a
  transformation function <math|F<around*|(|\<cdot\>|)>>, set
  <math|Y<rsub|>=F<around*|(|X|)>>. suppose <math|F> is 1-1 map, moreover
  which is strictly increasing or descreasing which implies that

  <\equation>
    P<around*|(|Y\<leqslant\>F<around*|(|x|)>|)>=P<around*|(|X\<leqslant\>x|)>
  </equation>

  therefore for <math|y=F<around*|(|x|)>>

  <\equation>
    P<rsub|Y><around*|(|y|)>=P<rsub|Y><around*|(|F<around*|(|x|)>|)>=P<rsub|X><around*|(|x|)>
  </equation>

  This relationship between CDFs leads directly to the relationship between
  their PDFs. If we assume this derivative is greater than<nbsp>0,
  differentiating gives

  <\equation>
    p<rsub|Y><around*|(|y|)><frac|dF|dx><around*|(|x|)>=p<rsub|X><around*|(|x|)>
  </equation>

  Then

  <\equation>
    p<rsub|Y><around*|(|y|)>=<around*|\||<frac|dF|dx>|\|><rsup|-1>p<rsub|x><around*|(|x|)>=<around*|\||<frac|dF|dx>|\|><rsup|-1><around*|(|F<rsup|-1><around*|(|y|)>|)>p<rsub|x><around*|(|F<rsup|-1><around*|(|y|)>|)>
  </equation>

  Here for X is uniformly distributed over <math|<around*|[|0,1|]>> then
  <math|p<rsub|x>=1>, for previous theorem the
  <math|Y=F<rsup|-1><around*|(|X|)>> follows
  <math|P<rsub|Y><around*|(|y|)>=F<around*|(|y|)>>

  <\equation>
    1=p<rsub|X><around*|(|x|)>=<frac|dF|dx>*<frac|dF<rsup|-1>|dx>
  </equation>

  <\theorem>
    Let <math|X> be random variable with distributional function
    <math|F<rsub|X><around*|(|x|)>> and probability density function
    <math|p<rsub|X><around*|(|x|)>>, the transformation
    <math|u=g<around*|(|t|)>> is a strictly increasing or decreasing , whose
    inverse function is given by <math|h<around*|(|u|)>=g<rsup|-1><around*|(|u|)>>
    is<space|1em>a smooth function (at least first order differentiable) in
    <math|<around*|[|\<alpha\>,\<beta\>|]>>, then <math|Y=g<around*|(|X|)> >
    has density function

    <\equation>
      p<rsub|Y><around*|(|x|)>=p<rsub|X><around*|(|h<around*|(|x|)>|)><around*|\||h<rprime|'><around*|(|x|)>|\|>=p<rsub|X><around*|(|g<rsup|-1><around*|(|x|)>|)><around*|\||g<rsup|-1><rprime|'><around*|(|x|)>|\|>,x\<in\><around*|[|\<alpha\>,\<beta\>|]>
    </equation>
  </theorem>

  <\proof>
    Assuming that <math|g> is strictly increasing, then

    <\equation>
      F<rsub|Y><around*|(|x|)>=P<around*|(|Y\<less\>x|)>=P<around*|(|g<around*|(|X|)>\<less\>x|)>=P<around*|(|X\<less\>h<around*|(|x|)>|)>=F<rsub|X><around*|(|h<around*|(|x|)>|)>
    </equation>

    then\ 

    <\equation>
      p<rsub|Y><around*|(|x|)>=<frac|d|dx>F<rsub|X><around*|(|h<around*|(|x|)>|)>=p<rsub|X><around*|(|h<around*|(|x|)>|)>h<rprime|'><around*|(|x|)>
    </equation>

    \;
  </proof>

  So our problem is we have <math|p<rsub|X><around*|(|x|)>> and
  <math|p<rsub|X><around*|(|h<around*|(|x|)>|)>h<rprime|'><around*|(|x|)>> we
  want to recover <math|g<around*|(|x|)>> or
  <math|h<around*|(|x|)>=g<rsup|-1><around*|(|x|)>>.\ 

  The problem\ 

  \ 

  \ \ 
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
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Problem
      setting> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Result>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>