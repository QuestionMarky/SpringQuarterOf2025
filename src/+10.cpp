#include <iostream>
using namespace std;
// N 为数组 arr 最长的长度
// 根据题目要求, 给定数组长度最大不超过 100, 为了以防万一, 多开几个, 设为 100 + 5 个
// 为了安全性考虑, 使用 const 修饰 N 为常量, 表示 N 不能被修改
const int N = 105;
// 定义数组 arr
// 数组 arr 的最大长度为 N, 所以令其为 arr[N]
// 根据题意 arr 的任意一位数最大为 10 的十五次方, 即 1000000000000000
// 故不能使用 int 来定义数组, 因为 int 最大只能为 2147483647
// 而使用 long long 来定义数组, 因为 long long 最大能为 9223372036854775807
long long arr[N];
// 定义输入数组的长度 n
// 注意 N 为输入数组最大时的长度, n 为输入数组的长度
int n;
int main() {
    freopen("+10.in", "r", stdin);
    freopen("+10.out", "w", stdout);

    // 输入数组长度
    cin >> n;
    // 循环: i 从 1 开始, 每次循环增加 1, 直到 i <= n 不成立时结束, 总共循环 n 次
    for (int i = 1; i <= n; i ++) {
        // 输入 arr 的第 i 位数
        cin >> arr[i];
        // 输出 arr 的第 i 位数 + 10
        // 因题目要求每个数以空格分割, 故输出一个空格
        // 被单引号包裹的为一个字符, 如 'A' 表示 A 字符, ' ' 表示空格字符, 单引号内只能包裹一个字符, 如果包含多个字符, 行为是实现定义的, 即不同编译器可能表现不同
        // 顺便一提, 若想表示多个字符, 需要用双引号包裹, 多个字符组成串, 即字符串, 如 "abc" 表示 abc, "Hello world" 表示 Hello world
        cout << arr[i] + 10 << ' ';
    }

    fclose(stdin);
    fclose(stdout);
    return 0;
}