cat sentences.txt | head -40 | sed "s/ı/I/g" | sed "s/i/İ/g"  \
| sed "s/ç/Ç/g" | sed "s/ş/Ş/g" |sed "s/ö/Ö/g" | sed "s/ü/Ü/g" \
| sed "s/ğ/Ğ/g" | tr "[a-z]" "[A-Z]" > /tmp/sentences.txt
cat /tmp/sentences.txt | perl ./toMLF.prl  > words.mlf
HCopy -T 1 -C config -S scp/codestr.scp
cat /tmp/sentences.txt |  tr " :,.?\!" "\n\n\n\n\n" |  \
sort -u     | sed '/^\s*$/ d'   > dict.tmp
cat dict.tmp | python3 pron.py > dict
HLEd -l '*' -d dict -i phones0.mlf mkphones0.led  words.mlf #step 7
mkdir -p hmm0; HCompV -T 1 -C config1 -f 0.01 -m -S scp/train.scp -M hmm0 proto #step 10
bash clone.sh #step 11
bash firstthree.sh #step 12-a
cp -r hmm3 ./hmm4 

#cp monophones0 monophones1 ; echo sil >> monophones1
#mkdir hmm5; HHEd -H hmm4/macros -H hmm4/hmmdefs -M hmm5 sil.hed monophones1
