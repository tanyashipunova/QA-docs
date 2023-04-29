# Задача. Из строки вывести подстроку с наибольшим количеством одинаковых знаков.

def find_substr(S):
    if len(S) <= 1:
        return len(S)

    counter = 1
    max_count = 1
    for i in range(len(S)-1):
        max_count = max(max_count, counter)
        if S[i] == S[i+1]:
            counter += 1
        else:
            counter = 1

    return max(counter, max_count)