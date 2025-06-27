from cyaron import *

_n = ati([ 10,10,10,30,30,50,50,100,100,100 ])
_m = ati([ 100,100,100,1E5,1E5,1E5,1E9,1E9,1E9,1E15 ])

for i in range(len(_n)):
    test_data = IO(file_prefix="+10_", data_id=i+1)
    n = _n[i]
    m = _m[i]
    test_data.input_writeln(n)
    lst = []
    for i in range(n):
        lst.append(randint(-m,m))
    test_data.input_writeln(*lst)
    lst_answer = [x + 10 for x in lst]
    test_data.output_writeln(*lst_answer)
