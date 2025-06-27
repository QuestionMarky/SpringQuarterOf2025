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