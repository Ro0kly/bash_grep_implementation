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

echo "- - - - - - - - - - - - - - - - -"
grep -c $PATTERN_2_1 $TEST_FILE_1 > tests/c_grep_test.txt
./s21_grep -c $PATTERN_2_1 $TEST_FILE_1 > tests/c_my_test.txt

echo "Check grep -c option..."
echo "./s21_grep -c $PATTERN_2_1 $TEST_FILE_1"
if diff tests/c_my_test.txt tests/c_grep_test.txt; then
    echo "grep -c flag is done."
else
    echo "Problem with flag -c."
fi

echo "- - - - - - - - - - - - - - - - -"
grep -c $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_2 > tests/c_grep_multifile_test.txt
./s21_grep -c $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_2 > tests/c_my_multifile_test.txt

echo "Check grep -c option..."
echo "./s21_grep -c $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_2"
if diff tests/c_my_multifile_test.txt tests/c_grep_multifile_test.txt; then
    echo "grep -c flag multifile is done."
else
    echo "Problem with flag multifile -c."
fi

echo "- - - - - - - - - - - - - - - - -"
grep -l $PATTERN_2_1 $TEST_FILE_1 > tests/l_grep_test.txt
./s21_grep -l $PATTERN_2_1 $TEST_FILE_1 > tests/l_my_test.txt

echo "Check grep -l option..."
echo "./s21_grep -l $PATTERN_2_1 $TEST_FILE_1"
if diff tests/l_my_test.txt tests/l_grep_test.txt; then
    echo "grep -l flag is done."
else
    echo "Problem with flag -l."
fi

echo "- - - - - - - - - - - - - - - - -"
grep -l $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_2 > tests/l_grep_multifile_test.txt
./s21_grep -l $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_2 > tests/l_my_multifile_test.txt

echo "Check grep -l option..."
echo "./s21_grep -l $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_2"
if diff tests/l_my_multifile_test.txt tests/l_grep_multifile_test.txt; then
    echo "grep -l flag multifile is done."
else
    echo "Problem with flag multifile -l."
fi

echo "- - - - - - - - - - - - - - - - -"
grep -n $PATTERN_2_1 $TEST_FILE_1 > tests/n_grep_test.txt
./s21_grep -n $PATTERN_2_1 $TEST_FILE_1 > tests/n_my_test.txt

echo "Check grep -n option..."
echo "./s21_grep -n $PATTERN_2_1 $TEST_FILE_1"
if diff tests/n_my_test.txt tests/n_grep_test.txt; then
    echo "grep -n flag is done."
else
    echo "Problem with flag -n."
fi

echo "- - - - - - - - - - - - - - - - -"
grep -n $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_2 > tests/n_grep_multifile_test.txt
./s21_grep -n $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_2 > tests/n_my_multifile_test.txt

echo "Check grep -n option..."
echo "./s21_grep -n $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_2"
if diff tests/n_my_multifile_test.txt tests/n_grep_multifile_test.txt; then
    echo "grep -n flag multifile is done."
else
    echo "Problem with flag multifile -n."
fi

echo "- - - - - - - - - - - - - - - - -"
grep -h $PATTERN_2_1 $TEST_FILE_1 > tests/h_grep_test.txt
./s21_grep -h $PATTERN_2_1 $TEST_FILE_1 > tests/h_my_test.txt

echo "Check grep -h option..."
echo "./s21_grep -h $PATTERN_2_1 $TEST_FILE_1"
if diff tests/h_my_test.txt tests/h_grep_test.txt; then
    echo "grep -h flag is done."
else
    echo "Problem with flag -h."
fi

echo "- - - - - - - - - - - - - - - - -"
grep -h $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_2 > tests/h_grep_multifile_test.txt
./s21_grep -h $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_2 > tests/h_my_multifile_test.txt

echo "Check grep -h option..."
echo "./s21_grep -h $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_2"
if diff tests/h_my_multifile_test.txt tests/h_grep_multifile_test.txt; then
    echo "grep -h flag multifile is done."
else
    echo "Problem with flag multifile -h."
fi

echo "- - - - - - - - - - - - - - - - -"
grep -s $PATTERN_2_1 something > tests/s_grep_test.txt
./s21_grep -s $PATTERN_2_1 something > tests/s_my_test.txt

echo "Check grep -s option..."
echo "./s21_grep -s $PATTERN_2_1 something"
if diff tests/s_my_test.txt tests/s_grep_test.txt; then
    echo "grep -s flag is done."
else
    echo "Problem with flag -s."
fi

echo "- - - - - - - - - - - - - - - - -"
grep -s $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_3 > tests/s_grep_multifile_test.txt
./s21_grep -s $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_3 > tests/s_my_multifile_test.txt

echo "Check grep -s option..."
echo "./s21_grep -s $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_3"
if diff tests/s_my_multifile_test.txt tests/s_grep_multifile_test.txt; then
    echo "grep -s flag multifile is done."
else
    echo "Problem with flag multifile -s."
fi

echo "- - - - - - - - - - - - - - - - -"
grep -f $REGEX_PATTERN_FILE grep.c > tests/f_grep_test.txt
./s21_grep -f $REGEX_PATTERN_FILE grep.c > tests/f_my_test.txt

echo "Check grep -f option..."
echo "./s21_grep -f $REGEX_PATTERN_FILE grep.c"
if diff tests/f_my_test.txt tests/f_grep_test.txt; then
    echo "grep -f flag is done."
else
    echo "Problem with flag -f."
fi

echo "- - - - - - - - - - - - - - - - -"
grep -f $REGEX_PATTERN_FILE -e char grep.c > tests/multi_f_grep_test.txt
./s21_grep -f $REGEX_PATTERN_FILE -e char grep.c > tests/multi_f_my_test.txt

echo "Check grep -f option..."
echo "./s21_grep -f $REGEX_PATTERN_FILE -e char grep.c"
if diff tests/multi_f_grep_test.txt tests/multi_f_my_test.txt; then
    echo "grep multi -f flag is done."
else
    echo "Problem with flag multi -f."
fi

echo "- - - - - - - - - - - - - - - - -"
grep -o int grep.c > tests/o_grep_test.txt
./s21_grep -o int grep.c > tests/o_my_test.txt

echo "Check grep -o option..."
echo "./s21_grep -o int grep.c"
if diff tests/o_my_test.txt tests/o_grep_test.txt; then
    echo "grep -o flag is done."
else
    echo "Problem with flag -o."
fi

echo "- - - - - - - - - - - - - - - - -"
grep -o $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_2 > tests/o_grep_multifile_test.txt
./s21_grep -o $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_2 > tests/o_my_multifile_test.txt

echo "Check grep -o option..."
echo "./s21_grep -o $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_2"
if diff tests/o_my_multifile_test.txt tests/o_grep_multifile_test.txt; then
    echo "grep -o flag multifile is done."
else
    echo "Problem with flag multifile -o."
fi

echo "- - - - - - - - - - - - - - - - -"
grep -iv $PATTERN_2_1 $TEST_FILE_1 > tests/iv_grep_test.txt
./s21_grep -iv $PATTERN_2_1 $TEST_FILE_1 > tests/iv_my_test.txt

echo "Check grep -iv option..."
echo "./s21_grep -iv $PATTERN_2_1 $TEST_FILE_1"
if diff tests/iv_my_test.txt tests/iv_grep_test.txt; then
    echo "grep -iv flag is done."
else
    echo "Problem with flag -iv."
fi

echo "- - - - - - - - - - - - - - - - -"
grep -in $PATTERN_2_1 $TEST_FILE_1 > tests/in_grep_test.txt
./s21_grep -in $PATTERN_2_1 $TEST_FILE_1 > tests/in_my_test.txt

echo "Check grep -in option..."
echo "./s21_grep -in $PATTERN_2_1 $TEST_FILE_1"
if diff tests/in_my_test.txt tests/in_grep_test.txt; then
    echo "grep -in flag is done."
else
    echo "Problem with flag -in."
fi

echo "- - - - - - - - - - - - - - - - -"
grep -ic $PATTERN_2_1 $TEST_FILE_1 > tests/ic_grep_test.txt
./s21_grep -ic $PATTERN_2_1 $TEST_FILE_1 > tests/ic_my_test.txt

echo "Check grep -ic option..."
echo "./s21_grep -ic $PATTERN_2_1 $TEST_FILE_1"
if diff tests/ic_my_test.txt tests/ic_grep_test.txt; then
    echo "grep -ic flag is done."
else
    echo "Problem with flag -ic."
fi

echo "- - - - - - - - - - - - - - - - -"
grep -il $PATTERN_2_1 $TEST_FILE_1 > tests/il_grep_test.txt
./s21_grep -il $PATTERN_2_1 $TEST_FILE_1 > tests/il_my_test.txt

echo "Check grep -il option..."
echo "./s21_grep -il $PATTERN_2_1 $TEST_FILE_1"
if diff tests/il_my_test.txt tests/il_grep_test.txt; then
    echo "grep -il flag is done."
else
    echo "Problem with flag -il."
fi