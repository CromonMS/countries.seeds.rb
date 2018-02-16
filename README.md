## Countries seeds

No need for a gem for this one.

Simple Migration and Seeds file for adding Countries to your Rails app.

Run the migration or use the rails generator

```bash
  rails g model Country name:string:index iso_alpha_two:string:index iso_alpha_three:string:index iso_numeric:integer:index
```

Copy over your seeds, seed them in your usual way, and viola!

That's it!
