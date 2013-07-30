# Code Fellows App-A-Day: Grandma's Recipes

A microapplication to store and organize your favorite recipes!

As always, don't forget to run the following in your terminal prior to running the application:
```
$ rake db:migrate
```

![Homepage](/app/assets/gr-home.png "Homepage View")

From the home page, you must first sign in. From there, you can click on the link 'New Recipe' to add a recipe.

![New Recipe](/app/assets/gr-newrecipe.png "New Recipe View")

At the 'New Recipe' page, include the name/title of your recipe, and the ingredients needed. Click 'Create Recipe' to save.

![New Direction](/app/assets/gr-newdirection.png "New Direction View")

Click 'New Direction' from there to add the steps for your recipe. Be sure to include the step number and details instructions. Click 'Create Direction' to save your direction.

![Recipe](/app/assets/gr-recipelist.png "Recipe View")

Your recipe will be shown as above. You can select 'Back to All Recipes' to see your total collection.

![List of Recipes](/app/assets/gr-addedrecipes.png "List of All Recipes View")

### References
This application has been brought to you by:
* Rails4
* RSpec
* Capybara
* Devise
* Nested Resources
* Has Many/Belongs To Associations
