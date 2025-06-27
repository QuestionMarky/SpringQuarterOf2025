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