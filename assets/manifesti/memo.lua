function interp(s, tab)
  return (s:gsub('($%b{})', function(w) return tab[w:sub(3, -2)] or w end))
end
-- print( interp("${name} is ${value}", {name = "foo", value = "bar"}) )

getmetatable("").__mod = interp
print( [[\Large
\color{dampBlack}
\begin{flushright}
  \vspace*{3mm}
  \hrulefill\\[2em]
  \noindent\fsize{60}{\textbf{ItaCa Fest ${edition}}}\\[4mm]
  \fsize{36}{\textbf{${day} --- \href{${url}}{14:00 CEST}}}\\[2em]
\end{flushright}

\vspace*{\fill}]] % {edition = "II", day = "July 16, 2020", url = "https://cesnet.zoom.us/j/92938745753"} )