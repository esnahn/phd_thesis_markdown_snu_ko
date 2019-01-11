# Introduction, with a citation

## Background

This is the introduction. To include a citation to the text, just add the citation key shown in the references.bib file. The style of the citation is determined by the ref_format.csl file. For example, cite like this [@Cousteau1963].

<!-- 
To include a reference, add the citation key shown in the references.bib file.
-->

## Maths

Numbered equations are assisted by installing [pandoc-crossref](https://github.com/lierdakil/pandoc-crossref):

$$ \rho c \frac{\partial T}{\partial t} =  \frac{\partial q} {\partial x} $$ {#eq:yourlabel}

Now you can reference your equations (@eq:yourlabel) inline. If using pandoc-crossref, add the following to each relevant section of the makefile. 

```--filter pandoc-crossref``` 

Non numbered equations:
$$ \rho c \frac{\partial T}{\partial t} =  \frac{\partial q} {\partial x} $$

## The middle bit

This is the middle bit. Phasellus quis ex in ipsum pellentesque lobortis tincidunt sed massa. Nullam euismod sem quis dictum condimentum. Suspendisse risus metus, elementum eu congue quis, viverra ac metus. Donec non lectus at lectus euismod laoreet pharetra semper dui. Donec sed eleifend erat, vel ultrices nibh. Nam scelerisque turpis ac nunc mollis, et rutrum nisl luctus.

Cras eleifend velit diam, eu viverra mi volutpat ut. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec finibus leo nec dui imperdiet, tincidunt ornare orci venenatis. Maecenas placerat efficitur est, eu blandit magna hendrerit eu.

### Subsection of the middle bit

This is a subsection of the middle bit. Quisque sit amet tempus arcu, ac suscipit ante. Cras massa elit, pellentesque eget nisl ut, malesuada rutrum risus. Nunc in venenatis mi. Curabitur sit amet suscipit eros, non tincidunt nibh. Phasellus lorem lectus, iaculis non luctus eget, tempus non risus. Suspendisse ut felis mi.

## Summary of chapters

<!-- 
For italic, add one * on either side of the text
For bold, add two * on either side of the text
For bold and italic, add _** on either side of the text
-->

This is a brief outline of what went into each chapter. **Chapter 1** gives a background on duis tempus justo quis arcu consectetur sollicitudin.  **Chapter 2** discusses morbi sollicitudin gravida tellus in maximus.  **Chapter 3** discusses vestibulum eleifend turpis id turpis sollicitudin aliquet.  **Chapter 4** shows how phasellus gravida non ex id aliquet. Proin faucibus nibh sit amet augue blandit varius.


