#!/usr/bin/env python3

import argparse
import string
import secrets
import sys

CONFUSING_CHARS = "0OIl1"

def build_charset(mode, exclude_confusing):
    charset = ""

    if mode == "numbers":
        charset = string.digits
    elif mode == "letters":
        charset = string.ascii_letters
    elif mode == "symbols":
        charset = string.punctuation
    elif mode == "mixed":
        charset = string.ascii_letters + string.digits + string.punctuation
    else:
        print("Invalid mode")
        sys.exit(1)

    if exclude_confusing:
        charset = "".join(c for c in charset if c not in CONFUSING_CHARS)

    if not charset:
        print("Character set is empty")
        sys.exit(1)

    return charset

def generate_password(length, charset):
    return "".join(secrets.choice(charset) for _ in range(length))

def main():
    parser = argparse.ArgumentParser(
        description="Vapour Password Generator"
    )

    parser.add_argument(
        "--length", "-l",
        type=int,
        required=True,
        help="Password length"
    )

    parser.add_argument(
        "--mode",
        choices=["numbers", "letters", "symbols", "mixed"],
        default="mixed",
        help="Password mode (default: mixed)"
    )

    parser.add_argument(
        "--count", "-c",
        type=int,
        default=1,
        help="Number of passwords"
    )

    parser.add_argument(
        "--exclude",
        choices=["confusing"],
        help="Exclude confusing characters (0 O I l 1)"
    )

    args = parser.parse_args()

    if args.length <= 0:
        print("Length must be greater than 0")
        sys.exit(1)

    charset = build_charset(
        args.mode,
        args.exclude == "confusing"
    )

    for _ in range(args.count):
        print(generate_password(args.length, charset))

if __name__ == "__main__":
    main()
