<TeXmacs|2.1.2>

<style|<tuple|generic|chinese>>

<\body>
  <section|Multi-modal Inverse Problem>

  <math|D\<subset\>\<bbb-R\><rsup|d>> bounded
  openset,<math|\<Omega\>=D\<times\><around*|(|0,T|)>>, <math|\<partial\>
  \<Omega\>=\<partial\> D\<times\><around*|(|0,T|)>>.

  Coefficient space <math|a\<in\>A<around*|(|D|)>>\ 

  Abstract PDE:

  <\equation*>
    \<cal-D\><rsub|a><around*|(|u|)>=s,\<cal-B\><around*|(|u|)>=g
  </equation*>

  where <math|u\<in\>\<cal-U\><around*|(|\<Omega\>|)>> is the solution,
  <math|s> is source, <math|g> is bc.

  \;

  Forward problem: given <math|a\<in\>\<cal-A\>> , <math|s\<in\>\<cal-S\>>
  and find <math|u\<in\>\<cal-U\>> of PDE\ 

  Boundary observation operator

  <\equation*>
    \<Lambda\><rsub|a>:\<cal-G\><around*|(|\<partial\>\<Omega\>|)>\<rightarrow\>\<cal-H\><around*|(|\<partial\>\<Omega\>|)>
  </equation*>

  which maps the boundary data <math|g\<in\>\<cal-G\><around*|(|\<partial\>\<Omega\>|)>>
  to measurement <math|\<Lambda\><rsub|a><around*|(|g|)>=h<around*|(|u|)>\<in\>\<cal-H\><around*|(|\<partial\>\<Omega\>|)>>.

  The forward problem associated with the PDE to obtain the map\ 

  <\equation*>
    \<cal-F\>:\<cal-A\><around*|(|D|)>\<rightarrow\>\<cal-L\><around*|(|\<cal-G\><around*|(|\<partial\>\<Omega\>|)>,\<cal-H\><around*|(|\<partial\>\<Omega\>|)>|)>,a\<rightarrow\>\<cal-F\><around*|(|a|)>=\<Lambda\><rsub|a>
  </equation*>

  \;

  Inverse problem:

  <\equation*>
    \<cal-F\><rsup|-1>:\<cal-L\><around*|(|\<cal-G\><around*|(|\<partial\>\<Omega\>|)>,\<cal-H\><around*|(|\<partial\>\<Omega\>|)>|)>\<rightarrow\>\<cal-A\><around*|(|D|)>,\<Lambda\><rsub|a>\<rightarrow\>a=\<cal-F\><rsup|-1><around*|(|\<Lambda\><rsub|a>|)>
  </equation*>

  <subsection|Example>

  <subsubsection|EIT>

  <\equation*>
    <tabular*|<tformat|<table|<row|<cell|-\<nabla\>\<cdot\><around*|(|a<around*|(|z|)>\<nabla\>u|)>=0,z\<in\>D,>>|<row|<cell|u<around*|(|z|)>=g<around*|(|z|)>,z\<in\>\<partial\>D>>>>>
  </equation*>

  \;

  <\equation*>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|\<Lambda\><rsub|a>:H<rsup|1/2>*<around|(|\<partial\>*D|)>\<mapsto\>H<rsup|-1/2>*<around|(|\<partial\>*D|)>,>>|<row|<cell|\<Lambda\><rsub|a><around|[|g|]>=<around*|\<nobracket\>|a<frac|\<partial\>*u|\<partial\>*\<nu\>>|\|><rsub|\<partial\>*D>,\<forall\>g\<in\>H<rsup|1/2>*<around|(|\<partial\>*D|)>,>>>>>
  </equation*>

  \;

  <\equation*>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|\<cal-F\><rsup|-1>:\<cal-L\><around*|(|H<rsup|1/2>*<around|(|\<partial\>*D|)>,H<rsup|-1/2>*<around|(|\<partial\>*D|)>|)>\<mapsto\>C<rsup|2><around|(|D|)>>>|<row|<cell|\<cal-F\><rsup|-1>:\<Lambda\><rsub|a>\<mapsto\>a=\<cal-F\><rsup|-1><around*|(|\<Lambda\><rsub|a>|)>>>>>>
  </equation*>

  <subsubsection|Inverse Scattering>

  <\equation*>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|-\<Delta\>*u-\<omega\><rsup|2>*a<around|(|z|)>*u=0,<space|1em>z\<in\>D,>>|<row|<cell|u<around|(|z|)>=g<around|(|z|)>,<space|1em>z\<in\>\<partial\>*D,>>>>>
  </equation*>

  DtN:

  <\equation*>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|\<Lambda\><rsub|a>:H<rsup|1/2>*<around|(|\<partial\>*D|)>\<mapsto\>H<rsup|-1/2>*<around|(|\<partial\>*D|)>,>>|<row|<cell|\<Lambda\><rsub|a><around|[|g|]>=<around*|\<nobracket\>|<frac|\<partial\>*u|\<partial\>*\<nu\>>|\|><rsub|\<partial\>*D>,\<forall\>g\<in\>H<rsup|1/2>*<around|(|\<partial\>*D|)>,>>>>>
  </equation*>

  <subsubsection|Seismic Imaging>

  <\equation*>
    u<rsub|tt><around*|(|t,z|)>+a<rsup|2><around*|(|z|)>\<Delta\>u=s,<around*|(|z,t|)>\<in\>D\<times\><around*|[|0,T|]>
  </equation*>

  <\equation*>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|\<Lambda\><rsub|a>:L<rsup|2>*<around|(|<around|[|0,T|]>\<times\>D|)>\<mapsto\>L<rsup|2><around*|(|<around|[|0,T|]>;X<rsub|\<cal-R\>>|)>,>>|<row|<cell|\<Lambda\><rsub|a>:<around*|\<nobracket\>|s\<mapsto\>u|\|><rsub|<around|[|0,T|]>\<times\>\<cal-R\>>,>>>>>
  </equation*>

  <\equation*>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|2|2|cell-rborder|0ln>|<table|<row|<cell|\<cal-F\><rsup|-1>:>|<cell|\<cal-L\><around*|(|L<rsup|2>*<around|(|<around|[|0,T|]>\<times\>D|)>,L<rsup|2><around*|(|<around|[|0,T|]>;X<rsub|\<cal-R\>>|)>|)>\<mapsto\>L<rsup|\<infty\>><around|(|D|)>>>|<row|<cell|\<cal-F\><rsup|-1>:>|<cell|\<Lambda\><rsub|a>\<mapsto\>a=\<cal-F\><rsup|-1><around*|(|\<Lambda\><rsub|a>|)>>>>>>
  </equation*>

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
    <associate|auto-2|<tuple|1.1|?>>
    <associate|auto-3|<tuple|1.1.1|?>>
    <associate|auto-4|<tuple|1.1.2|?>>
    <associate|auto-5|<tuple|1.1.3|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Multi-modal
      Inverse Problem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>