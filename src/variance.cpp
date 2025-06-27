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