# Handling integrated biological data using Python, Jupyter, and InterMine

## Galaxy Community Conference July 4 2019


### Moving data between Galaxy and InterMine

#### InterMine ➡ to ➡ Galaxy

1. Search Galaxy for "InterMine" (not case sensitive; "intermine" is fine too), and click on "InterMine Server" under "Get Data". _(Note: You may see other InterMines such as FlyMine or RatMine - it's fine to use those if they meet your needs; the InterMine server tool encompasses more InterMine instances and therefore a broader range of organisms)._
2. This will redirect you to the InterMine registry, which shows a full list of InterMines and the various organisms they support. Find an InterMine that has the organism type you're working with, and click on it to redirect to that InterMine
3. Once you arrive at your InterMine of choice, run a query as normal - this could be a search, a list results page, a template, or a query in the query builder. Eventually you'll be presented with an [InterMine results table](https://flymine.readthedocs.io/en/latest/results-tables/Documentationresultstables.html).
4. Click on export (top right). This will bring up a modal window.
5. Select "send to Galaxy" and double-check the Galaxy URL is correct.
6. Click on the "Send to Galaxy" button on the bottom right of the pop-up window. **Important** - if you get an error at this point, please make sure to allow popups and try again.
7. Ta-dah! You have now exported your query results from InterMine to Galaxy.

This workflow can also be initiated from within an InterMine without visiting the Galaxy tool first. 

#### Galaxy ➡ to ➡ InterMine

Coming soon!
