# This script was written by Deepseek.
# This script is open sourced under WTFPL.

from cyaron import *
import random

def generate_test_case(data_id, n, a_range):
    test_data = IO(file_prefix="variance_", data_id=data_id)
    
    # Choose a mean that is an integer
    mean = random.randint(-a_range, a_range)
    
    # Generate a sequence where the sum is n * mean
    a = []
    remaining_sum = n * mean
    for i in range(n - 1):
        # Generate a_i such that the remaining sum can be achieved
        max_possible = min(a_range, remaining_sum - (n - i - 1) * (-a_range))
        min_possible = max(-a_range, remaining_sum - (n - i - 1) * a_range)
        if max_possible < min_possible:
            # Adjust to ensure possible values
            max_possible = min_possible
        a_i = random.randint(min_possible, max_possible)
        a.append(a_i)
        remaining_sum -= a_i
    a.append(remaining_sum)  # The last element ensures the sum is n * mean
    
    # Now ensure that the variance is an integer
    # Calculate the current sum of (a_i - mean)^2
    sum_sq = sum((x - mean)**2 for x in a)
    if sum_sq % n != 0:
        # Adjust one element to make sum_sq divisible by n
        # Choose an element to adjust
        idx = random.randint(0, n - 1)
        original_val = a[idx]
        # Try to find a new value for a[idx] that keeps the sum as n * mean and makes sum_sq divisible by n
        # This might require some trial and error or a smarter adjustment
        # For simplicity, we'll adjust by adding or subtracting 1 until it works
        for delta in [-1, 1, -2, 2, -3, 3]:
            new_val = original_val + delta
            new_sum = sum(a) - original_val + new_val
            if new_sum != n * mean:
                continue
            new_sum_sq = sum_sq - (original_val - mean)**2 + (new_val - mean)**2
            if new_sum_sq % n == 0:
                a[idx] = new_val
                sum_sq = new_sum_sq
                break
    
    # Write the test case
    test_data.input_writeln(n)
    test_data.input_writeln(' '.join(map(str, a)))
    
    # Calculate the variance
    variance = sum_sq // n
    test_data.output_writeln(variance)

# Generate test cases
_m = [100, 100, 100, 10**5, 10**5, 10**5, 10**9, 10**9, 10**9, 10**9]
for i in range(len(_m)):
    generate_test_case(i + 1, random.randint(1, 100), _m[i])