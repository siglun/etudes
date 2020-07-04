#!/usr/bin/Rscript


# week olera kolera cholera epidemi pest farsot
# olera is the some of kolera and cholera

series <- read.table(file = "weekly_counts.txt",
                     col.names = c("week","olera","kolera","cholera","epidemi","pest","farsot"),
                     sep = "",
                     quote = "\"",
                     dec = ".",
                     fill = TRUE,
                     comment.char = "#")

pdf( "weekly_mentions.pdf", width = 7, height = 5 )

# cairo_ps("image.eps")

plot(x = series$week,
     y = series$olera,
     type = "l",
     ylab = "Occurence in corpus",
     xlab = "Week")
