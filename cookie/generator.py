from cyaron import *



for i in range(10):
    test_data = IO(file_prefix="reverse_", data_id=i+1)
    if i >= 0 and i <= 2:
        n = randint(1, int(1E9))
        m = 1
    elif i >= 3 and i <= 4:
        n = randint(1, int(1E9))
        m = n
    else:
        n = randint(1, int(1E9))
        m = randint(1, int(1E9))

    test_data.input_writeln(n, m)
    test_data.output_writeln(n // m)

