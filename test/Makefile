all: test.dict wdnet.lat test_sentences.txt 

test_sentences.txt: wdnet.lat test.dict
	HSGen -n 20 wdnet.lat test.dict > test_sentences.txt

wdnet.lat: wdnet.grm
	HParse wdnet.grm wdnet.lat

test.dict: wdnet.grm
	@cat wdnet.grm  | sed "s/[;=|()]/\n&\n/g"  | sed "s/ /\n/g"| grep -v '[\$|=]' | grep "^[A-Z]" | grep -v "SENT" | sort -u | python3 ../pron.py > test.dict
	@echo 'SENT-END	[]	sil' >> test.dict
	echo 'SENT-START	[]	sil' >> test.dict

clean:
	rm -f test_sentences wdnet.lat test.dict

