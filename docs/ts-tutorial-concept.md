Here’s a clean plan + two starter cells you can drop into a Jupyter/Colab notebook.

On-ramp plan (no code yet)

Notebook basics — cells, running code, print, comments.

Variables & core data types — int, float, str, bool, NoneType; type(); basic casting.

Collections — lists, tuples, dictionaries, sets; when to use which.

Operators — arithmetic, comparison, logical, membership (in), identity (is).

Control flow — if / elif / else; truthiness; chaining conditions.

Loops — for with range() and enumerate(), iterating dicts, while, break/continue.

Functions — parameters (positional, keyword, defaults), return values, docstrings, scope.

String skills — slicing, f-strings, common methods, basic regex (optional).

List skills — methods, slicing, list comprehensions.

Dictionaries — nested dicts, .get(), keys/values/items, dict comprehensions.

Modules & packages — import, the standard library, virtual environments (conceptual).

Files & JSON — reading/writing text files; json module.

Errors & exceptions — reading tracebacks; try/except; raising errors.

Mini-project (capstone) — Taylor Swift Playlist Analyzer: load a small album/track dataset; compute stats (song counts, average length), filter tracks, format a setlist.

(Optional) Classes / dataclasses — modeling Song, Album.

Testing mindset — assertions, simple tests.

Cell 1 — Variables & Types (Taylor theme)
# Taylor Swift — Variables & Types

# Strings (text)
artist = "Taylor Swift"
era = "1989 (Taylor’s Version)"

# Integers (whole numbers)
debut_year = 2006
grammys_won = 14  # update as needed

# Floats (numbers with decimals)
avg_track_length_minutes = 3.85

# Booleans (True/False)
is_on_tour = True

# None (the “no value yet” placeholder)
surprise_song = None

# Peek at values and their types
print(artist, "→", type(artist))
print(debut_year, "→", type(debut_year))
print(avg_track_length_minutes, "→", type(avg_track_length_minutes))
print(is_on_tour, "→", type(is_on_tour))
print(surprise_song, "→", type(surprise_song))

# Combining strings with f-strings (preferred)
print(f"{artist} re-recorded {era} and averages ~{avg_track_length_minutes} minutes per track.")

# Casting between types (be intentional!)
year_str = str(debut_year)     # int → str
tracks_str = "16"
tracks_int = int(tracks_str)   # str of digits → int

print("Year as string:", year_str, "→", type(year_str))
print("Tracks as int:", tracks_int, "→", type(tracks_int))

# Tiny practice:
# 1) Change avg_track_length_minutes to 4.05 and re-run the f-string line above.
# 2) Make a new variable 'tour_years' as an int and print a sentence about it with an f-string.

Cell 2 — Lists (Arrays) & Dictionaries (Objects)
# Taylor Swift — Lists & Dictionaries

# A list (array) of songs on an album (order matters, duplicates allowed)
songs_1989_tv = [
    "Welcome To New York",
    "Blank Space",
    "Style",
    "Out Of The Woods",
    "All You Had To Do Was Stay",
    "Shake It Off",
    "I Wish You Would",
    "Bad Blood",
    "Wildest Dreams",
    "How You Get The Girl",
    "This Love",
    "I Know Places",