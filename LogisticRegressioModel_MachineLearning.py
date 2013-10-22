

from Bio import LogisticRegression

file = open ("20_Comparation_PC1.txt", "r")

xs = []

ys = []

for line in file :
	aux = []
	line = line [: len (line) - 1]
	line = line.split (",")
	aux.append (float (line [0]))
	xs.append (aux)
	ys.append (int (line [1]))

print type (xs[1])
	
print xs 
print ys
file.close ()

model = LogisticRegression.train(xs, ys)

for i in range ( len (ys) ) :
	print "True:", ys[i], "Predicted:", LogisticRegression.classify(model, xs[i])
	
