RM=rm -f
socket=localhost:8080

test2:
	-taskkill /F /IM php.exe 2>/dev/null
	(PATH=phpwin/php php -c . -S "$(socket)" -t . form1.php &)
	cygstart "http://$(socket)"

test:
	-taskkill /F /IM php.exe 2>/dev/null
	(PATH=phpwin/php php -c . -S "$(socket)" -t . phpinfo.php &)
	cygstart "http://$(socket)"

php.ini: phpwin/php/php.ini-production
	cp $< $@

phpwin/php/php.ini-production:
	$(MAKE) -C phpwin

clean:
	echo 'hello'

veryclean:
	$(MAKE) -C phpwin veryclean