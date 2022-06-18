#!/usr/bin/env python3

# Function to calculate minimum
# possible sum of all (arr[i] - b + i)
def MinSum(arr, N):

# Modify the array
	for i in range(N):
		arr[i] -= (i+1)

	# sort the array
	arr.sort()

	# calculate median
	b = arr[N//2]

	# Stores the required answer
	ans = 0
	for i in range(N):

	# Update answer
		ans += abs(arr[i]-b)

		# Return the answer
	return ans

# Driver code
arr = [1, 5, 2, -2]
N = len(arr)
print(MinSum(arr, N))

# This code is contributed by Parth Manchanda
