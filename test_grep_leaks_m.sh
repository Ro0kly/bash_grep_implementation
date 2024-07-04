make rebuild

REGEX_PATTERN_FILE="regex_pattern.txt"
TEST_FILE_1="s21_greptest1.txt"
PATTERN_1_1="Donec"
PATTERN_1_2="risus"


TEST_FILE_2="s21_greptest2.txt"
PATTERN_2_1="en"

TEST_FILE_3="s21_greptest4.txt"
PATTERN_3_1="en"

echo "- - - - - - - - - - - - - - - - -"

echo "Check grep -e option..."
leaks -atExit -- ./s21_grep -e $PATTERN_2_1 $TEST_FILE_1

echo "- - - - - - - - - - - - - - - - -"

echo "Check grep -e option..."
leaks -atExit -- ./s21_grep -e $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_2

echo "- - - - - - - - - - - - - - - - -"

echo "Check grep multi -e option..."
leaks -atExit -- ./s21_grep -e char -e int grep.c

echo "- - - - - - - - - - - - - - - - -"

echo "Check grep -i option..."
leaks -atExit -- ./s21_grep -i $PATTERN_2_1 $TEST_FILE_1

echo "- - - - - - - - - - - - - - - - -"

echo "Check grep -i option..."
leaks -atExit -- ./s21_grep -i $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_2

echo "- - - - - - - - - - - - - - - - -"

echo "Check grep -v option..."
leaks -atExit -- ./s21_grep -v $PATTERN_2_1 $TEST_FILE_1

echo "- - - - - - - - - - - - - - - - -"

echo "Check grep -v option..."
leaks -atExit -- ./s21_grep -v $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_2

echo "- - - - - - - - - - - - - - - - -"

echo "Check grep -c option..."
leaks -atExit -- ./s21_grep -c $PATTERN_2_1 $TEST_FILE_1

echo "- - - - - - - - - - - - - - - - -"

echo "Check grep -c option..."
leaks -atExit -- ./s21_grep -c $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_2

echo "- - - - - - - - - - - - - - - - -"

echo "Check grep -l option..."
leaks -atExit -- ./s21_grep -l $PATTERN_2_1 $TEST_FILE_1

echo "- - - - - - - - - - - - - - - - -"

echo "Check grep -l option..."
leaks -atExit -- ./s21_grep -l $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_2

echo "- - - - - - - - - - - - - - - - -"

echo "Check grep -n option..."
leaks -atExit -- ./s21_grep -n $PATTERN_2_1 $TEST_FILE_1

echo "- - - - - - - - - - - - - - - - -"

echo "Check grep -n option..."
leaks -atExit -- ./s21_grep -n $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_2

echo "- - - - - - - - - - - - - - - - -"

echo "Check grep -h option..."
leaks -atExit -- ./s21_grep -h $PATTERN_2_1 $TEST_FILE_1

echo "- - - - - - - - - - - - - - - - -"

echo "Check grep -h option..."
leaks -atExit -- ./s21_grep -h $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_2

echo "- - - - - - - - - - - - - - - - -"

echo "Check grep -s option..."
leaks -atExit -- ./s21_grep -s $PATTERN_2_1 something

echo "- - - - - - - - - - - - - - - - -"

echo "Check grep -s option..."
leaks -atExit -- ./s21_grep -s $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_3

echo "- - - - - - - - - - - - - - - - -"

echo "Check grep -f option..."
leaks -atExit -- ./s21_grep -f $REGEX_PATTERN_FILE grep.c

echo "- - - - - - - - - - - - - - - - -"

echo "Check grep -f option..."
leaks -atExit -- ./s21_grep -f $REGEX_PATTERN_FILE -e char grep.c

echo "- - - - - - - - - - - - - - - - -"

echo "Check grep -o option..."
leaks -atExit -- ./s21_grep -o int grep.c

echo "- - - - - - - - - - - - - - - - -"

echo "Check grep -o option..."
leaks -atExit -- ./s21_grep -o $PATTERN_2_1 $TEST_FILE_1 $TEST_FILE_2

echo "- - - - - - - - - - - - - - - - -"

echo "Check grep -iv option..."
leaks -atExit -- ./s21_grep -iv $PATTERN_2_1 $TEST_FILE_1

echo "- - - - - - - - - - - - - - - - -"

echo "Check grep -in option..."
leaks -atExit -- ./s21_grep -in $PATTERN_2_1 $TEST_FILE_1

echo "- - - - - - - - - - - - - - - - -"

echo "Check grep -ic option..."
leaks -atExit -- ./s21_grep -ic $PATTERN_2_1 $TEST_FILE_1

echo "- - - - - - - - - - - - - - - - -"

echo "Check grep -il option..."
leaks -atExit -- ./s21_grep -il $PATTERN_2_1 $TEST_FILE_1

echo "- - - - - - - - - - - - - - - - -"

echo "Check grep -ih option..."
leaks -atExit -- ./s21_grep -ih $PATTERN_2_1 $TEST_FILE_1

echo "- - - - - - - - - - - - - - - - -"

echo "Check grep -io option..."
leaks -atExit -- ./s21_grep -io $PATTERN_2_1 $TEST_FILE_1

echo "- - - - - - - - - - - - - - - - -"

echo "Check grep -n -e option..."
leaks -atExit -- ./s21_grep -n -e $PATTERN_2_1 $TEST_FILE_1

echo "- - - - - - - - - - - - - - - - -"