#!/bin/bash

make rebuild

REGEX_PATTERN_FILE="regex_pattern.txt"
TEST_FILE_1="s21_greptest1.txt"
PATTERN_1_1="Donec"
PATTERN_1_2="risus"


TEST_FILE_2="s21_greptest2.txt"
PATTERN_2_1="en"

TEST_FILE_3="s21_greptest4.txt"
PATTERN_3_1="en"

mkdir tests

echo "- - - - - - - - - - - - - - - - -"
grep -e $PATTERN_2_1 $TEST_FILE_1 > tests/e_grep_test.txt
./s21_grep -e $PATTERN_2_1 $TEST_FILE_1 > tests/e_my_test.txt

echo "Check grep -e option..."
echo "./s21_grep -e $PATTERN_2_1 $TEST_FILE_1"
if diff tests/e_my_test.txt tests/e_grep_test.txt; then
    echo "grep -e flag is done."
else
    echo "Problem with flag -e."
fi
echo "Check leaks -e flag"