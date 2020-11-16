# Load the InterMine library.  If you don't have it installed, visit the Bioconductor site and follow the instructions for installation.

library(InterMineR)

# We want to query Human data so we will set our R queries up for HumanMine:
# Remember to add your own token

im <- initInterMine(mine=listMines()["HumanMine"], "j1q44e90S1Q4i6RekaB8")

# We will just run one query to show you the basics of how a query can be constucted in InterMineR.  
# We will then look at running the Enrcihment widget on a list and visulaising the results from this.

# We will construct the Genes with OMIM diabetes query that you made in the Python tutorial and in the query builder


# We need to select the gene primary identifer and symbol for our ouput and apply constraints to the organsim.name 
#and diseases.name attributes:

#  1. Ensure all genes returned are Home sapiens genes (HumanMine contains some non-human genes for homology query purposes)
#  2. Restrict results to genes that are associated with diabetes.

query1Diabetes <- setQuery( 
  select = c("Gene.primaryIdentifier", "Gene.symbol"),
  where = setConstraints(
    paths = c("Gene.organism.name", "Gene.diseases.name"),
    operators = c("=", "CONTAINS"),
    values = list("Homo sapiens","diabetes")
  ))


#that was just setting up the query - we haven't run it yet

query1DiabetesResults <- runQuery(im,query1Diabetes)

# Show the first few results
head(query1DiabetesResults) 



#That has shown you how to run a query.  
#Now, instead of contimuiing with the workflow we used before, we will take a look at how you can run the enrichment widget 
#and then feed the results of this into some visualisations.  
#We will use the public list, PL_GenomicsEngland_GenePanel:Genetic_Epilepsy_Syndromes, from HumanMine.

#  First take a look at the widgets that are provided with HumanMine:

human.widgets = as.data.frame(getWidgets(im))

subset(human.widgets, widgetType == 'enrichment' & targets == "Gene")


# Now we will run the GO enrichment widget using the genes from the list:


GOEnrichmentResult = doEnrichment(
  im = im,
  genelist = "PL_GenomicsEngland_GenePanel:Genetic_Epilepsy_Syndromes",
  widget = "go_enrichment_for_gene"
)

# and view the results:

GOEnrichmentResult


#For the visualisation, we'll need both the enrichment results and the list of genes we originally enriched - 
#Fbut the list is still on the server. Let's run a query to get the primaryIdentifiers for the genes 
#Fin PL_GenomicsEngland_GenePanel:Genetic_Epilepsy_Syndromes. This step will be easier in the next release of InterMineR 
#Fwhere we have improved the list management  methods.

queryEpilepsy <- setQuery(
  select = c("Gene.primaryIdentifier"),
  where = setConstraints(
      paths = c("Gene"),
      operators = c("IN"),
      values = list("PL_GenomicsEngland_GenePanel:Genetic_Epilepsy_Syndromes"))
)

queryEpilepsyResults <- runQuery(im, queryEpilepsy)
queryEpilepsyResults




#One advantage of using interMineR is that you can feed the results of intermine queries into other R packakges for further 
#analysis and visualisation. As a simple example we will take the results of our enrichment above and feed them into a package 
#called GeneAnswers, which allows us to visualise the results. To make this easier interMineR includes a function 
#"convertToGeneAnswers". First though, we must load up the GeneAnswers package:
	

library(GeneAnswers)


# Now create a GeneAnswers object using the function as follows:


# convert InterMineR Gene Ontology Enrichment analysis results to GeneAnswers object
queryEpilepsyForGeneAnswers = convertToGeneAnswers(
  
  # Pass the enrichment results we ran earlier to GeneAnswers:
  enrichmentResult = GOEnrichmentResult,
  
  # Pass in our original list of gene IDs 
  geneInput = data.frame(GeneID = queryEpilepsyResults, 
                         stringsAsFactors = FALSE),
  
  # in our example we use Gene.primaryIdentifier values
  geneInputType = "Gene.primaryIdentifier",
    
  # The type of enrichment widget we ran
  # in our example we use Gene Ontology (GO) terms:
  categoryType = "GO"  
)


# and take a look at this:

summary(queryEpilepsyForGeneAnswers)

# The GeneAnswers package comes with many functions for visualising results.  We will loook at some of them:

geneAnswersChartPlots(queryEpilepsyForGeneAnswers,
                      chartType='pieChart',
                      sortBy = 'correctedPvalue',
                      top = 5)


geneAnswersChartPlots(queryEpilepsyForGeneAnswers,
                      chartType='barPlot',
                      sortBy = 'correctedPvalue',
                      top = 5)



The concept net helps visualise the overlap between gene sets enriched with specified terms (in this case the top 3 GO terms)

geneAnswersConceptNet(queryEpilepsyForGeneAnswers,
                      colorValueColumn=NULL,
                      centroidSize='correctedPvalue',
                      output='interactive',
                      catTerm = FALSE,
                      catID = FALSE,
                      showCats = 1:5)


#The heatmap allows us to view genes present in the top enrcihed categories
geneAnswersHeatmap(queryEpilepsyForGeneAnswers, 
                   catTerm=TRUE, 
                   geneSymbol=TRUE)


#The concept realtion allows us to look at the relationship between the enrcihed GO terms


geneAnswersConceptRelation(queryEpilepsyForGeneAnswers,
                          directed=TRUE, 
                          output="fixed",
                          netMode='connection') 



