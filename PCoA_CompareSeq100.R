

compTable<- function (arch, table) {
		f0 <- read.csv(arch, header = FALSE )
		y <- t (f0)
		y <- as.data.frame (y)
		table <- rbind (table, y [2,])
		return (table)
} 


x <- getwd()



for (g in 0:99) 
{
	name <- paste ("Brucella_melitensis_bv._1_str._16M_chromosome_I,_complete_sequence_ConcatenatedCodingSeq_", g,".faa.comp.csv", sep = "")
	for ( i in 0:99) 
	{
		name2 <- paste ("Brucella_melitensis_bv._1_str._16M_chromosome_I,_complete_sequence_ConcatenatedCodingSeq_", i,".faa.comp.csv", sep = "")
		table <- c ()
		arch1 <- paste (x, "/", name, sep = "")
		arch2 <- paste (x, "/", name2, sep = "")
		table <- compTable (arch1, table) 
		table <- compTable (arch2, table)
		fileOut1 = paste (g,"_", i , "_PCoAGenomes.csv", sep = "")
		write.table (table, file = fileOut1 , sep = ",")
		y <- read.csv (fileOut1, header = TRUE)
		y.pca <- prcomp (y , scale = FALSE , center = TRUE)
		fileOut2 = paste (g,"_", i , "_MachineLearning.csv", sep = "")
		write.table (y.pca$x [ ,1:2], file = fileOut2 , sep = ",")
	}
}
		
		


