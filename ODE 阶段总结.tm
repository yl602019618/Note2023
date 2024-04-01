<TeXmacs|2.1.3>

<style|<tuple|generic|chinese>>

<\body>
  <doc-data|<doc-title|无时间标记动力系统学习阶段总结>>

  <section|现阶段结果>

  <subsection|Neural Canonical Transform>

  学习1D、2D 谐振子问题，q 相对误差<math|0.5>%,p相对误差<math|1.5>%,Hamiltonian
  相对误差2%.训练时间10min。

  对于非谐振子问题无法拟合、对于谐振子问题神经网络收敛于恒同映射。

  <subsection|直接Wasserstein 参数回归>

  <subsubsection|谐振子>

  <math|\<cal-H\><around|(|p,q|)>=<big|sum><rsub|k=1><rsup|2><frac|p<rsub|k><rsup|2>+\<theta\><rsub|k><rsup|2>*q<rsub|k><rsup|2>|2>>,
  where <math|\<theta\>=<around|[|1,2|]>,q<around|(|0|)>=<around|[|1,1|]>,p<around|(|0|)>=<around|(|0,0|)>>

  <paragraph|1D>

  <\wide-block>
    <tformat|<table|<row|<\cell>
      回归结果
    </cell>|<\cell>
      p,q误差
    </cell>|<\cell>
      时间误差
    </cell>|<\cell>
      H误差
    </cell>>|<row|<\cell>
      1.0008,2.0010
    </cell>|<\cell>
      0.5%,0.2%
    </cell>|<\cell>
      0.1%
    </cell>|<\cell>
      0.8%
    </cell>>>>
  </wide-block>

  \;

  <subparagraph|5D>

  <\wide-block>
    <tformat|<table|<row|<\cell>
      回归结果
    </cell>|<\cell>
      p,q误差
    </cell>|<\cell>
      时间误差
    </cell>|<\cell>
      H误差
    </cell>>|<row|<\cell>
      0.9944,1.9913,1.4902,0.9952,1.9919
    </cell>|<\cell>
      \;
    </cell>|<\cell>
      0.3%
    </cell>|<\cell>
      1.2%
    </cell>>>>
  </wide-block>

  \;

  <subsubsection|Lotka\UVolterra System>

  <math|\<cal-H\><around|(|p,q|)>=p-exp p+2*q-exp
  q>,参数化为<math|\<cal-H\><around|(|p,q|)>=A*p-B*exp p+C*q-D*exp q>
  <math|>

  <paragraph|1D>

  <\wide-block>
    <tformat|<table|<row|<\cell>
      回归结果
    </cell>|<\cell>
      p,q误差
    </cell>|<\cell>
      时间误差
    </cell>|<\cell>
      H误差
    </cell>>|<row|<\cell>
      0.9902,0.9922,2.0853,1.0780
    </cell>|<\cell>
      0.3%,0.6%
    </cell>|<\cell>
      \;
    </cell>|<\cell>
      3.5%
    </cell>>>>
  </wide-block>

  <paragraph|2D>

  <\wide-block>
    <tformat|<table|<row|<\cell>
      回归结果
    </cell>|<\cell>
      p,q误差
    </cell>|<\cell>
      时间误差
    </cell>|<\cell>
      H误差
    </cell>>|<row|<\cell>
      1.0226,1.0176,1.8839, 0.9225 \ 

      0.9735, 0.9734,2.1232,1.1269
    </cell>|<\cell>
      1.1%,0.7%
    </cell>|<\cell>
      0.8%
    </cell>|<\cell>
      0.79%
    </cell>>>>
  </wide-block>

  <subsubsection|Henon\UHeiles System>

  <math|\<cal-H\><around|(|\<b-q\>,\<b-p\>|)>=\<cal-H\><around*|(|q<rsub|1>,q<rsub|2>,p<rsub|1>,p<rsub|2>|)>=<frac|1|2>*<around*|(|p<rsub|1><rsup|2>+p<rsub|2><rsup|2>|)>+<frac|1|2>*<around*|(|q<rsub|1><rsup|2>+q<rsub|2><rsup|2>|)>+<around*|(|q<rsub|1><rsup|2>*q<rsub|2>-<frac|q<rsub|2><rsup|3>|3>|)>>

  <math|\<cal-H\><around|(|\<b-p\>,\<b-q\>|)>=<frac|1|2>*A*<around*|(|p<rsub|1><rsup|2>+p<rsub|2><rsup|2>|)>+<frac|1|2>*B*<around*|(|q<rsub|1><rsup|2>+q<rsub|2><rsup|2>|)>+<around*|(|C*q<rsub|1><rsup|2>*q<rsub|2>-D<frac|q<rsub|2><rsup|3>|3>|)>>

  <\wide-block>
    <tformat|<table|<row|<\cell>
      回归结果
    </cell>|<\cell>
      p,q误差
    </cell>|<\cell>
      时间误差
    </cell>|<\cell>
      H误差
    </cell>>|<row|<\cell>
      0.9998,1.0068,1.0128,1.0638
    </cell>|<\cell>
      0.4%,0.7%
    </cell>|<\cell>
      0.8%
    </cell>|<\cell>
      0.2%
    </cell>>>>
  </wide-block>

  <subsubsection|多项式模型>

  <paragraph|1D 冗余1参数>

  <math|\<cal-H\><around|(|\<b-q\>,\<b-p\>|)>=\<b-p\>-\<b-p\><rsup|3>-\<b-q\>+\<b-q\><rsup|3>
  >,<math|\<cal-H\><around|(|\<b-q\>,\<b-p\>|)>=A<rsub|p>*\<b-p\>+B<rsub|p>*\<b-p\><rsup|2>+C<rsub|p>*\<b-p\><rsup|3>+A<rsub|q>*\<b-q\>+B<rsub|q>*\<b-q\><rsup|2>+C<rsub|q>*\<b-q\><rsup|3>>

  p 参考值：<math|<around*|[|1,0,-1|]> >, 反演值：<math|<around*|[|
  1.0225 \ ,-0.0857 ,-0.9398|]>>

  q 参考值：<math|<around*|[|-1,0,1|]> >,反演值： <math|<around*|[|
  -1.0031, -0.0001 \ ,0.9957|]>>

  H误差： 0.9%

  时间误差：0.5%

  <paragraph|2D 冗余1参数>

  p <math|<around*|[|0.9081 \ \ \ 0.0031 \ \ -0.9535|]>,<around*|[|0.9049
  \ \ \ 0.0036 \ \ -0.9522|]>>

  q<math|<around*|[|-0.9980 \ \ -0.0004 \ \ \ 0.9946|]>,<around*|[|-0.9980
  \ \ -0.0017 \ \ \ 0.9940|]>>

  H误差：9%

  时间误差：1.2%

  <paragraph|2D 冗余2参数>

  <math|\<cal-H\><around|(|\<b-q\>,\<b-p\>|)>=A<rsub|p>*\<b-p\>+B<rsub|p>*\<b-p\><rsup|2>+C<rsub|p>*\<b-p\><rsup|3>+D<rsub|p>p<rsup|4>+A<rsub|q>*\<b-q\>+B<rsub|q>*\<b-q\><rsup|2>+C<rsub|q>*\<b-q\><rsup|3>+D<rsub|q>q<rsup|4>>

  <math|p=<around*|[|0.9990 \ \ -0.0500 \ \ -0.9576
  \ \ -0.0075|]>,<around*|[|0.8657 \ \ \ 0.0905 \ \ -1.0069 \ \ -0.0049|]>>

  <math|q=<around*|[| -0.9841 \ \ -0.0009 \ \ \ 0.9082
  \ \ -0.0701|]>,<around*|[|-0.9802 \ \ \ 0.0017 \ \ \ 0.8578 \ \ -0.1093|]>>

  H误差：9%

  时间误差：0.5%

  <section|下阶段可行方向>

  <subsection|模型普适性>

  这一部分是继续做一些更难或者更现实的模型来说明算法的普适性：

  <\itemize>
    <item> 做更高维的问题（20维-50维），这个对谐振模型已经有结果；

    <item>把模型算法调得更精确（设定阈值让参数在阈值下强行稀疏化）；

    <item>用NN建模Hamiltonian尝试对更一般的H学习和反演；

    <item>用更冗余、多形式的Library来学习一般化的Hamiltonian；

    <item>调研Haizhao Yang 学习表达式树的方式改进模型，学习更复杂的问题；

    <item>调研其他计算分布距离的方法，尝试互信息、JS
    divergence、KL divergence、MMD等；

    \;
  </itemize>

  <subsection|模型优势指标>

  第二部分是尝试从多种指标评判模型的优劣，并依据这些指标的灵敏性分析改善模型

  <\itemize>
    <item>利用反演的时间label通过Sindy进行参数反演，求解得到参数与真实参数进行比较，期望能通过Sindy恢复出原有参数。（问题：恢复出来的时间具有非等距性，可能需要线性多部法）

    <item>将反演相图数据对每一维度的分布进行拟合展示，看看会不会是分布偏差造成的问题，以此研究Wasserstein
    Distance对分布偏差的分辨能力。（若属实则需要借助其他分布距离进行修正）

    <item>学习行星问题：具有多守恒量，比较学到的模型对除Hamiltonian外其他量的精确程度。
  </itemize>

  <section|计划>

  <\itemize>
    <item>稀疏化多项式系统 <math|\<rightarrow\>>10D高维冗余参数系统

    <item>NN 建模Hamiltonian: Neural ODE AND adjoint method

    <item>调研Haizhao Yang 02.01

    <em|><item>调研分布距离 （GAN）02.01<em|>

    <item>相图分布拟合

    <item>行星问题推导
  </itemize>

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
    <associate|auto-10|<tuple|1.2.3|1>>
    <associate|auto-11|<tuple|1.2.4|1>>
    <associate|auto-12|<tuple|1.2.4.1|1>>
    <associate|auto-13|<tuple|1.2.4.2|2>>
    <associate|auto-14|<tuple|1.2.4.3|2>>
    <associate|auto-15|<tuple|2|2>>
    <associate|auto-16|<tuple|2.1|2>>
    <associate|auto-17|<tuple|2.2|2>>
    <associate|auto-18|<tuple|3|3>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.2|1>>
    <associate|auto-4|<tuple|1.2.1|1>>
    <associate|auto-5|<tuple|1.2.1.1|1>>
    <associate|auto-6|<tuple|1.2.1.1.1|1>>
    <associate|auto-7|<tuple|1.2.2|1>>
    <associate|auto-8|<tuple|1.2.2.1|1>>
    <associate|auto-9|<tuple|1.2.2.2|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>现阶段结果>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Neural Canonical Transform
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>直接Wasserstein
      参数回归 <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|2tab>|1.2.1<space|2spc>谐振子
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|4tab>|1D <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.15fn>>

      5D <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.15fn>

      <with|par-left|<quote|2tab>|1.2.2<space|2spc>Lotka\UVolterra System
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|4tab>|1D <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.15fn>>

      <with|par-left|<quote|4tab>|2D <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.15fn>>

      <with|par-left|<quote|2tab>|1.2.3<space|2spc>Henon\UHeiles System
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|2tab>|1.2.4<space|2spc>多项式模型
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|4tab>|1D 冗余1参数
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.15fn>>

      <with|par-left|<quote|4tab>|2D 冗余1参数
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.15fn>>

      <with|par-left|<quote|4tab>|2D 冗余2参数
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14><vspace|0.15fn>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>下阶段可行方向>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>模型普适性
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>模型优势指标
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>计划>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>