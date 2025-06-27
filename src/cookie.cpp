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