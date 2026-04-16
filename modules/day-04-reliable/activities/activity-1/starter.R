library(ggplot2)
### The functions ----
compute_iou <- function(box_a, box_b) {
  x_left <- max(box_a[1], box_b[1])
  y_top <- max(box_a[2], box_b[2])
  x_right <- min(box_a[3], box_b[3])
  y_bottom <- min(box_a[4], box_b[4])

  inter_width <- x_right - x_left
  inter_height <- y_bottom - y_top
  inter_area <- inter_width * inter_height

  area_a <- (box_a[3] - box_a[1]) * (box_a[4] - box_a[2])
  area_b <- (box_b[3] - box_b[1]) * (box_b[4] - box_b[2])
  union_area <- area_a + area_b - inter_area

  iou = inter_area / union_area
  
  return(iou)
}

add_iou_all_frames <- function(box_pairs) {
  for (row in 1:nrow(box_pairs)) {
    box_a <- c(box_pairs[row, "box_a_x1"], box_pairs[row, "box_a_y1"], box_pairs[row, "box_a_x2"], box_pairs[row, "box_a_y2"])
    box_b <- c(box_pairs[row, "box_b_x1"], box_pairs[row, "box_b_y1"], box_pairs[row, "box_b_x2"], box_pairs[row, "box_b_y2"])

    box_pairs[row, "iou"] <- compute_iou(box_a, box_b)
  }
  return(box_pairs)
}

build_agreement_curve <- function(box_pairs) {
  thresholds <- seq(0, 1, by = 0.05)
  agreement_curve <- data.frame(
    iou_threshold = thresholds,
    percent_agreement = sapply(thresholds, function(threshold) {
      mean(box_pairs$iou >= threshold, na.rm = TRUE) * 100
    })
  )
  return(agreement_curve)
}

### Test the functions ----
box_pairs <- read.csv("mock_box_pairs.csv")
box_pairs_w_iou <- add_iou_all_frames(box_pairs)
curve_info <- build_agreement_curve(box_pairs_w_iou)

ggplot(curve_info, aes(x = iou_threshold, y = percent_agreement)) +
  geom_line() +
  geom_point() +
  labs(x = "IoU Threshold", y = "% Agreement") +
  theme_bw()

