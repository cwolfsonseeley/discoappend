model_desc_format <- function(desc)
  factor(desc, levels = c("Most Likely", "More Likely", "Somewhat Likely",
                          "Less Likely", "Least Likely"))

capacity_desc_format <- function(desc) {
  factor(desc, levels = c(
    "1 ($100M+)",
    "2 ($50M+)",
    "3 ($25M+)",
    "4 ($10M+)",
    "5 ($5M+)",
    "6 ($2M+)",
    "7 ($1M+)",
    "8 ($500K+)",
    "9 ($250K+)",
    "10 ($100K+)",
    "11 ($50K+)",
    "12 ($25K+)",
    "13 ($10K+)",
    "14 (<$10K)",
    "Cannot be rated"
  ))
}