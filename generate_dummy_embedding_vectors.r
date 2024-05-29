
n <- 20

energie <- runif(n)
ozean <- runif(n)
football <- runif(n)

strom <- energie + runif(n, 0, 0.3) - 0.15
meer <- ozean + runif(n, 0, 0.3) - 0.15
rugby <- football + runif(n, 0, 0.3) - 0.1


library(ggplot2)
library(dplyr)

df <- tibble(energie, ozean, football, strom, meer, rugby) |>
    mutate(id = row_number()) |>
    tidyr::pivot_longer(cols = -id, names_to = "variable", values_to = "value") |>
    mutate(variable = factor(variable, levels = c("energie", "strom", "meer", "ozean", "football", "rugby")))


ggplot(df, aes(y = variable, x = id, color = value)) +
scale_color_gradient(low = "#77C8C0", high = "#DD6E64") +
geom_point(shape = "square", size = 17) +
theme_void() +
theme(legend.position = "none")


ggsave("output.png", width = 5, height = 5, dpi = 600)
