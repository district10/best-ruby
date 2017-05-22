all: doc
doc:	
	java -jar md2html.jar -fel -i . -o docs
watch:	
	java -jar md2html.jar -wfel -i . -o docs
clean:
	rm -rf docs
