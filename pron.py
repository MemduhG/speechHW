import sys

sd = dict()

caps = "ABCDEFGHJKLMNOPQRSTUVWXYZ" #omit I

sd["ç"] = "ch"
sd["ş"] = "sh"
sd["ü"] = "ue"
sd["ö"] = "oe"
sd["ğ"] = "gh"
sd["ı"] = "schwa"
sd["î"] = "i"
sd["â"] = "a"
sd["û"] = "u"

def phonemize(word, swap_dict):
    inp = word
    word = word.replace("I","ı").replace("İ","i").lower()
    out = ""
    for item in word:
        try: out += swap_dict[item] + " "
        except KeyError: out+= item + " "

    out = out.strip() + " sp"
    return out

if __name__ == "__main__":
    for line in sys.stdin.readlines():
        p = phonemize(line.strip("\n"), sd)
        sys.stdout.write(line.strip("\n") + "\t" + p + "\n")

