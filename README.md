# Quarto PhD thesis template for ETH Zurich

This is a template that is intended to meet the [requirements](https://ethz.ch/students/en/doctorate/doctoral-thesis-examination.html) for cumulative paper PhD thesis at ETH Zurich. However, it is worth noting that there may be discrepancies between departments and as such you should check the requirements for your department (My thesis was under D-BAUG).

I built this template based upon the `quarto-phd-thesis` template from `james-d-h`: <https://github.com/james-d-h/quarto-phd-thesis>. I added some notable features including:

-    The ability to add a cover page using the [`quarto_titlepages`](https://nmfs-opensci.github.io/quarto_titlepages/) extension

-   Custom themes and functions to ensure consistent formatting of all figures and tables according to user specified color palettes.

-   Use of `.Rprofile` to manage package loading across chapters

-   The ETH title page and a translated version of the summary into one of the Swiss national languages.

-   Custom Quarto call-out boxes to display the details of published articles at the start of chapters including a visualization of author [CRediT](https://www.elsevier.com/researcher/author/policies-and-guidelines/credit-author-statement) contributions.

-   Additional LaTeX formatting

## Usage

To use this template for your PhD thesis, you can enter in the terminal:

``` bash
quarto use template blenback/quarto-eth-phd-thesis
```

It will ask for an empty directory name where to put the files, give it a new directory name.

Once you do that you can render from within the directory.

``` bash
quarto render
```

## Structure




## Formatting

### .Rprofile for package loading and unified figure/table theming

## Cover page

## Front matter

### Translated summary

### ETH Zurich title page

## Chapters

### Custom call-out boxes for original article details

## End matter

### Refences

### Appendices

### Curriculum vitae
