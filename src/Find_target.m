function [x,y] = Find_target(a,x_target, y_target)
%�����û�����ĵص�ƥ���Ӧ������
load('x_target.mat');
load('y_target.mat');
count = 0;

Target = [string('����'),string ('�Ʒ�'), string('����'),string ('��ʳ��'),string ('УҽԺ') ...
         string('������'), string('����ٳ�'),string ('��ɳ'),string( '���'), string('����') ...
        string ('����'), string('�ƹ�����'),string ('����¥'),string ('С�糡'), string('ͼ���') ...
         string('����ΰ¥'),string ('��һ'), string('����'), string('����'),string ('����') ...
        string ('����'), string('����'), string('����'), string('����'),string ('���������') ...
        string( '���д�¥'),string ('����ʵ������'),string( '�𹤴�¥'),string( '��ѧʵ����'),string( '����ʵ����') ...
        string ('ҽѧԺ'), string('ҩѧԺ'), string('ҽѧԺͼ���'),string( '�˹�������'), string('������ѧѧԺ') ...
         string('������'), string('������'),string( '��һ��'), string('����'),string( 'ũ����') ...
         string('��Ħ��¥'),string( '������ѧ�о�Ժ'), string('����������´���'), string('��ˮ������') ...
         string('������'),string('���ƺ')];
for i = 1:46
    if strcmp(a, Target(i))
        x = x_target(i);
        y = y_target(i);
        count = 1;
    end
end

if count == 0
    fprintf('����ص���Ч�����������룡\n');
    x = 0;
    y = 0;
end
x = round(x*1024/724);
y = round(y);
end

