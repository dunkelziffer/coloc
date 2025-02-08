# A proposal for a resource-oriented file structure for Rails applications

- Did it ever bother you that Rails sorts files by "type" and not by "namespace"?
- Did you notice that Rails' naming convention `appends` the "type" to the file, making it the least significant part of the file name.
- So from Ruby's perspective, files should actually already be sorted by "namespace".
- Rails does a lot of work (aka `zeitwerk`) to create this separation by "type".
- We are free to simply ignore that.

Take a look at [`app/resources/`](https://github.com/dunkelziffer/coloc/tree/main/app/resources) and this [commit](https://github.com/dunkelziffer/coloc/commit/6ba592e03e156dcc722a16787350d2910ada0052)!
