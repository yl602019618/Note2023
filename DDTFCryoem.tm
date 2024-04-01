<TeXmacs|2.1.3>

<style|<tuple|generic|chinese>>

<\body>
  <doc-data|<\doc-title>
    DATA-DRIVEN TIGHT FRAME FOR CRYO-EM IMAGE DENOISING AND CONFORMATIONAL
    CLASSIFICATION
  </doc-title>|<doc-author|<author-data|<author-name|Zhijun Zeng>>>>

  This paper propose to use multi-image data-driven tight frame (DDTF) for
  cryo-EM image denoising.. It uses learned fifilters to form a tight frame.
  The Unitary Extension Principle (UEP) condition can be used to construct
  tight frames. However, it is not easy to satisfy the UEP condition. The
  DDTF algorithm relaxes the UEP condition, and generate filters with
  orthogonality. In the image patch space, the generated fifilters form an
  orthogonal dictionary. The K-SVD method needs a highly redundant dictionary
  to obtain a sparse code. The DDTF simplififies the process to obtain the
  filters coeffificients, and reduce the computational cost compared with
  K-SVD.

  <section|Background>

  The problem of cryo-EM model is\ 

  <\equation>
    G<around*|(|u|)>=C\<ast\>Y<around*|(|u|)>+Z<around*|(|u|)>
  </equation>

  Here Y is the clean ideal image, Z is a additive noise,C is the point
  spread function of microscope.G is the measure image of real space.More
  generally the model should consider the rotation and transition

  <\equation>
    X<around*|(|r<rsub|x>,r<rsub|y>|)>=g\<ast\><big|int><rsub|\<bbb-R\>>V*<around*|(|R<rsup|T><math-bf|r>+t|)>*d*r<rsub|z>+<text|noise
    ><space|1em><math-bf|r>=<around*|(|r<rsub|x>,r<rsub|y>,r<rsub|z>|)><rsup|T>
  </equation>

  <\remark>
    In order to obtain an image close to the original image, the level of
    noise has to reduce,\ 

    and the point spread function effect needs to be estimated.When the point
    spread function is known, the estimated image can be obtained by
    deconvolving the denoised images with the point spread function.
  </remark>

  The weakness of Covariance Wiener Filtering<space|1em>method for denoising
  is that it needs a large number of images to accurately estimate the
  covariance matrix. When the covariance matrix is not accurately estimated,
  the performance of this method is not good.

  <\remark>
    BM3D( Block-matching and 3D filtering) \ is considered as an effective
    baseline. It groups similar and nonlocal image patches into a 3D array
    and fifilters the 3D array. The image patches are then put back to the
    original positions and reweighed to form a denoised image.
  </remark>

  <\remark>
    K-SVD embeds the local overcompleted dictionary into a global Bayesian
    estimator. For a given noisy image G,

    <\equation>
      <wide|\<alpha\>|^>=argmin<rsub|\<alpha\>><around*|\<\|\|\>|D\<alpha\>-G|\<\|\|\>><rsub|2><rsup|2>+\<mu\><around*|\<\|\|\>|\<alpha\>|\<\|\|\>><rsub|0>
    </equation>

    Here D is a dictionary and <math|\<alpha\> > is the sparse code. The
    denoise image is given by <math|<wide|Y|^>=D<wide|\<alpha\>|^>>.
  </remark>

  <section|MULTI-IMAGE DATA-DRIVEN TIGHT FRAME>

  Given an image <math|G\<in\>\<bbb-R\><rsup|m\<times\>n>>, W be an analysis
  operator whose adjoint operator <math|W<rsup|T>> is synthesis operator
  defined by filters <math|<around*|{|a<rsub|i>|}><rsub|i=1><rsup|r>>:
  <math|W<rsup|T>=<around*|[|\<cal-S\><rsub|a<rsub|1>>,\<cal-S\><rsub|a<rsub|2>>,\<ldots\>,\<cal-S\><rsub|a<rsub|r>>|]>>
  and the operator <math|S<rsub|a>:l<rsub|2><around*|(|\<bbb-R\>|)>\<rightarrow\>l<rsub|2><around*|(|\<bbb-R\>|)>>
  is defined by\ 

  <\equation>
    <around*|[|\<cal-S\><rsub|a>v|]><around*|(|n|)>=<around*|[|a\<ast\>v|]><around*|(|n|)>=<big|sum><rsub|k\<in\>\<bbb-Z\>>a<around*|(|n-k|)>v<around*|(|k|)>
  </equation>

  where <math|v,a\<in\>l<rsub|2><around*|(|\<bbb-R\>|)>>.

  In finite dimensional space <math|S<rsub|a>\<in\>\<bbb-R\><rsup|L\<times\>L>>
  ,where <math|L=m\<times\>n>. The column <math|W<rsup|T>> forms a tight
  frame

  <\equation>
    W<rsup|T>W=I<rsub|L>
  </equation>

  The tight frame <math|W > can be constructed by minimizatoin problem

  <\equation>
    min<rsub|\<alpha\>,<around*|{|a<rsub|i>|}><rsub|i=1><rsup|r>><around*|\<\|\|\>|\<alpha\>-W<around*|(|a<rsub|1>,a<rsub|2>,\<ldots\>,a<rsub|r>|)>G|\<\|\|\>><rsub|2><rsup|2>+\<lambda\><rsup|2><around*|\<\|\|\>|\<alpha\>|\<\|\|\>><rsub|0>
  </equation>

  The filter coefficient <math|<around*|{|a<rsub|i>|}><rsub|i=1><rsup|r>> and
  the sparse frame coefficient <math|\<alpha\>> are solved iteratively

  <\equation>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|\<alpha\><rsup|<around|(|k|)>>\<assign\>min<rsub|\<alpha\>><around*|\||\<alpha\>-W<around*|(|a<rsub|1><rsup|<around|(|k|)>>,a<rsub|2><rsup|<around|(|k|)>>,\<cdots\>,a<rsub|r><rsup|<around|(|k|)>>|)>*G|\|><rsub|2><rsup|2>+\<lambda\><rsup|2><around|\<\|\|\>|\<alpha\>|\<\|\|\>><rsub|0>>>|<row|<cell|<around*|{|a<rsub|i><rsup|<around|(|k+1|)>>|}><rsub|i=1><rsup|r>\<assign\>min<rsub|<around*|{|a<rsub|i>|}><rsub|i=1><rsup|r>><around*|\||\<alpha\><rsup|k>-W<around*|(|a<rsub|1>,a<rsub|2>,\<cdots\>,a<rsub|r>|)>*G|\|><rsub|2><rsup|2>>>>>>
  </equation>

  \;

  \ For the first equation , it can be proved that
  <math|\<alpha\><rsup|\<ast\>>=T<rsub|\<mu\>><around*|(|WG|)>> is the unique
  solution, where the hard threshold operator is given by

  <\equation>
    <around*|[|T<rsub|\<space\>\<mu\>>v|]><around*|(|n|)>=<around*|{|<tabular*|<tformat|<table|<row|<cell|v<around*|(|n|)>>|<cell|if<around*|\||v<around*|(|n|)>|\|>\<gtr\>\<lambda\>>>|<row|<cell|0>|<cell|otherwise>>>>>|\<nobracket\>>
  </equation>

  Let <math|A=<around*|[|<wide|a<rsub|1>|^>,\<ldots\>,<wide|a|^><rsub|r>|]>,where
  <wide|a|^><rsub|i>> is the vectorized form of a 2D filter, then the unique
  solution of the second equation is <math|A*<rsup|\<ast\>>=<frac|1|r>QP<rsup|T>>
  where <math|P,Q> satisfies the singluar value decomposition of
  <math|<wide|G|\<bar\>><wide|\<alpha\>|\<bar\>>> ,i.e.
  <math|<wide|a|\<bar\>><wide|G|\<bar\>>=PDQ<rsup|T>.> Here
  <math|<wide|G|\<bar\>>=<around*|[|g<rsub|1>,g<rsub|2>,\<ldots\>,g<rsub|n>|]>>
  where <math|g<rsub|i>> is the i-th vectorized image patch of G and
  <math|<wide|\<alpha\>|\<bar\>>> is the corresponding sparse frame
  coefficient matrix. We then get the filter
  <math|<around*|{|a<rsub|i><rsup|<around*|(|0|)>>|}><rsub|i=1><rsup|r>> by
  <math|A<rsup|\<ast\>>>. The denoising image can be\ 

  <\equation>
    G<rsup|\<ast\>>=W<rsup|T><around*|(|T<rsub|\<mu\>><around*|(|WG|)>|)>
  </equation>

  \;

  <\remark>
    Here a image is reorder in \ <math|<wide|G|\<bar\>>=<around*|[|g<rsub|1>,g<rsub|2>,\<ldots\>,g<rsub|n>|]>>
    such that\ 

    The <math|W<rsup|T>\<in\>\<bbb-R\><rsup|L\<times\>r>,W\<in\>\<bbb-R\><rsup|r\<times\>L>,\<alpha\>\<in\>\<bbb-R\><rsup|r\<times\>1>,G\<in\>\<bbb-R\><rsup|L\<times\>1>>
    </remark>

  <\enumerate>
    <item><math|W<rsup|T>\<in\>\<bbb-R\><rsup|L\<times\>r>,then
    W<rsup|T>\<alpha\>\<in\>\<bbb-R\><rsup|L\<times\>1> ><math|recover the
    image>

    <item><math|W\<in\>\<bbb-R\><rsup|r\<times\>L> > then
    <math|WG\<in\>\<bbb-R\><rsup|r\<times\>1>> is the coefficient of each
    atom in dict.

    <item><math|T<rsub|\<mu\>><around*|(|WG|)>\<in\>\<bbb-R\><rsup|r\<times\>1>>
    is a sparse coefficient.

    <item> <math|<wide|G|\<bar\>>=<around*|[|g<rsub|1>,g<rsub|2>,\<ldots\>,g<rsub|n>|]>\<in\>\<bbb-R\><rsup|m\<times\>n>>,A<math|\<in\>\<bbb-R\><rsup|L\<times\>r>>,
    <math|<wide|\<alpha\>|\<bar\>>> is the sparse frame coefficient matrix
    <math|\<bbb-R\><rsup|n\<times\>r>>,then

    <math|><math|<wide|a|\<bar\>><wide|G|\<bar\>>\<in\>\<bbb-R\><rsup|r\<times\>m>>,
    <math|P\<in\>\<bbb-R\><rsup|r\<times\>L>,Q<rsup|T>\<in\>\<bbb-R\><rsup|L\<times\>m>>,
    then <math|A<rsup|\<ast\>>>\<in\><math|\<bbb-R\><rsup|m\<times\>r>>
  </enumerate>

  \ <math|>

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|..\\..\\AppData\\Roaming\\Xmacs\\texts\\scratch\\no_name_1.tm>>
    <associate|auto-2|<tuple|2|?|..\\..\\AppData\\Roaming\\Xmacs\\texts\\scratch\\no_name_1.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Background>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>