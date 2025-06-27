from cyaron import *

_m = ati([ 100,100,100,1E5,1E5,1E5,1E9,1E9,1E9,1E9 ])
for i in range(len(_m)):
    test_data = IO(file_prefix="a+b_", data_id=i+1)
    m = _m[i]
    a = randint(-m, m)
    b = randint(-m, m)
    test_data.input_writeln(a, b)
    test_data.output_writeln(a + b)
