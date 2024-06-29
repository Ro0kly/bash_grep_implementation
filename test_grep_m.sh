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

echo "- - - - - - - - - - - - - - - - -"
grep -e $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_2 > tests/e_grep_multifile_test.txt
./s21_grep -e $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_2 > tests/e_my_multifile_test.txt

echo "Check grep -e option..."
echo "./s21_grep -e $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_2"
if diff tests/e_my_multifile_test.txt tests/e_grep_multifile_test.txt; then
    echo "grep -e flag multifile is done."
else
    echo "Problem with flag multifile -e."
fi

echo "- - - - - - - - - - - - - - - - -"
grep -e char -e int grep.c > tests/multi_e_grep_test.txt
./s21_grep -e char -e int grep.c > tests/multi_e_my_test.txt

echo "Check grep multi -e option..."
echo "./s21_grep -e char -e int grep.c"
if diff tests/multi_e_grep_test.txt tests/multi_e_my_test.txt; then
    echo "grep multi -e flag is done."
else
    echo "Problem with flag multi -e."
fi

echo "- - - - - - - - - - - - - - - - -"
grep -i $PATTERN_2_1 $TEST_FILE_1 > tests/i_grep_test.txt
./s21_grep -i $PATTERN_2_1 $TEST_FILE_1 > tests/i_my_test.txt

echo "Check grep -i option..."
echo "./s21_grep -i $PATTERN_2_1 $TEST_FILE_1"
if diff tests/i_my_test.txt tests/i_grep_test.txt; then
    echo "grep -i flag is done."
else
    echo "Problem with flag -i."
fi

echo "- - - - - - - - - - - - - - - - -"
grep -i $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_2 > tests/i_grep_multifile_test.txt
./s21_grep -i $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_2 > tests/i_my_multifile_test.txt

echo "Check grep -i option..."
echo "./s21_grep -i $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_2"
if diff tests/i_my_multifile_test.txt tests/i_grep_multifile_test.txt; then
    echo "grep -i flag multifile is done."
else
    echo "Problem with flag multifile -i."
fi

echo "- - - - - - - - - - - - - - - - -"
grep -v $PATTERN_2_1 $TEST_FILE_1 > tests/v_grep_test.txt
./s21_grep -v $PATTERN_2_1 $TEST_FILE_1 > tests/v_my_test.txt

echo "Check grep -v option..."
echo "./s21_grep -v $PATTERN_2_1 $TEST_FILE_1"
if diff tests/i_my_test.txt tests/i_grep_test.txt; then
    echo "grep -v flag is done."
else
    echo "Problem with flag -v."
fi

echo "- - - - - - - - - - - - - - - - -"
grep -v $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_2 > tests/v_grep_multifile_test.txt
./s21_grep -v $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_2 > tests/v_my_multifile_test.txt

echo "Check grep -v option..."
echo "./s21_grep -v $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_2"
if diff tests/v_my_multifile_test.txt tests/v_grep_multifile_test.txt; then
    echo "grep -v flag multifile is done."
else
    echo "Problem with flag multifile -v."
fi