## Countries seeds

No need for a gem for this one.

Simple Migration and Seeds file for adding Countries to your Rails app.

Run the migration or use the rails generator

```bash
  rails g model Country name:string:index offical_name:string sovereignty:string iso_alpha_two:string:index iso_alpha_three:string:index iso_numeric:integer:index subdivision_codes:string tld:string
```

Copy over your seeds, seed them in your usual way, and viola!

That's it!

## Caveats

When you run the parser there are a few countries that are broken and need manually fixing.

I do not have time to work out the problem, more than happy to take a pull request that deals with the errors that happen.
