mkdir -p hmm1; HERest -T 1 -C config1 -I phones0.mlf -t 250.0 150.0 1000.0 -S scp/train.scp -H hmm0/macros -H hmm0/hmmdefs -M hmm1 monophones0

mkdir -p hmm2; HERest -T 1 -C config1 -I phones0.mlf -t 250.0 150.0 1000.0 -S scp/train.scp -H hmm1/macros -H hmm1/hmmdefs -M hmm2 monophones0

mkdir -p hmm3; HERest -T 1 -C config1 -I phones0.mlf -t 250.0 150.0 1000.0 -S scp/train.scp -H hmm2/macros -H hmm2/hmmdefs -M hmm3 monophones0

