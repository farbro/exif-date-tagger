# exif-date-tagger.sh

Bash script that renames a directory using the date from the oldest photo or video it contains.

## Prerequisites
* `exiftool`
* `date`

## Usage
```
./exif-date-tagger.sh [DIRECTORY] [TAG_FORMAT]
```
### Arguments
1. `[DIRECTORY]` - directory to scan for media. ** Default: `.`**
2. `[TAG_FORMAT]` - Tag format for renaming of the directory. ** Default: `-%Y-%m %f`**. Interpreted sequences are:
  * `%f` current directory name.
  *  all sequances listed in `man date`.

## Example
```
./exif-date-tagger.sh /path/to/photoalbum

``` 
The script will now scan recursively scan through the whole directory for photos and videos and find the oldest capture date. This is being used to rename the directory into:
`YYYY-MM photoalbum`

Use with `find` to batch process multiple directories:
```find /path/to/directories/ -maxdepth 1 -type d -exec /path/to/exif-date-tagger.sh "{}" \;```




