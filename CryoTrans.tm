<TeXmacs|2.1.3>

<style|<tuple|generic|chinese>>

<\body>
  <doc-data|<\doc-title>
    CryoFormer:Continuous Reconstruction of 3D Structures from Cryo-EM Data
    using Transformer-based Neural Representations
  </doc-title>|<doc-author|<author-data|<author-name|Zhijun
  Zeng>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <section|Introduction>

  <subsection|Target>

  In this paper, we propose a novel approach, cryoFormer, that utilizes a
  transformer-based network architecture for continuous heterogeneous cryo-EM
  reconstruction.

  This paper directly reconstruct continuous conformations of 3D structures
  using an implicit feature volume in the 3D spatial domain to model local
  changes of conformations.A deformation transformer decoder further improves
  reconstruction quality and, more importantly, locates and robustly tackles
  flexible 3D regions caused by conformations.

  <subsection|Image Formation Model>

  The 3D structure is represented as a function
  <math|\<sigma\>:\<bbb-R\><rsup|3>\<rightarrow\>\<bbb-R\><rsup|+>>, which
  expresses the Coulomb potential induced by the atoms.

  The projection <math|<around*|{|\<b-I\><rsub|i>|}><rsub|1\<leqslant\>i\<leqslant\>n>>
  can be expressed as\ 

  <\equation*>
    \<b-I\><around*|(|x,y|)>=g\<ast\><big|int><rsub|\<bbb-R\>>\<sigma\><around*|(|\<b-R\><rsup|T>\<b-x\>+\<b-t\>|)>dz+\<varepsilon\>,\<b-x\>=<around*|(|x,y,z|)><rsup|T>,\<b-t\>=<around*|(|t<rsub|x>,t<rsub|y>,0|)><rsup|T>
  </equation*>

  The image signal is convolved with g, a pre-estimated point spread function
  with noise and registered on a discrete grid of size <math|D\<times\>D>.

  <section|Overview of CryoFormer>

  <space|1em>To extract conformation and pose information of image, an imput
  projection <math|\<b-I\>> is fed into image encoders that output
  Orientation feature <math|F<rsub|O>> and a deformation feature
  <math|F<rsub|D>>. Here <math|F<rsub|O>> is then converted to pose
  <math|\<phi\>=<around*|(|\<b-R\>,\<b-t\>|)>>, <math|\<b-R\>> is a rotation
  matrix to rotate a grid with <math|D<rsup|3>> size in spation domain.

  \ <nbsp>The rotated coordinates are then fed into implicit neural spatial
  feature volumn <math|\<nu\><rsub|\<theta\>>> which maps coordinates in
  <math|\<bbb-R\><rsup|3>> to spatial feature in
  <math|\<bbb-R\><rsup|N\<times\>C>>.Given a 3D point in spatial domain,
  INSFV output s a spatial feature <math|F<rsub|S>>.

  <math|F<rsub|S>> is then fed into deformation transformer decoder. The
  <math|F<rsub|S>> spatial feature interact with structure queries Q and
  deformation image feature <math|F<rsub|D>> to output the density prediction
  <math|\<sigma\>>.

  <subsection|Implicit Spatial Feature Volumn>

  <math|\<nu\><rsub|\<theta\>><around*|(|x,y,z;\<theta\>|)>:\<bbb-R\><rsup|3>\<rightarrow\>\<bbb-R\><rsup|N\<times\>C>>

  Here , we use a similar multi-resolution hash grid encoding augmented by a
  single-layer MLP to decode a high dimensional spatial feature
  <math|F<rsub|s>\<in\>\<bbb-R\><rsup|N\<times\>C>>.

  For the implicit spatial feature volume, we utilized a hash grid with 16
  levels, where the number of features in each level is 2, the hashmap size
  is <math|2<rsup|15>>, and the base resolution is 16. This hash grid is
  followed by a tiny MLP with one layer and hidden dimension 16.

  <subsection|Orientation and Deformation Image Encoders>

  \ For both encoders, we adopt MLPs containing 10 hidden layers of width 128
  with ReLU activations, following the image encoder design of cryoDRGN.

  <subsubsection|Orientation Encoder>

  The spatial feature is transformed to rotation and translation
  <math|\<phi\>=<around*|(|\<b-R\>,\<b-t\>|)>>, a 6-dimension space denoted
  as <math|<with|font|Bbb|S<rsup|2>\<times\>S<rsup|2>>> and converted to
  matrix format.

  <subsubsection|Deformation Encoder >

  The projection <math|\<b-I\><rsub|i>> spatial feature is transformed to a
  deformation feature representation <math|F<rsub|D>\<in\>\<bbb-R\><rsup|N\<times\>C>>.
  The output density is condition on <math|F<rsub|D>>.

  \ 

  <subsection|Query-based Deformation Transformer Decoder>

  \ The transformer decoder uses a cross-attention mechanism to fuse
  information from different sources or modalities

  <\equation*>
    Attention <around*|(|Q,K,V|)>=softmax<around*|(|<frac|QK<rsup|T>|<sqrt|C>>|)>V
  </equation*>

  where <math|Q,K,V\<in\>\<bbb-R\><rsup|N\<times\>C>>.N is token number and C
  is hidden dimension.

  Note that <math|Q=K=V> then we call it self attention.

  <subsubsection|Structure Query Prototypes>

  We denote randomly initialized learnable structure queries as
  <math|Q\<in\>\<bbb-R\><rsup|N\<times\>C>>.

  <subsubsection|Deformation-aware Decoder Block>

  Given an image with its deformation feature <math|F<rsub|D>>,

  Each deformation-aware block sequentially consists of an inter-query
  self-attention block, a deformation-aware cross-attention layer, and a
  feed-forward network (FFN).

  Cross-attention layer <math|Attention <around*|(|Q,F<rsub|D>,Q|)>>.

  <subsubsection|Spatial Density Estimation>

  <math|Attention<around*|(|Q,F<rsub|S>,Q|)>>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|?|..\\..\\..\\AppData\\Roaming\\Xmacs\\texts\\scratch\\no_name_1.tm>>
    <associate|auto-10|<tuple|2.3.1|?|..\\..\\..\\AppData\\Roaming\\Xmacs\\texts\\scratch\\no_name_1.tm>>
    <associate|auto-11|<tuple|2.3.2|?|..\\..\\..\\AppData\\Roaming\\Xmacs\\texts\\scratch\\no_name_1.tm>>
    <associate|auto-12|<tuple|2.3.3|?|..\\..\\..\\AppData\\Roaming\\Xmacs\\texts\\scratch\\no_name_1.tm>>
    <associate|auto-13|<tuple|2.4|?|..\\..\\..\\AppData\\Roaming\\Xmacs\\texts\\scratch\\no_name_1.tm>>
    <associate|auto-2|<tuple|1.1|?|..\\..\\..\\AppData\\Roaming\\Xmacs\\texts\\scratch\\no_name_1.tm>>
    <associate|auto-3|<tuple|1.2|?|..\\..\\..\\AppData\\Roaming\\Xmacs\\texts\\scratch\\no_name_1.tm>>
    <associate|auto-4|<tuple|2|?|..\\..\\..\\AppData\\Roaming\\Xmacs\\texts\\scratch\\no_name_1.tm>>
    <associate|auto-5|<tuple|2.1|?|..\\..\\..\\AppData\\Roaming\\Xmacs\\texts\\scratch\\no_name_1.tm>>
    <associate|auto-6|<tuple|2.2|?|..\\..\\..\\AppData\\Roaming\\Xmacs\\texts\\scratch\\no_name_1.tm>>
    <associate|auto-7|<tuple|2.2.1|?|..\\..\\..\\AppData\\Roaming\\Xmacs\\texts\\scratch\\no_name_1.tm>>
    <associate|auto-8|<tuple|2.2.2|?|..\\..\\..\\AppData\\Roaming\\Xmacs\\texts\\scratch\\no_name_1.tm>>
    <associate|auto-9|<tuple|2.3|?|..\\..\\..\\AppData\\Roaming\\Xmacs\\texts\\scratch\\no_name_1.tm>>
  </collection>
</references>