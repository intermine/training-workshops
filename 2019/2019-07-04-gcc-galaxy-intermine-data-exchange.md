# Handling integrated biological data using Python, Jupyter, and InterMine

## Galaxy Community Conference July 4 2019


### Moving data between Galaxy and InterMine

#### Galaxy ➡ to ➡ InterMine

To move data from Galaxy to an InterMine, you'll need:

##### Prerequisites

1. An idea of which InterMine you want to use to analyse your data. To find this, visit the InterMine registry at [registry.intermine.org](http://registry.intermine.org) and see which InterMine(s) have data for your organism.
2. A list of Genes, Proteins, or some other InterMine entity (we'll show you how to do this next).
3. You'll need to use a Galaxy with the [InterMine data exchange format tool](https://toolshed.g2.bx.psu.edu/repository?repository_id=a9ece3bc24648391&changeset_revision=c24014d80001) installed. Currently this means:
  - [UseGalaxy.eu](https://usegalaxy.eu/)
  - [UseGalaxy.org](https://usegalaxy.org/)
  - If you want it on another Galaxy instance, ask your admin to install [the InterMine exchange format tool](√https://toolshed.g2.bx.psu.edu/repository?repository_id=a9ece3bc24648391&changeset_revision=c24014d80001)

##### Exporting the data

To get your data from Galaxy to InterMine, you'll need to convert your list of Genes or Proteins to an InterMine exchange format file. The file definition has three columns:

- Identifier type (e.g. `Gene`, `Protein`)
- Identifier (e.g. `BRCA1`)
- Optional: Organism name, e.g. H. sapiens

We'll run a workflow that assumes you're uploading a list of identifiers from a tsv/csv file, but if you use Galaxy  you should be able to tie this in to your workflows as well. You can view or upload our [sample file](https://github.com/intermine/galaxy-integration/blob/master/intermine-file-format/intermine-format-example.tsv) if you don't have any ids right now.

1. Log in to your Galaxy and upload your file of identifiers (upload button is located on the top right)
2. Once the job has run successfully, in the search bar on the top left of Galaxy, search for InterMine and choose `Create InterMine Interchange Dataset`.
3. Select your file of identifiers from the "tabular file" dropdown in the tool.
4. Next, you'll need to tell Galaxy which columns contain the identifier type, the identifier itself, and the organism (if using). You can also type these values in manually if needed. When using the sample file, we filled it out as follows:
  - **Feature Type Column**: Column 1 (The column in this case contains the word `Gene`)
  - **Feature Type**: Leave blank. (If our data file didn't contain the word `Gene` already, we could type it here instead.)
  - **Feature Identifier Column**: Column 2. This is the column with our identifiers, e.g. this might contain `BRCA1`, `PPARG`, and `AVP`.
  - **Feature identifier**: Leave blank. (You could put something in this field, but it would override all your identifiers that you had in your uploaded tsv file - probably not what we wanted in this case!)
  - **Organism name column**: If your data has a column with organism names, select it here. In our case it is column 3.
  - **Organism name**: Leave blank. (If your data didn't have an organism name, but you wanted to set one, you could write it in this field - e.g. if you knew all your genes were `Homo sapiens`).



#### InterMine ➡ to ➡ Galaxy
