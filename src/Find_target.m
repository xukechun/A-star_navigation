function [x,y] = Find_target(a,x_target, y_target)
%根据用户输入的地点匹配对应的坐标
load('x_target.mat');
load('y_target.mat');
count = 0;

Target = [string('蓝田'),string ('云峰'), string('丹青'),string ('大食堂'),string ('校医院') ...
         string('体育馆'), string('风雨操场'),string ('白沙'),string( '翠柏'), string('东操') ...
        string ('西操'), string('灯光篮球场'),string ('月牙楼'),string ('小剧场'), string('图书馆') ...
         string('蒙明伟楼'),string ('东一'), string('东二'), string('东五'),string ('东三') ...
        string ('东四'), string('东六'), string('西区'), string('网球场'),string ('计算机中心') ...
        string( '安中大楼'),string ('海洋实验中心'),string( '金工大楼'),string( '化学实验室'),string( '生物实验室') ...
        string ('医学院'), string('药学院'), string('医学院图书馆'),string( '人工气候室'), string('生命科学学院') ...
         string('东三门'), string('东二门'),string( '东一门'), string('北门'),string( '农生环') ...
         string('李摩西楼'),string( '生命科学研究院'), string('行政服务办事大厅'), string('临水报告厅') ...
         string('大西区'),string('大草坪')];
for i = 1:46
    if strcmp(a, Target(i))
        x = x_target(i);
        y = y_target(i);
        count = 1;
    end
end

if count == 0
    fprintf('输入地点无效，请重新输入！\n');
    x = 0;
    y = 0;
end
x = round(x*1024/724);
y = round(y);
end

