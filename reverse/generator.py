from cyaron import *

for i in range(10):
    test_data = IO(file_prefix="reverse_", data_id=i+1)
    a = randint(100, 999)
    test_data.input_writeln(a)
    test_data.output_writeln((a // 100) + (a // 10 % 10) * 10 + (a % 10) * 100)
