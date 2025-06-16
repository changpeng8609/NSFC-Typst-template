/*
作者：常鹏
email: chang1986@swu.edu.cn
西南大学资源环境学院
Typst版本：0.13.0
日期：2025年06月17日
*/
#import "@preview/numbly:0.1.0": numbly
#import "@preview/cuti:0.3.0": show-cn-fakebold
#show: show-cn-fakebold

//设置页面格式和默认字体格式
/// 字体、字号设置
#let 字号 = (
  一英寸: 72pt,
  大特号: 63pt,
  特号: 54pt,
  初号: 42pt,
  小初: 36pt,
  一号: 26pt,
  小一: 24pt,
  二号: 22pt,
  小二: 18pt,
  三号: 16pt,
  小三: 15pt,
  四号: 14pt,
  小四: 12pt,
  五号: 10.5pt,
  小五: 9pt,
  六号: 7.5pt,
  小六: 6.5pt,
  七号: 5.5pt,
  八号: 5pt,
)

#let 字体 = (
  仿宋: ("Times New Roman", "FangSong"),
  宋体: ("Times New Roman", "SimSun"),
  黑体: ("Arial", "SimHei"),
  楷体: ("Times New Roman", "KaiTi"),
  隶书: ("Times New Roman", "LiSu"),
  微软雅黑: ("Microsoft YaHei", "Microsoft YaHei UI"),
  新宋体: ("Times New Roman", "NSimSun"),
  幼圆: ("Microsoft YaHei", "YouYuan"),
  代码: ("New Computer Modern Mono", "Times New Roman", "SimSun"),
)

//图片和表格设置
#show figure.where(kind: table): set figure.caption(position: top)
#show figure.caption: it => [
#text(size:字号.五号,font:字体.黑体)[#it.supplement#context it.counter.display(it.numbering).#h(0.5em)#it.body
]]

#set table(
  stroke: (x, y) => if y == 0 {
    (top: 1.5pt + black,bottom: 0.8pt + black)
  },
  align: (x, y) => (
    if x > 0 { center }
    else { left }
  )
)
#show table.cell: it => {
  if it.y == 0 {
    set text(size:字号.小五)
    strong(it)
  } else {
    set text(size:字号.小五)
    it
  } 
  }

/*图片、表格使用模板，复制后使用
//图片
#par()[#text(size: 1em)[#h(0.0em)]]//图表上方空行
#figure(
image("images/1-ATMT-mechanism.svg",width: 100%),
placement: none,// 设置图片位置为none(当前插入位置不变），可选参数auto,top,bottom
caption: [例图1标题//中文图表标题.

#text(font:字体.宋体,size:字号.小五)[
中文图注//中文图表说明
]
#v(1em)
],
supplement: [图],
kind: figure
)<fig:例图1>// 图表标签
#par()[#text(size: 1em)[#h(0.0em)]]//图表下方空行

//表格
#par()[#text(size: 1em)[#h(0.0em)]]//表格上方空行
#figure(
  placement: none,// 设置图片位置为none(当前插入位置不变），可选参数auto,top,bottom
table(
    columns: 3,
    [Name], [Age], [Strength],
    table.cell(
      rowspan: 3,
      align: horizon,
      rotate(-90deg, reflow: true)[
        year
      ],
    ),
    [Name], [Age], 
    [Hannes], [Strength],
    table.cell(colspan: 2)[24],
    table.hline(start: 0,stroke:1.5pt),
    table.cell(colspan:3,align: left)[#text(字号.六号)[table note:]]// 表格注释
    ),
caption: [例表1],//中文表格标题
supplement: [表],
kind: table,
)<tab:例表1>// 表格标签
#par()[#text(size: 1em)[#h(0.0em)]]//表格下方空行

//无标题表格
#par()[#text(size: 1em)[#h(0.0em)]]//表格上方空行
#align(center)[
  #table(
    columns: 3,
    [Name], [Age], [Strength],
    table.cell(
      rowspan: 3,
      align: horizon,
      rotate(-90deg, reflow: true)[
        year
      ],
    ),
    [Name], [Age], 
    [Hannes], [Strength],
    table.cell(colspan: 2)[24],
    table.hline(start: 0,stroke:1.5pt)
)]
#par()[#text(size: 1em)[#h(0.0em)]]//表格下方空行
*/

// 设置默认字体和字号
#set text(font:("Times New Roman", "Kaiti"), size: 12pt) 
#set page(
  margin: (top: 2.5cm, left: 3cm, right: 3cm, bottom: 2.5cm),
  paper: "a4",
  numbering: none,
)
#set par(
  leading: 14pt, // 行距
  first-line-indent: 2em, // 首行缩进
  linebreaks: "optimized", // 优化换行
  justify: true, // 两端对齐
  spacing: 1em // 段间距
)
//设置特定字符串的最终显示格式，在输入时无需考虑其格式。用于常用的化学式、斜体等设置
#show "Cu2+":[Cu#super[2+]]
#show "lcc3":[#emph[lcc3]]
#show "Dichomitus squalens":[#emph[Dichomitus squalens]]
#show "Agrobacterium tumefaciens":[#emph[Agrobacterium tumefaciens]]
#show "D. squalens":[#emph[D. squalens]]
#show "A. tumefaciens":[#emph[A. tumefaciens]]
#show "Escherichia coli":[#emph[Escherichia coli]]
#show "E. coli":[#emph[E. coli]]
// 定义模板的蓝色
#let nsfcblue(it) = {
  text(14pt,fill:rgb(0, 112, 192))[ 
  #it
  ]}
#set heading(numbering: numbly(
    "{1:I}. ",
    "{1}.{2} ",
    "{1}.{2}.{3} ",
    "{1}.{2}.{3}.{4} ",
    "{1}.{2}.{3}.{4}.{5} ",
  ))
#show heading.where(level:1): it => {
  par()[#text(size: 0.01em)[#h(0.0em)]]
  text(size:字号.四号,font: 字体.黑体,)[#it]
  par()[#text(size: 0.01em)[#h(0.0em)]]
}
#show heading.where(level:2): it => {
  par()[#text(size: 0.01em)[#h(0.0em)]]
  text(size:字号.小四,font: 字体.黑体,)[#it]
  par()[#text(size: 0.01em)[#h(0.0em)]]
}
#show heading.where(level:3): it => {
  par()[#text(size: 0.01em)[#h(0.0em)]]
  text(size:字号.五号,font: 字体.黑体,)[#it]
  par()[#text(size: 0.01em)[#h(0.0em)]]
}


//正文部分  
/////////////////////////////////////////////////////////////////////////////////////////////
#align(center)[
#text(size: 字号.三号)[*报告正文*]]
#v(22pt)
#text(size: 字号.四号)[
参照以下提纲撰写，要求内容翔实、清晰，层次分明，标题突出。#nsfcblue[*请勿删除或改动下述提纲标题及括号中的文字。*]]

#nsfcblue()[*（一）立项依据与研究内容（建议8000字以下）：*

*1．项目的立项依据*（研究意义、国内外研究现状及发展动态分析，需结合科学研究发展趋势来论述科学意义；或结合国民经济和社会发展中迫切需要解决的关键科技问题来论述其应用前景。附主要参考文献目录）；]
/////////////////////////////////////////////////////////////////////////////////////////////

= 研究背景
#lorem(100)
#par()[#text(size: 1em)[#h(0.0em)]]//图表上方空行
#figure(
image("images/1-ATMT-mechanism.svg",width: 100%),
placement: none,// 设置图片位置为none(当前插入位置不变），可选参数auto,top,bottom
caption: [例图1标题//中文图表标题.

#text(font:字体.宋体,size:字号.小五)[
中文图注//中文图表说明
]
#v(1em)
],
supplement: [图],
kind: figure
)<fig:例图1>// 图表标签
#par()[#text(size: 1em)[#h(0.0em)]]//图表下方空行

= 国内外研究现状
#lorem(100)
#par()[#text(size: 1em)[#h(0.0em)]]//表格上方空行
#figure(
  placement: none,// 设置图片位置为none(当前插入位置不变），可选参数auto,top,bottom
table(
    columns: 3,
    [Name], [Age], [Strength],
    table.cell(
      rowspan: 3,
      align: horizon,
      rotate(-90deg, reflow: true)[
        year
      ],
    ),
    [Name], [Age], 
    [Hannes], [Strength],
    table.cell(colspan: 2)[24],
    table.hline(start: 0,stroke:1.5pt),
    table.cell(colspan:3,align: left)[#text(字号.六号)[table note:]]// 表格注释
    ),
caption: [例表1],//中文表格标题
supplement: [表],
kind: table,
)<tab:例表1>// 表格标签
#par()[#text(size: 1em)[#h(0.0em)]]//表格下方空行
== 2级标题
#lorem(100)
=== 3级标题
#lorem(100)

= 发展动态分析
#lorem(100)

= 研究意义
#lorem(100)

= 应用前景
#lorem(100)


= 参考文献
#bibliography("ref.bib",title:none,full:false,style: "config/gb-t-7714-2015-numeric-no-doi.csl")
// 使用GB/T 7714-2015格式的参考文献样式


/////////////////////////////////////////////////////////////////////////////////////////////
#pagebreak()
#counter(heading).update(0)
#nsfcblue()[
  #h(2em)*2．项目的研究内容、研究目标，以及拟解决的关键科学问题*（此部分为重点阐述内容）；]
/////////////////////////////////////////////////////////////////////////////////////////////

= 研究内容

= 研究目标

= 拟解决的关键科学问题

/////////////////////////////////////////////////////////////////////////////////////////////
#pagebreak()
#counter(heading).update(0)
#nsfcblue()[
#h(2em)*3．拟采取的研究方案及可行性分析*（包括研究方法、技术路线、实验手段、关键技术等说明）；
]
/////////////////////////////////////////////////////////////////////////////////////////////
= 拟采取的研究方案

= 研究内容
= 研究方法
= 技术路线图
= 可行性分析





/////////////////////////////////////////////////////////////////////////////////////////////
#pagebreak()
#counter(heading).update(0)
#nsfcblue()[#h(2em)*4．本项目的特色与创新之处；*]
/////////////////////////////////////////////////////////////////////////////////////////////




/////////////////////////////////////////////////////////////////////////////////////////////
#nsfcblue()[
  *5．年度研究计划及预期研究结果*（包括拟组织的重要学术交流活动、国际合作与交流计划等）。]
/////////////////////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////////////////////
#pagebreak()
#counter(heading).update(0)
#nsfcblue()[#h(2em)*（二）研究基础与工作条件*]

#nsfcblue()[
*1．研究基础*（与本项目相关的研究工作积累和已取得的研究工作成绩）；]
/////////////////////////////////////////////////////////////////////////////////////////////
= 研究基础
#lorem(100)
= 相关研究工作积累
#lorem(100)

= 已取得的研究工作成绩
#lorem(100)

/////////////////////////////////////////////////////////////////////////////////////////////
#nsfcblue()[
*2．工作条件*（包括已具备的实验条件，尚缺少的实验条件和拟解决的途径，包括利用国家实验室、全国重点实验室和部门重点实验室等研究基地的计划与落实情况）；]
/////////////////////////////////////////////////////////////////////////////////////////////





/////////////////////////////////////////////////////////////////////////////////////////////
#nsfcblue()[
  *3．正在承担的与本项目相关的科研项目情况*（申请人和主要参与者正在承担的与本项目相关的科研项目情况，包括国家自然科学基金的项目和国家其他科技计划项目，要注明项目的资助机构、项目类别、批准号、项目名称、获资助金额、起止年月、与本项目的关系及负责的内容等）；]
/////////////////////////////////////////////////////////////////////////////////////////////





/////////////////////////////////////////////////////////////////////////////////////////////
#nsfcblue()[
  *4．完成国家自然科学基金项目情况*（对申请人负责的前一个已资助期满的科学基金项目（项目名称及批准号）完成情况、后续研究进展及与本申请项目的关系加以详细说明。另附该项目的研究工作总结摘要（限500字）和相关成果详细目录）。]
/////////////////////////////////////////////////////////////////////////////////////////////




/////////////////////////////////////////////////////////////////////////////////////////////
#nsfcblue()[*（三）其他需要说明的情况*]

#nsfcblue()[
  1．申请人同年申请不同类型的国家自然科学基金项目情况（列明同年申请的其他项目的项目类型、项目名称信息，并说明与本项目之间的区别与联系；已收到自然科学基金委不予受理或不予资助决定的，无需列出）。]
/////////////////////////////////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////////////////////////////////
#nsfcblue()[
2．具有高级专业技术职务（职称）的申请人或者主要参与者是否存在同年申请或者参与申请国家自然科学基金项目的单位不一致的情况；如存在上述情况，列明所涉及人员的姓名，申请或参与申请的其他项目的项目类型、项目名称、单位名称、上述人员在该项目中是申请人还是参与者，并说明单位不一致原因。]
/////////////////////////////////////////////////////////////////////////////////////////////





/////////////////////////////////////////////////////////////////////////////////////////////
#nsfcblue()[
3．具有高级专业技术职务（职称）的申请人或者主要参与者是否存在与正在承担的国家自然科学基金项目的单位不一致的情况；如存在上述情况，列明所涉及人员的姓名，正在承担项目的批准号、项目类型、项目名称、单位名称、起止年月，并说明单位不一致原因。]
/////////////////////////////////////////////////////////////////////////////////////////////





/////////////////////////////////////////////////////////////////////////////////////////////
#nsfcblue()[
4．同年以不同专业技术职务（职称）申请或参与申请科学基金项目的情况（应详细说明原因）。]
/////////////////////////////////////////////////////////////////////////////////////////////





/////////////////////////////////////////////////////////////////////////////////////////////
#nsfcblue()[5．其它]
/////////////////////////////////////////////////////////////////////////////////////////////
