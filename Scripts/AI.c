// 成功实现AI百分之九十功能

#include <iostream>
#include <string>
#include <thread>
#include <chrono>
#include <vector>
#include <cstdlib>
#include <ctime>
using namespace std;

void thinking(int seconds) {
    cout << "思考中";
    for (int i = 0; i < seconds; ++i) {
        cout << ".";
        cout.flush();
        this_thread::sleep_for(chrono::seconds(1));
    }
    cout << endl;
}

int main() {
    srand(time(0));
    vector<string> replies = {
        "服务繁忙请稍后再试",
        "网络错误请稍后再试"
    };
    while (true) {
        cout << "\n输入你的问题";
        string n;
        getline(cin, n);
        if (n == "exit") break;
        thinking(5);
        cout << replies[rand() % replies.size()] << endl;
    }
    cout << "程序已退出" << endl;
    return 0;
}