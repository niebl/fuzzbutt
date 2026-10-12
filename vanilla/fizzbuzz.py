#!/usr/bin/env python3
N=100
phrase_a = "Fizz"
phrase_b = "Buzz"

def main():
    for i in range(1, N+1):
        out = ""
        if i % 3 == 0:
            out += "Fizz"
        if i % 5 == 0:
            out += "Buzz"
        print(out or i)

if __name__ == "__main__":
    main()
