<TeXmacs|2.1.3>

<style|<tuple|generic|chinese>>

<\body>
  <doc-data|<doc-title|Measuring Distance Between Distribution
  Differentiablly>|<doc-author|<author-data|<author-name|Zhijun Zeng>>>>

  <section|KL Divergence In GAN>

  Suppose the distribution of the true dataset is
  <math|P<rsub|data><around*|(|\<b-x\>|)>>. Now we approximate the
  distribution with <math|P<rsub|G><around*|(|\<b-x\>,\<theta\>|)>> ,where
  the generator is denoted by <math|G:\<b-z\>\<rightarrow\>\<b-x\>>.\ 

  Suppose for each epoch , a batch of real data is sampled as
  <math|<around*|{|\<b-x\><rsup|1>,\<ldots\>,\<b-x\><rsup|m>|}>>, the
  likelyhood is\ 

  <\equation*>
    L=\<Pi\><rsub|i=1><rsup|m>P<rsub|G><around*|(|\<b-x\><rsup|i>,\<theta\>|)>
  </equation*>

  Then we have the following deduction

  <\equation>
    <\aligned>
      <tformat|<table|<row|<cell|\<theta\><rsup|\<ast\>>>|<cell|=arg
      max<rsub|\<theta\>> <big|prod><rsub|i=1><rsup|m>P<rsub|G><around*|(|x<rsup|i>;\<theta\>|)>>>|<row|<cell|>|<cell|=arg
      max<rsub|\<theta\>> log <big|prod><rsub|i=1><rsup|m>P<rsub|G><around*|(|x<rsup|i>;\<theta\>|)>>>|<row|<cell|>|<cell|=arg
      max<rsub|\<theta\>> <big|sum><rsub|i=1><rsup|m>log
      P<rsub|G><around*|(|x<rsup|i>;\<theta\>|)>>>|<row|<cell|>|<cell|\<approx\>arg
      max<rsub|\<theta\>> E<rsub|x\<sim\>P<rsub|<text|data >>><around*|[|log
      P<rsub|G><around|(|x;\<theta\>|)>|]>>>|<row|<cell|>|<cell|=arg
      max<rsub|\<theta\>> <big|int><rsub|x>P<rsub|d*a*t*a><around|(|x|)>*log
      P<rsub|G><around|(|x;\<theta\>|)>*d*x-<big|int><rsub|x>P<rsub|d*a*t*a><around|(|x|)>*log
      P<rsub|<text|data >><around|(|x|)>*d*x>>|<row|<cell|>|<cell|=arg
      max<rsub|\<theta\>> <big|int><rsub|x>P<rsub|<text|data
      >><around|(|x|)>*<around*|(|log P<rsub|G><around|(|x;\<theta\>|)>-log
      P<rsub|<text|data >><around|(|x|)>|)>*d*x>>|<row|<cell|>|<cell|=arg
      min<rsub|\<theta\>> <big|int><rsub|x>P<rsub|<text|data
      >><around|(|x|)>*log <frac|P<rsub|<text|data
      >><around|(|x|)>|P<rsub|G><around|(|x;\<theta\>|)>>*d*x>>|<row|<cell|>|<cell|=arg
      min<rsub|\<theta\>> K*L<around*|(|P<rsub|<text|data
      >><around|(|x|)>\<\|\|\>P<rsub|G><around|(|x;\<theta\>|)>|)>>>>>
    </aligned>
  </equation>

  GAN provide a formulation to\ 

  <\equation>
    V<around*|(|G,D|)>=\<bbb-E\><rsub|x\<sim\>P<rsub|data>><around*|[|logD<around*|(|x|)>|]>+\<bbb-E\><rsub|x\<sim\>P<rsub|G>><around*|[|log<around*|(|1-D<around*|(|x|)>|)>|]>
  </equation>

  The output of Discriminator should be (0,1).

  Given G , the Optimal <math|D<rsup|*\<ast\>>> is\ 

  <\equation>
    <\aligned>
      <tformat|<table|<row|<cell|V>|<cell|=E<rsub|x\<sim\>P<rsub|<text|data
      >>><around|[|log D<around|(|x|)>|]>+E<rsub|x\<sim\>P<rsub|G>><around|[|log
      <around|(|1-D<around|(|x|)>|)>|]>>>|<row|<cell|>|<cell|=<big|int><rsub|x>P<rsub|<text|data
      >><around|(|x|)>*log D<around|(|x|)>*d*x+<big|int><rsub|x>P<rsub|G><around|(|x|)>*log
      <around|(|1-D<around|(|x|)>|)>*d*x>>|<row|<cell|>|<cell|=<big|int><rsub|x><around*|[|P<rsub|<text|data
      >><around|(|x|)>*log D<around|(|x|)>+P<rsub|G><around|(|x|)>*log
      <around|(|1-D<around|(|x|)>|)>|]>*d*x>>>>
    </aligned>
  </equation>

  The maximizer is <math|D<rsup|*\<ast\>><around*|(|x|)>=<frac|P<rsub|data><around*|(|x|)>|P<rsub|data><around*|(|x|)>+P<rsub|G><around*|(|x|)>>>.
  Substituting it into the equation obtains

  <\equation>
    max<rsub|D>V<around*|(|G,D|)>=\<bbb-E\><rsub|x\<sim\>P<rsub|data>><around*|[|log<around*|(|<frac|P<rsub|data><around*|(|x|)>|P<rsub|data<around*|(|x|)>>+p<rsub|G><around*|(|x|)>>|)>|]>+\<bbb-E\><rsub|x\<sim\>P<rsub|G>><around*|[|log<around*|(|<frac|P<rsub|G><around*|(|x|)>|P<rsub|data<around*|(|x|)>>+p<rsub|G><around*|(|x|)>>|)>|]>
  </equation>

  <\equation>
    max<rsub|D>V<around*|(|G,D|)>=-2log2+KL<around*|(|p<rsub|data<around*|(|x|)>><around*|\|||\|><frac|p<rsub|data><around*|(|x|)>+p<rsub|G><around*|(|x|)>|2>|)>+KL<around*|(|p<rsub|G><around*|(|x|)><around*|\|||\|><frac|p<rsub|data><around*|(|x|)>+p<rsub|G<around*|(|x|)>>|2>|)>=-2log2+2JS<around*|(|P<rsub|data><around*|(|x|)><around*|\<\|\|\>|P<rsub|G><around*|(|x|)>|)>*|\<nobracket\>>
  </equation>

  Then the training target is\ 

  <\equation*>
    G<rsup|\<ast\>>,D<rsup|\<ast\>>=argmin<rsub|G>argmax<rsub|D>V<around*|(|G,D|)>=-2log2
  </equation*>

  <subsection|Training Algorithm>

  For D training

  <\enumerate>
    <item>Sample m examples <math|<around*|{|x<rsub|1>,\<ldots\>,x<rsub|m>|}>>
    from <math|p<rsub|data><around*|(|x|)>>

    <item>Sample noise sample from <math|<around*|{|z<rsub|1>,\<ldots\>,z<rsub|m>|}>>
    from <math|p<rsub|prior><around*|(|z|)>>

    <item>Obtaining generated data <math|<around*|{|<wide|x<rsub|>|~><rsub|i>=G<around*|(|z<rsub|i>|)>|}>>

    <item>Using discriminator to maximize\ 

    <\equation*>
      <wide|V|~>=<frac|1|m><big|sum><rsub|i=1><rsup|m>logD<around*|(|x<rsub|i>|)>+<frac|1|m><big|sum><rsub|i=1><rsup|m>log<around*|(|1-D<around*|(|<wide|x|~><rsub|i>|)>|)>
    </equation*>

    <\equation*>
      \<theta\><rsub|d>=\<theta\><rsub|d>+\<eta\>\<nabla\><wide|V|~><around*|(|\<theta\><rsub|d>|)>
    </equation*>
  </enumerate>

  For G training:

  <\enumerate>
    <item>Sample noise sample from <math|<around*|{|z<rsub|1>,\<ldots\>,z<rsub|m>|}>>
    from <math|p<rsub|prior><around*|(|z|)>>

    <item>Using generator to minimize

    <\equation*>
      <wide|V|~>=<frac|1|m><big|sum><rsub|i=1><rsup|m>logD<around*|(|x<rsub|i>|)>+<frac|1|m><big|sum><rsub|i=1><rsup|m>log<around*|(|1-D<around*|(|G<around*|(|z<rsub|i>|)>|)>|)>
    </equation*>

    <\equation*>
      \<theta\><rsub|g>=\<theta\><rsub|g>-\<eta\>\<nabla\><wide|V|~><around*|(|\<theta\><rsub|g>|)>
    </equation*>

    \ 
  </enumerate>

  <subsection|Non-saturating GAN>

  <\equation*>
    V=\<bbb-E\><rsub|x\<sim\>P<rsub|G>><around*|[|-logD<around*|(|x|)>|]>
  </equation*>

  To tackle the "slow at training" problem.

  <subsection|f-GAN>

  <\definition>
    P and Q are two distributions,the f divergence is\ 

    <\equation*>
      D<rsub|f><around*|(|P<around*|\|||\|>Q|)>=<big|int><rsub|x>q<around*|(|x|)>f<around*|(|<frac|p<around*|(|x|)>|q<around*|(|x|)>>|)>dx
    </equation*>

    where f is convex and <math|f<around*|(|1|)>=0>.
  </definition>

  <\proposition>
    <math|D<rsub|f><around*|(|P<around*|\|||\|>Q|)>\<geqslant\>f<big|int><rsub|x>q<around*|(|x|)><around*|(|<frac|p<around*|(|x|)>|q<around*|(|x|)>>|)>dx=f<around*|(|1|)>=0>
  </proposition>

  <math|f=xlogx> the f-divergence is KL.

  \;

  <section|WGAN>

  Wasserstein distance is given by

  <\equation>
    W<around*|(|p<rsub|data>,p<rsub|G>|)>=inf<rsub|\<gamma\>\<sim\>\<Pi\><around*|(|p<rsub|data>,p<rsub|G>|)>>\<bbb-E\><rsub|<around*|(|x,y|)>\<sim\>\<gamma\>><around*|[|<around*|\<\|\|\>|x-y|\<\|\|\>>|]>=min<rsub|\<gamma\>\<sim\>\<Pi\>><big|sum><rsub|x<rsub|p>,x<rsub|q>>\<gamma\><around*|(|x<rsub|p>,x<rsub|q>|)><around*|\<\|\|\>|x<rsub|p>-x<rsub|q>|\<\|\|\>>
  </equation>

  It is intractable to exhaust all the possible joint distributions in
  <math|\<Pi\><rsub|<around*|(|p<rsub|data>,p<rsub|G>|)>>>, by KR duality

  <\equation>
    W<around*|(|p<rsub|data>,p<rsub|G>|)>=<frac|1|K>*sup<rsub|<around|\<\|\|\>|D|\<\|\|\>><rsub|L\<leq\>K>>
    \<bbb-E\><rsub|x\<sim\>p<rsub|data>><around|[|D<around|(|x|)>|]>-\<bbb-E\><rsub|x\<sim\>p<rsub|G>><around|[|D<around|(|x|)>|]>
  </equation>

  The Wasserstein GAN<space|1em>loss function is given by

  <\equation>
    L<around*|(|p<rsub|r>,p<rsub|g>|)>=W<around*|(|p<rsub|r>,p<rsub|g>|)>=max<rsub|w\<in\>W>
    \<bbb-E\><rsub|x\<sim\>p<rsub|r>><around*|[|D<rsub|w><around|(|x|)>|]>-\<bbb-E\><rsub|z\<sim\>p<rsub|r><around|(|z|)>><around*|[|D<rsub|w><around*|(|g<rsub|\<theta\>><around|(|z|)>|)>|]>
  </equation>

  <subsection|WGAN-GP>

  For a \ differentiable function <math|D>,

  <\equation*>
    D\<in\>1-Lipschitz \<Leftrightarrow\><around*|\<\|\|\>|\<nabla\><rsub|x>D<around*|(|x|)>|\<\|\|\>>\<leqslant\>1
  </equation*>

  Then the loss function is modified by

  <\equation*>
    L<around*|(|p<rsub|r>,p<rsub|g>|)>=max<rsub|w\<in\>W>
    \<bbb-E\><rsub|x\<sim\>p<rsub|r>><around*|[|D<rsub|w><around|(|x|)>|]>-\<bbb-E\><rsub|z\<sim\>p<rsub|r><around|(|z|)>><around*|[|D<rsub|w><around*|(|g<rsub|\<theta\>><around|(|z|)>|)>|]>-\<lambda\><big|int><rsub|x>max<around*|(|0,<around*|\<\|\|\>|\<nabla\><rsub|x>D<rsub|w><around*|(|x|)>|\<\|\|\>>-1|)>dx
  </equation*>

  <\equation*>
    L<around*|(|p<rsub|r>,p<rsub|g>|)>=max<rsub|w\<in\>W>
    \<bbb-E\><rsub|x\<sim\>p<rsub|r>><around*|[|D<rsub|w><around|(|x|)>|]>-\<bbb-E\><rsub|z\<sim\>p<rsub|r><around|(|z|)>><around*|[|D<rsub|w><around*|(|g<rsub|\<theta\>><around|(|z|)>|)>|]>-\<lambda\><big|int><rsub|p<rsub|penalty>><around*|(|<around*|\<\|\|\>|\<nabla\><rsub|x>D<rsub|w><around*|(|x|)>|\<\|\|\>>-1|)><rsup|2>dx
  </equation*>

  Here <math|p<rsub|penalty > >is the interpolate of real data and generated
  distribution.

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
    <associate|auto-2|<tuple|1.1|2>>
    <associate|auto-3|<tuple|1.2|?>>
    <associate|auto-4|<tuple|1.3|?>>
    <associate|auto-5|<tuple|2|?>>
    <associate|auto-6|<tuple|2.1|?>>
    <associate|auto-7|<tuple|3|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>KL
      Divergence In GAN> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>WGAN>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>