base="/home/memduh/git/speechHW"

all: test_codestr.scp test.scp test_words.mlf results.txt

test_codestr.scp:
	 ls -1 $(PWD)/data/*.wav | sed "s/\(.*\).lst/\1.wav \1.mfc/" > test_codestr.scp

test.scp:
	ls -1 $(PWD)/data/*.wav | sed "s/\.wav/\.mfc/" > test.scp

test_words.mlf: test_sentences.txt
	cat test_sentences.txt | perl ./toMLF.prl > test_words.mlf

results.txt:
	HVite -T 1 -C $(base)/config1 -H $(base)/hmm9/macros -H $(base)/hmm9/hmmdefs -S test.scp -l '*' -i recout.mlf -w ../wdnet.lat -p 0.0 -s 5.0 ../test.dict $(base)/monophones1

