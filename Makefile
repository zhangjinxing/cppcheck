SRCS=checkbufferoverrun.cpp	checkclass.cpp	checkheaders.cpp	checkmemoryleak.cpp	checkfunctionusage.cpp	checkother.cpp	filelister.cpp	preprocessor.cpp	tokenize.cpp	cppcheck.cpp	settings.cpp token.cpp cppcheckexecutor.cpp	errormessage.cpp
OBJS=$(SRCS:%.cpp=%.o)
TESTS=testbufferoverrun.o	testcharvar.o	testclass.o	testconstructors.o	testdivision.o  testfunctionusage.o	testincompletestatement.o	testother.o	testmemleak.o	testmemleakmp.o	testpreprocessor.o	testredundantif.o	testsimplifytokens.o	testtokenize.o	testtoken.o	testunusedprivfunc.o	testunusedvar.o	testfilelister.o
BIN = ${DESTDIR}/usr/bin
CFLAGS = -Wall -pedantic -g

all:	${OBJS} main.o
	g++ $(CFLAGS) -o cppcheck $^
test:	${OBJS} testrunner.o	testsuite.o	${TESTS}
	g++ $(CFLAGS) -o testrunner $^
cppcheckexecutor.o: cppcheckexecutor.cpp cppcheckexecutor.h cppcheck.h errorlogger.h
	g++ $(CFLAGS) -c $*.cpp
cppcheck.o: cppcheck.cpp cppcheck.h settings.h errorlogger.h preprocessor.h tokenize.h token.h checkmemoryleak.h checkbufferoverrun.h checkclass.h checkheaders.h checkother.h checkfunctionusage.h filelister.h
	g++ $(CFLAGS) -c $*.cpp
main.o: main.cpp cppcheck.h settings.h errorlogger.h
	g++ $(CFLAGS) -c $*.cpp
checkbufferoverrun.o: checkbufferoverrun.cpp checkbufferoverrun.h tokenize.h settings.h errorlogger.h token.h
	g++ $(CFLAGS) -c $*.cpp
checkclass.o: checkclass.cpp checkclass.h tokenize.h settings.h errorlogger.h token.h
	g++ $(CFLAGS) -c $*.cpp
checkfunctionusage.o: checkfunctionusage.cpp checkfunctionusage.h tokenize.h settings.h errorlogger.h token.h
	g++ $(CFLAGS) -c $*.cpp
checkheaders.o: checkheaders.cpp checkheaders.h tokenize.h settings.h errorlogger.h token.h
	g++ $(CFLAGS) -c $*.cpp
checkmemoryleak.o: checkmemoryleak.cpp checkmemoryleak.h tokenize.h settings.h errorlogger.h token.h
	g++ $(CFLAGS) -c $*.cpp
checkother.o: checkother.cpp checkother.h tokenize.h settings.h errorlogger.h token.h
	g++ $(CFLAGS) -c $*.cpp
filelister.o: filelister.cpp filelister.h
	g++ $(CFLAGS) -c $*.cpp
preprocessor.o: preprocessor.cpp preprocessor.h errorlogger.h token.h tokenize.h
	g++ $(CFLAGS) -c $*.cpp
settings.o: settings.cpp settings.h
	g++ $(CFLAGS) -c $*.cpp
errormessage.o: errormessage.cpp errormessage.h
	g++ $(CFLAGS) -c $*.cpp
testbufferoverrun.o: testbufferoverrun.cpp tokenize.h settings.h errorlogger.h token.h checkbufferoverrun.h testsuite.h
	g++ $(CFLAGS) -c $*.cpp
testcharvar.o: testcharvar.cpp tokenize.h settings.h errorlogger.h token.h checkother.h testsuite.h
	g++ $(CFLAGS) -c $*.cpp
testclass.o: testclass.cpp tokenize.h settings.h errorlogger.h token.h checkclass.h testsuite.h
	g++ $(CFLAGS) -c $*.cpp
testconstructors.o: testconstructors.cpp tokenize.h settings.h errorlogger.h token.h checkclass.h testsuite.h
	g++ $(CFLAGS) -c $*.cpp
testdivision.o: testdivision.cpp tokenize.h settings.h errorlogger.h token.h checkother.h testsuite.h
	g++ $(CFLAGS) -c $*.cpp
testfunctionusage.o: testfunctionusage.cpp tokenize.h settings.h errorlogger.h token.h testsuite.h checkfunctionusage.h
	g++ $(CFLAGS) -c $*.cpp
testincompletestatement.o: testincompletestatement.cpp testsuite.h errorlogger.h tokenize.h settings.h token.h checkother.h
	g++ $(CFLAGS) -c $*.cpp
testother.o: testother.cpp testsuite.h errorlogger.h tokenize.h settings.h token.h checkother.h
	g++ $(CFLAGS) -c $*.cpp
testmemleak.o: testmemleak.cpp tokenize.h settings.h errorlogger.h token.h checkmemoryleak.h testsuite.h
	g++ $(CFLAGS) -c $*.cpp
testmemleakmp.o: testmemleakmp.cpp tokenize.h settings.h errorlogger.h token.h checkmemoryleak.h testsuite.h
	g++ $(CFLAGS) -c $*.cpp
testpreprocessor.o: testpreprocessor.cpp testsuite.h errorlogger.h preprocessor.h
	g++ $(CFLAGS) -c $*.cpp
testredundantif.o: testredundantif.cpp testsuite.h errorlogger.h checkother.h
	g++ $(CFLAGS) -c $*.cpp
testrunner.o: testrunner.cpp testsuite.h errorlogger.h
	g++ $(CFLAGS) -c $*.cpp
testsimplifytokens.o: testsimplifytokens.cpp testsuite.h errorlogger.h tokenize.h settings.h token.h
	g++ $(CFLAGS) -c $*.cpp
testsuite.o: testsuite.cpp testsuite.h errorlogger.h
	g++ $(CFLAGS) -c $*.cpp
testtoken.o: testtoken.cpp testsuite.h errorlogger.h token.h
	g++ $(CFLAGS) -c $*.cpp
testtokenize.o: testtokenize.cpp testsuite.h errorlogger.h tokenize.h settings.h token.h
	g++ $(CFLAGS) -c $*.cpp
testunusedprivfunc.o: testunusedprivfunc.cpp tokenize.h settings.h errorlogger.h token.h checkclass.h testsuite.h
	g++ $(CFLAGS) -c $*.cpp
testunusedvar.o: testunusedvar.cpp testsuite.h errorlogger.h tokenize.h settings.h token.h checkother.h
	g++ $(CFLAGS) -c $*.cpp
testfilelister.o: testfilelister.cpp filelister.h
	g++ $(CFLAGS) -c $*.cpp
token.o: token.cpp token.h
	g++ $(CFLAGS) -c $*.cpp
tokenize.o: tokenize.cpp tokenize.h settings.h errorlogger.h token.h filelister.h
	g++ $(CFLAGS) -c $*.cpp

clean:
	rm -f *.o testrunner cppcheck
install:	cppcheck
	install -d ${BIN}
	install cppcheck ${BIN}

