all: doc
doc:	
	java -jar md2html.jar -i . -o docs
clean:
	rm -rf doc
