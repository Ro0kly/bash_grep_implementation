s21_grep:
	gcc -Wall -Werror -Wextra grep.c -o s21_grep

clean:
	rm -rf s21_grep

rebuild:
	make clean
	make s21_grep