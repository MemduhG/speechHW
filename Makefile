all:
	cat sentences.txt | head -40 | perl ./toMLF.prl  > words.mlf
	HCopy -T 1 -C config -S scp/codestr.scp
	cat sentences.txt |   PERLIO=:utf8 perl -pe '$_=uc'| tr " :,.?\!" "\n\n\n\n\n" |  \
	sort -u     | sed '/^\s*$/ d'   > dict.tmp
	cat dict.tmp | perl ./pron.prl > dict

