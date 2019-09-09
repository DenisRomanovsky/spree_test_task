# README

## Task description:

Add a feature that will let admins upload products to the Spree database from a .csv file

## How to use

A form for file uploading is available at /admin/import_files/new

Index of last 10 uploads is at /admin/import_files

## What can be improved

* Add validation for file extension and size
* Move file storing from DB to cloud(ex. AWS S3)

## Tests

Run 'rspec'

## Misc:

At its current state the csv example file doesn't have all data to save Products. So tests fail.
Admin side authorisation is not stubbed. So not tests for admin side.

