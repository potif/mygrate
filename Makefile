compile:
	@node_modules/.bin/coffee -c -o . src

clean:
	@rm -rf lib
	@rm -rf migrations/20*

