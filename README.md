# YAR Writer, Resume Generator - Your Last Resume
If you are a bit retrotechno and you want to show off your TeX skills(none of those LaTeX styles here) YAR Writer might be for you.
After needing to put a resume together and recently needing to update it, I decided that I really disliked all of the tools out there that I could find, I decided to roll make my own.
This is a resume generator tool will allow you to think about the content of your resume and not how to get what ever program you are using to format it right, WYSIWYM. Well maybe not 100% of the time but a lot of the time. 
Things to know, this is a TeX(not LaTeX) generator and as such you need to know a bit about how TeX deals with your input files. Also this resume generator will need a few other non-standard tools

# Requirements:
* [xetex](https://tug.org/mactex/)
* [m4](https://www.gnu.org/software/m4)
* [git](https://git-scm.com) 
* [qrencode](https://fukuchi.org/works/qrencode/index.html.en)
* [yq](https://github.com/mikefarah/yq) - (optional) yaml configuration processing
* [pdf2htmlEX](https://coolwanglu.github.io/pdf2htmlEX/) - (optional) For conversion to HTML
* [html-minifier](https://www.npmjs.com/package/html-minifier) - (optional) For minifying the resulting html pages

# Files Included:
* ./config.yaml - If you will be pushing to a server you can edit this to to enable the "make publish" directive work. 
* ./src/resume.tex - Edit this to add your work history, education, et cetera. 

# Usage
1. Install the required software
 - maxtex2020 - or your favorite TeX distribution
 - m4, git ( on MacOS included as part of XCode command like tools )
 - pdf2htmlEX, yq, qrencode - installed from homebrew on MacOS
 - html-minifier is a node program and cam be installed via npm
2. Customize
 - Edit config.yaml 
 - Edit resume.tex
3. Build
 - to build your new resume type: ``make``
 - There are a number of build targets but the default is will build a directory called ./dist/ and the resulting resume will be in this folder

<!--# Resume code usage TODO: this needs to be written with examples
\bull
\sec{}
\school{}{}{}
\degree{}{}
\degreeflex{}{}
\business{}{}{}
\job{}{}
\desc{}
\accom{}{}{}
\article{}
\tech{}{}
-->

# License Notice
YAR Writer, Resume Generator 
Copyright(C)2020 John Hart <john@hackade.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
