#Erhuoǰ���������

Erhuo������һ��������html��ʽ��������ԣ���ʹ��[boson](https://github.com/ictxiangxin/boson)����.

* Erhuo��Դ��ʮ�ּ�
* Erhuo��ʹ��Ҳ�ǳ���

example.txt����һ��Դ�����ӡ�

##����Erhuo
ʹ��`boson`����`erhuo.g`��`erhuo.l`�������ļ��Ϳ�������Erhuo�ı�������

����ָ�����£�

`boson.py erhuo.g -l erhuo.l -a lalr -o erhuo.py`

������`erhuo.py`�󣬾Ϳ��Ա���Erhuo�����ˣ�

`erhuo.py example.txt example.html`

����`example.html`���Ǳ������ɵ�html�ļ���

##�﷨����

ĿǰErhuo��2���﷨��ʽ��һ�������������һ���Ǻ������塣

###��ǩ����

`html��ǩ { �����б� ; ��Ԫ���б� }`

* `�����б�`��`��Ԫ���б�`ֱ���ԷֺŸ�����
* `�����б�`��`��Ԫ���б�`������Ϊ�ա�
* `�����б�`�����������Զ��ŷֿ���`����, ����, ...`��
* `����`�ı�ʾΪ`������ : ����ֵ`��
* `��Ԫ���б�`��������Ԫ���Զ��ŷֿ���`��Ԫ��, ��Ԫ��, ...`��
* `��Ԫ��`������һ���µı�ǩ������һ����������һ���ַ�����

���磺

```
div {id: "1", class: "container";
    h4 {; "Hello World"}
}
```

###��������

`let ������(�����б�) = ��ǩ����`

* `��ǩ����`�е�һЩֵ���������滻��

���磺

`let button(text) = button {class: "btn btn-primary; text"}`

##�ƻ�����
* ���������
* �������ʽ���ܡ�
* ����ͷ�ļ����빦�ܡ�