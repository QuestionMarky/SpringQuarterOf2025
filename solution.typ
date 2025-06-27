#import "problem-template.typ" as tmpl
#import "@preview/fletcher:0.5.8": diagram, node, edge

#show: tmpl.template

#let diagram-colors = (
  tmpl.theme-light-color,
  rgb("#63e0a8"),
  rgb("#ffeaca"),
  rgb("#e9e9e9"),
  rgb("#ffc7c5")
)

= 2025 春季度期末 - Solution

== 加十问题

按题意模拟.

#align(center)[
  #text("main 函数主结构流程", size: .9em)

  #diagram(
    edge-stroke: 0.1em,
    node-corner-radius: 5pt,
    edge-corner-radius: 8pt,
    node((0, 0), [main], fill: diagram-colors.at(0)),
    edge("-|>"),
    node((0, 1), [输入 $n$], fill: diagram-colors.at(1)),
    edge("-|>"),
    node((0, 2), [循环: 定义变量 $i = 1$], fill: diagram-colors.at(2)),
    edge("-|>"),
    node((0, 3), [循环: 是否满足 $i <= n$], fill: diagram-colors.at(2)),
    edge("-|>", [否]),
    node((1.5, 3), [循环结束, 退出], fill: diagram-colors.at(1)),
    edge((0, 3), (0, 4), "-|>", [是]),
    node((0, 4), [循环内: 输入 $a r r_i$, 即 $a r r$ 的第 $i$ 个数], fill: diagram-colors.at(3)),
    edge("-|>"),
    node((0, 5), [循环内: 输出 $a r r_i + 10$, 并输出一个空格], fill: diagram-colors.at(3)),
    edge("-|>"),
    node((0, 6), [循环: 令 $i + 1$], fill: diagram-colors.at(2)),
    edge("l,u,u,u,r", "-|>")
  )
]

#raw(read("./src/+10.cpp"), lang: "cpp")

// ```cpp
// #include <iostream>
// using namespace std;
// // N 为数组 arr 最长的长度
// // 根据题目要求, 给定数组长度最大不超过 100, 为了以防万一, 多开几个, 设为 100 + 5 个
// // 为了安全性考虑, 使用 const 修饰 N 为常量, 表示 N 不能被修改
// const int N = 105;
// // 定义数组 arr
// // 数组 arr 的最大长度为 N, 所以令其为 arr[N]
// // 根据题意 arr 的任意一位数最大为 10 的十五次方, 即 1000000000000000
// // 故不能使用 int 来定义数组, 因为 int 最大只能为 2147483647
// // 而使用 long long 来定义数组, 因为 long long 最大能为 9223372036854775807
// long long arr[N];
// // 定义输入数组的长度 n
// // 注意 N 为输入数组最大时的长度, n 为输入数组的长度
// int n;
// int main() {
//     freopen("+10.in", "r", stdin);
//     freopen("+10.out", "w", stdout);
//
//     // 输入数组长度
//     cin >> n;
//     // 循环: i 从 1 开始, 每次循环增加 1, 直到 i <= n 不成立时结束, 总共循环 n 次
//     for (int i = 1; i <= n; i ++) {
//         // 输入 arr 的第 i 位数
//         cin >> arr[i];
//         // 输出 arr 的第 i 位数 + 10
//         // 因题目要求每个数以空格分割, 故输出一个空格
//         // 被单引号包裹的为一个字符, 如 'A' 表示 A 字符, ' ' 表示空格字符, 单引号内只能包裹一个字符, 如果包含多个字符, 行为是实现定义的, 即不同编译器可能表现不同
//         // 顺便一提, 若想表示多个字符, 需要用双引号包裹, 多个字符组成串, 即字符串, 如 "abc" 表示 abc, "Hello world" 表示 Hello world
//         cout << arr[i] + 10 << ' ';
//     }
//
//     fclose(stdin);
//     fclose(stdout);
//     return 0;
// }
// ```

#v(1em)

#align(center)[ #text("见下页", gray) ]

#pagebreak()

== A+B 问题

按题意模拟, 计算 $a + b$.

#raw(read("./src/a+b.cpp"), lang: "cpp")

/*```cpp
#include <iostream>
using namespace std;
int main() {
    freopen("a+b.in", "r", stdin);
    freopen("a+b.out", "w", stdout);

    // 定义 a, b
    int a, b;
    // 输入 a, b
    cin >> a >> b;
    // 输出 a + b
    cout << a + b;

    fclose(stdin);
    fclose(stdout);
    return 0;
}
```*/

#v(1em)

#align(center)[ #text("见下页", gray) ]

#pagebreak()

== 三位数反转

令输入的数为 $a$, 因为 $a >= 0$.

通过 $floor.l a div 100 floor.r$ 求出百位, $floor.l x floor.r$ 表示对 $x$ 向下取整.

通过 $floor.l a div 10 floor.r mod 10$ 求出十位.

通过 $a mod 10$ 求出个位, $n mod m$ 表示求 $n div m$ 的余数.

最后的结果显然为 $a text("的个位") + a text("的十位") times 10 + a text("的百位") times 100$.

#raw(read("./src/reverse.cpp"), lang: "cpp")

/*```cpp
#include <iostream>
using namespace std;
int main() {
    freopen("reverse.in", "r", stdin);
    freopen("reverse.out", "w", stdout);

    // 定义及输入
    int x;
    cin >> x;
    // 计算百位, 因为 x 和 100 都为整数, 所以 x / 100 不会通过小数的除法进行运算
    // 而是以整数除法的方式运算, 相当于普通的除法运算得出的结果直接去除小数部分, 不需要我们进行向下取整
    // 注意, 直接去除小数部分, 与向下取整不同, 体现在负数, 如 -1.1 向下取整为 -2, 而 -1.1 直接去除小数部分为 -1
    // 本题不会有负数的情况, 所以可以当作一样的
    int a = x / 100;
    // 计算十位, x / 10 为整数, 理由同上
    // % 10 表示除以 10 的余数
    int b = x / 10 % 10;
    // 计算个位
    int c = x % 10;
    // c * 100 变为百位, b * 10 变为十位
    // 把它们加在一起, 即为结果
    cout << c * 100 + b * 10 + a;

    fclose(stdin);
    fclose(stdout);
    return 0;
}
```*/

#v(1em)

#align(center)[ #text("见下页", gray) ]

#pagebreak()

== COOKIE

举个例子, 若盘子长度 $n = 9$, 饼干长度 $m = 4$.

#align(center)[
  当装 $0$ 个饼干的情况.

  #grid(
    fill: (x, y) => {
      let colors = (white,) * 9
      return colors.at(x)
    },
    columns: 9 * (2em,),
    rows: 2em,
    stroke: black
  )
]

#align(center)[
  当装 $1$ 个饼干的情况.

  #grid(
    fill: (x, y) => {
      let colors = (rgb("#ffeec0"),) * 4 + (white,) * 5
      return colors.at(x)
    },
    columns: 9 * (2em,),
    rows: 2em,
    stroke: black
  )
]

#align(center)[
  当装 $2$ 个饼干的情况.

  #grid(
    fill: (x, y) => {
      let colors = (rgb("#ffeec0"),) * 4 + (rgb("#ffd4c0"),) * 4 + (white,) * 5
      return colors.at(x)
    },
    columns: 9 * (2em,),
    rows: 2em,
    stroke: black
  )
]

显然此时装不下第三个饼干了, 因为剩下只有一个空, 而我们的饼干长度 $m = 4 > 1$.

我们可以发现

$
  n div m = a dots b
$

中的 $a$, 就是盘子能装的饼干数量, $b$ 为盘子剩下的空余部分. 在上面的样例中, 即

$
  9 div 4 = 2 dots 1
$

所以我们直接输出 $n div m = a dots b$ 的 $a$ 即可.

#raw(read("./src/cookie.cpp"), lang: "cpp")

/*```cpp
#include <iostream>
using namespace std;
int main() {
    freopen("cookie.in", "r", stdin);
    freopen("cookie.out", "w", stdout);

    // 定义并输入
    int n, m;
    cin >> n >> m;

    // 如解析所说, 计算 n / m, 因为 n 和 m 都是整数, 所以结果也是整数, 相当于解析中的 a.
    cout << n / m;

    fclose(stdin);
    fclose(stdout);
    return 0;
}
```*/

#v(1em)

#align(center)[ #text("见下页", gray) ]

#pagebreak()

== VARIANCE



根据题目提供的公式直接计算即可.

$
sigma = display(frac((a_1-overline(a))^2+(a_2-overline(a))^2+dots.h.c+(a_n-overline(a))^2, n))
$

#align(center)[
  #text("main 函数主结构流程", size: .9em)

  #diagram(
    edge-stroke: 0.1em,
    node-corner-radius: 5pt,
    edge-corner-radius: 8pt,
    node((0, 0), [main], fill: diagram-colors.at(0)),
    edge("-|>"),
    node((0, 1), [定义平均数 $a v e r a g e$ 及方差 $v a r i a n c e$.], fill: diagram-colors.at(1)),
    edge("-|>"),
    node((0, 2), [输入 $n$], fill: diagram-colors.at(1)),
    edge("-|>"),
    node((0, 3), [循环: 定义变量 $i=1$], fill: diagram-colors.at(2)),
    edge("-|>"),
    node((0, 4), [循环: 是否满足 $i <= n$], fill: diagram-colors.at(2)),
    edge("-|>", [是]),
    node((0, 5), [循环内: 输入 $a r r_i$ 即 $a r r$ 的第 $i$ 个数], fill: diagram-colors.at(3)),
    edge("-|>"),
    node((0, 6), [循环内: 将 $a r r_i$ 累加到 $a v e r a g e$ 中], fill: diagram-colors.at(3)),
    edge("-|>"),
    node((0, 7), [循环: 令 $i + 1$], fill: diagram-colors.at(2)),
    edge("l,uuu,r", "-|>"),
    edge((0, 4), "rr", "-|>", [否]),
    node((2, 4), [$a v e r a g e$ (此时为数组内所有数的和) #linebreak() 除以元素个数 $n$ 得到平均数], fill: diagram-colors.at(1)),
    edge("-|>"),
    node((2, 5), [循环: 定义变量 $i=1$], fill: diagram-colors.at(2)),
    edge("-|>"),
    node((2, 6), [循环: 是否满足 $i <= n$], fill: diagram-colors.at(2)),
    edge("-|>", [是]),
    node((2, 7), [循环内: 计算 $(a r r_i - overline(a r r))^2$, #linebreak() 累加进 $v a r i a n c e$.], fill: diagram-colors.at(3)),
    edge("-|>"),
    node((2, 8), [循环: 令 $i + 1$], fill: diagram-colors.at(2)),
    edge("l,uu,r", "-|>"),
    edge((2, 6), "r,ddd,l", "-|>", [否]),
    node((2, 9), [将 $v a r i a n c e div n$ 计算出方差并输出], fill: diagram-colors.at(1)),
    edge("-|>"),
    node((0, 9), [程序结束], fill: diagram-colors.at(1)),
  )
]

#pagebreak()

#raw(read("./src/variance.cpp"), lang: "cpp")

/*
```cpp
#include <iostream>
using namespace std;

const int N = 1e5 + 10;

// 根据题目, n 最大为 10^5, arr_i 最大为 10^7
// 在计算平均数累加时, 最高能达到 10^12, 无法使用 int 存储
// 虽然 arr 中的数本身不会超过 10^7, 但为了方便, 使用 long long
long long arr[N], n;

int main() {
    freopen("variance.in", "r", stdin);
    freopen("variance.out", "w", stdout);

    // average: 平均数
    // variance: 方差
    // 根据题目描述, 保证运算过程中所有结果为整数, 所以使用整数类型
    // 不使用 int 而使用 long long, 理由同上
    long long average = 0, variance = 0;

    // 输入 n 和 arr 数组的各项
    cin >> n;
    for (int i = 1; i <= n; i ++) {
        cin >> arr[i];
        // 累加数组中的所有数, 以计算平均值
        average += arr[i];
    }

    // 计算平均值, 所有数总和除以 n
    average /= n;

    // 计算方差, 先计算分子
    for (int i = 1; i <= n; i ++) {
        // 对于每一个数, 计算该数减去平均数的平方
        // 然后累加到 variance, 即为分子
        variance += (arr[i] - average) * (arr[i] - average);
    }

    // 除以 n, 分母
    variance /= n;

    // 输出方差
    cout << variance;

    fclose(stdin);
    fclose(stdout);
    return 0;
}
```
*/
